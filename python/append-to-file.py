file = open("file.txt", "a")
file.write("Hi!\n")
file.close()

file = open("file.txt", "r")

for line in file.readlines():
    print(line, end='')

file.close()

