class Example:
    def __init__(self) -> None:
        self.name = "Tim"
        self.program = "CIT"
        self.grade = 0
        self.my_list = [1, 2, 3, 4, 5]
    # Dunder methods are called like so becuase they start with two underscsores __
    # One of the methods is __init__. They are called without us calling them.
    # one of the more useful ones is called the str method. 

    # If you want to change the way your object looks like as a string, you can use
    # the dunder method __str__() which will be called whenever we try to call the
    # str() function on the object to print it. 

    def __str__(self) -> str:
        return f"Hello, my name is {self.name} and I amd a student in {self.program}."

    # If yo utry to add 10 to a.grade (a.grade + 10), it won't work. Because 'a' is a class and
    # 10 is an int. To make sure it works, we need to redefine how to the +
    # operator will work for the addition in this class. 

    def __add__(self, value) -> int:
        self.grade += value
        return self.grade

    # another thing we can do is to get the len of our object. 
    # This won't work if we just do len(a) because 'a' is an object here. Not a
    # list. 
    def __len__(self):
        return len(self.my_list)