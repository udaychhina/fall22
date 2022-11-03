def str2dict(string):
    dictionary = {}
    for letter in string:
        if letter not in dictionary:
            dictionary[letter] = 1
        else:
            dictionary[letter] += 1
    return dictionary

def str2dict_plus(string):
    stripped_str = ''.join(l.lower() for l in string if l.isalnum())
    return str2dict(stripped_str)

def histogram(string):
    letter_dict = str2dict_plus(string)
    for key, value in letter_dict.items():
        # print(key, end=' ')
        # for i in range(value):
        #     print('*', end='')
        # print()
        print(f"{key} {'*' * value}")