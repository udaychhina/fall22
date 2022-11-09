import json

from .student import Student


class School:
    def __init__(self, name):
        self.name = name
        with open("school.json") as fp:
            self.students = [
                Student(
                    elem["name"],
                    elem["student_id"],
                    elem["term"]
                ) for elem in json.load(fp)
            ]

    def save(self):
        with open("school.json", "w") as fp:
            json.dump([student.to_dict() for student in self.students], fp)
    
    def __len__(self):
        return len(self.students)

    def add(self, instance):
        if type(instance) is not Student:
            raise TypeError

        self.students.append(instance)

    def get_by_id(self, student_id):
        for student in self.students:
            if student.student_id == student_id:
                return student

    def get_by_name(self, name):
        return [
            student for student in self.students if name.lower() in student.name.lower()
        ]

    def delete(self, student_id):
        student = self.get_by_id(student_id)
        if student:
            self.students.remove(student)
            return True

        return False

