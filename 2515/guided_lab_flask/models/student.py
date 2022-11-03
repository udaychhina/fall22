class Student:
    def __init__(self, name, student_id, grades=None) -> None:
        if grades is None:
            grades = []
        self.name = name
        self.student_id = student_id
        self.grades = grades

    @property
    def gpa(self):
        if self.grades == []:
            gpa = 0
        else:
            gpa = (sum(self.grades)/len(self.grades))
        return round(gpa, 2)

    def to_dict(self):
        return {"name": self.name,
                "student_id": self.student_id,
                "grades": self.grades}

    def add_grade(self, grade):
        if int(grade) < 0 or int(grade) > 100 or not str(grade).isdecimal():
            raise ValueError("Must be from 0 to 100")
        else:
            self.grades.append(int(grade))
