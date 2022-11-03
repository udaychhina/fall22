class Person:
    def __init__(self, name, age) -> None:
        if len(str(name)) < 3 or not name.replace(' ', '').isalpha():
            raise AttributeError("The name must be a 3 or more letter string.")
        if not type(age) == int or int(age) < 0:
            raise AttributeError("The age must be a positive integer.")
        self.name = name
        self.age = age
    
    def get_name(self):
        return f'{self.name.upper()} / {self.age}'
