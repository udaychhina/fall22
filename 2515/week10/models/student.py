class Student:
    def __init__(self, name, student_id, term=1):
        if type(name) is not str:
            raise ValueError

        if type(student_id) is not str:
            raise ValueError

        if student_id[:2] != "A0" or len(student_id) != 9 or not student_id[1:9].isdigit():
            raise ValueError

        if type(term) is not int:
            raise ValueError

        self.name = name
        self.student_id = student_id
        self.term = term

    def to_dict(self):
        return {attr: getattr(self, attr) for attr in ("name", "student_id", "term")}
