class Student:
    def __init__(self, student_name) -> None:
        print('I am in the init method.')
        self.name = student_name
        self.count = 0
    # this is called a method when inside a class, not a funtion. 
    # functions inside a class will always get the 'self' parameter
    # this self is the object Student
    def hello(self) -> None:
        print("Hello there, my name is", self.name) 
        self.count += 1

    def add(self, num1, num2):
        return num1 + num2

    def statistics(self):
        print(f"I said hello {self.count} times.")