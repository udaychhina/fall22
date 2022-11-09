def add(a, b):
    """
    Adds the two arguments and returns the result.
    Raises TypeError if arguments cannot be converted to "numbers".
    """
    try:
        a = float(a)
        b = float(b)
    except ValueError:
        raise TypeError

    return round(a + b, 5)

def add_input():
    """
    Gets two values from user input, and returns their sum.
    If any of the values is not a number, return 0.
    """
    value1 = input("Enter value1: ")
    value2 = input("Enter value2: ")

    try:
        result = add(value1, value2)
        return result
    except TypeError:
        return 0

def number_lines(filename):
    """Returns the number of lines in the file provided as argument"""
    with open(filename, "r") as fp:
        return len(fp.readlines())