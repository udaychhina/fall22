# values = (1, 2, 3, 4, 5)
# # values[0] = 0
# print(values[0])

#This works
# fp = open("file.txt", "w")
# fp.write("Hello!")

# This doesn't work
# with open("file.txt", "r") as fp:
#   fp.write("Hello!")

# This also works
# with open("file.txt", "w") as fp:
#   fp.write("Hello!")  

# This doesn't work
# fp = open("file.txt")
# fp.save("Hello!")

my_list = [1, 2, 3, 4, 5, 5, 6]
print(my_list)

# my_list = my_list.sort(reverse=True)
# print(my_list)

my_list.sort(reverse=True)
print(my_list)

# sort(my_list, reverse=True)
# print(my_list)

my_list = sorted(my_list, reverse=True)
print(my_list)

# def add(a, b):
#   return a + b

# print(add([1, 2, 3], [4, 5, 6]))