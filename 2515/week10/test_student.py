from models import Student
import pytest

@pytest.fixture
def student():
    s = Student("Uday", "A01210638", 2)
    return s

def test_constructor(student):
    assert student.name == "Uday"
    assert student.student_id == "A01210638"
    assert Student("Uday", "A01210638").term == 1


def test_invalid_student():
    with pytest.raises(ValueError):
        Student(1, 1210638)

    with pytest.raises(ValueError):
        Student("Uday", 1210638)

    with pytest.raises(ValueError):
        Student("Uday", "Z", 1.2)

    with pytest.raises(ValueError):
        Student("Uday", "A01210638", 1.5)


def test_to_dict(student):
    assert student.to_dict() == {
        "name": "Uday",
        "student_id": "A01210638",
        "term": 2
    }
