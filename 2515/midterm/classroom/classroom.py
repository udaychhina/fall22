class Classroom:
    """A simple representation of a classroom.
    """
    def __init__(self, class_name, inst_name) -> None:
        self.instructor = inst_name
        self.room = class_name
        self.students = []

    def __add__(self, student):
        """Dunder method to add students to the student list.

        Args:
            student (string): the student to add to the list of the students
        """
        self.students.append(student)

    def __len__(self):
        """Dunder method to return the length of the classroom

        Returns:
            int: The number of students in the classroom.
        """
        return len(self.students)

    def __str__(self):
        """Dunder method for the string representation of the students

        Returns:
            string: The string representation of the room number, the
            instructor, and the number of students.
        """
        string_rep = f'Room {self.room} [{self.instructor}] - {len(self.students)} students'
        return string_rep
