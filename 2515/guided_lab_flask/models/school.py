from models.student import Student
import json
import operator


class School:
    def __init__(self, filename) -> None:
        self.filename = filename
        self.name, students = self.load_from_json(self.filename)
        self._students = []
        for student in students:
            self._students.append(
                Student(student['name'], student['student_id'], student['grades']))

    def load_from_json(self, filename):
        with open(filename, 'r') as fp:
            json_data = json.load(fp)
        return json_data['name'], json_data['students']

    def __len__(self):
        return len(self._students)

    def get_students(self, sorted_by="name"):
        student_list = self._students
        if sorted_by == 'name':
            return sorted(student_list, key=lambda x: x.name)
        elif sorted_by == 'gpa':
            return sorted(student_list, key=lambda x: x.gpa, reverse=True)

    def get_student(self, student_id):
        for student in self._students:
            if student.student_id == student_id:
                return student

    def to_dict(self):
        return_dict = {}
        return_dict['name'] = self.name
        return_dict['students'] = []
        for student in self._students:
            return_dict['students'].append(student.to_dict())
        return return_dict

    def save(self):
        json_object = self.to_dict()
        with open(self.filename, 'w') as fp:
            json.dump(json_object, fp)

    def add_student(self, name, student_id):
        if not type(name) == str or not type(student_id) == str or student_id == "" or name == "":
            raise ValueError("The values must be strings.")
        for student in self._students:
            if student.student_id == student_id:
                return False
        self._students.append(Student(name, student_id))
        return True