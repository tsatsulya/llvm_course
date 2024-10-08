from collections import Counter
import matplotlib.pylab as plt

with open("pass_log.txt") as input_file:
    lines = input_file.readlines()

opcodes = []
for l in lines:
    if '<-' in l and 'call' not in l and 'load' not in l and 'store' not in l:
        opcodes.append(l.strip())


print(len(opcodes))
opcodes_count = Counter(opcodes)


fig = plt.figure(figsize=(16, 10))

y = [opcodes_count[i] for i in opcodes_count]
x = [str(i) for i in opcodes_count]
bars = plt.bar(x, y, color="salmon")

for i in range(len(x)):
    plt.text(i, y[i] // 2, f"{y[i]}", ha="center", rotation=90)

plt.grid(None, "both", "y")
plt.title("Opcodes statistics")
plt.xticks(rotation=90, fontsize=12)
plt.tight_layout()
plt.savefig('opcodes_statistics.png')