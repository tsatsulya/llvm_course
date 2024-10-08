# with open("art/tmp") as input_file:
#     head = [next(input_file) for _ in range(10000)]

# f = open("tmp1.txt", "w")

# f.write("\n".join(head))
# f.close()
# head = [i.strip() for i in head if i != '\n']


from collections import Counter
import matplotlib.pylab as plt

with open("tmp1.txt") as input_file:
    head = [next(input_file) for _ in range(1000)]
head = [i.strip() for i in head if i != '\n']
print(len(head))
opcodes_count = Counter(head)
print(opcodes_count)

# fig = plt.figure(figsize=(16, 10))

# y = [opcodes_count[i] for i in opcodes_count]
# x = [str(i) for i in opcodes_count]
# bars = plt.bar(x, y, color="salmon")

# for i in range(len(x)):
#     plt.text(i, y[i] // 2, f"{y[i]}", ha="center")

# plt.grid(None, "both", "y")
# plt.title("Opcodes statistics")
# plt.xticks(rotation=90, fontsize=12)
# plt.tight_layout()
# plt.savefig('statistics/opcodes_statistics.png')