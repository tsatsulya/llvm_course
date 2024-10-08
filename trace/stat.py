from collections import Counter
import matplotlib.pylab as plt
import matplotlib
import sys

print ('argument list', sys.argv)
current_dir_path = sys.argv[1]

trace_file = open('pass_log.txt')

lines = trace_file.readlines()
opcodes = []
opcodes_ = []

for l in lines:
    if '<-' in l:
        opcodes_.append(l.strip())


for l in lines:
    if '<-' in l and 'call' not in l and 'load' not in l and 'store' not in l:
        opcodes.append(l.strip())
trace_file.close()


print(len(opcodes_))
opcodes_count = Counter(opcodes_)

def find_patterns(list_a, list_b):
    min_len = 2

    def find_ngrams(input_list, n):
        return zip(*[input_list[i:] for i in range(n)])

    seq_list_a = []
    for seq_len in range(min_len, len(list_a) + 1):
        seq_list_a += [val for val in find_ngrams(list_a, seq_len)]

    counter = {}
    for seq in seq_list_a:
        counter[seq] = counter.get(seq, 0) + 1

    filtered_counter = {k: v for k, v in counter.items() if v > 1}

    return filtered_counter

def is_cyclomatic(a, b):
    if len(a) != len(b):
        return False

    for i in range(len(a)):
        if a[i:] + a[:i] ==  b:
            return True
    return False


all_patterns = find_patterns(opcodes, opcodes).items()
patterns = [r for r in all_patterns if len(r[0]) <= 5]

def remove_cyclomatic(stat):
    is_exclusive = [1] * len(stat)
    for i in range(len(stat)):
        if not is_exclusive[i]:
            continue
        a_list = stat[i][0]
        for j in range(i + 1, len(stat)):
            b_list = stat[j][0]
            if is_cyclomatic(a_list, b_list):
                is_exclusive[j] = 0
    return [stat[i] for i in range(len(stat)) if is_exclusive[i]]

patterns = remove_cyclomatic(patterns)


fig = plt.figure(figsize=(16, 10))

y = [r[1] for r in patterns]
x = [str(i) + '*' for i in range(len(patterns))]
bars = plt.bar(x, y, color="salmon")

for i in range(len(x)):
    plt.text(i, y[i] // 2, f"{y[i]}", ha="center")

plt.grid(None, "both", "y")
plt.title("Repeated patterns")
plt.xticks(rotation=45, fontsize=15)
plt.savefig(current_dir_path + '/statistics/repeated_patterns.pdf')


fig = plt.figure(figsize=(16, 10))

y = [opcodes_count[i] for i in opcodes_count]
x = [str(i) for i in opcodes_count]
bars = plt.bar(x, y, color="salmon")

for i in range(len(x)):
    plt.text(i, y[i] // 2, f"{y[i]}", ha="center")

plt.grid(None, "both", "y")
plt.title("Opcodes statistics")
plt.xticks(rotation=90, fontsize=12)
plt.tight_layout()
plt.savefig(current_dir_path + '/statistics/opcodes_statistics.pdf')