from models import School
from models import Student
from unittest.mock import patch, mock_open
import pytest


FAKE_SCHOOL = """
[
    {"name": "Student1", "student_id": "A00000001", "term": 2}, 
    {"name": "Student2", "student_id": "A00000002", "term": 1}
]
"""

@pytest.fixture
@patch("builtins.open", new_callable=mock_open, read_data=FAKE_SCHOOL)
def bcit(mock_file):
    s = School("bcit")
    return s


def test_contructor(bcit):
    assert bcit.name == "bcit"
    assert len(bcit) == 2
    assert bcit.students[0].name == "Student1"
    assert bcit.students[1].name == "Student2"

def test_save(bcit):
    with patch("builtins.open", new_callable=mock_open) as mock_file:
        with patch("json.dump") as mock_json:
            bcit.save()
            assert mock_file.call_count == 1
            assert mock_json.call_count == 1
            assert "school.json" in mock_file.call_args.args

@patch("builtins.open")
@patch("json.dump")
def test_save_alternate(mock_json, mock_file, bcit):
    bcit.save()
    assert mock_json.call_count == 1
    assert mock_file.call_count == 1
    assert "school.json" in mock_file.call_args.args


def test_add_raises_error(bcit):
    with pytest.raises(TypeError):
        student = "Student"
        bcit.add(student)
    
def test_add(bcit):
    student = Student("Uday", "A01210638")
    bcit.add(student)
    assert bcit.students[2].name == "Uday"
    assert bcit.students[2].student_id == "A01210638"


def test_get_by_id(bcit):
    student = Student("Uday", "A01210638")
    bcit.add(student)
    assert bcit.get_by_id("A01210638").name == "Uday"

def test_get_by_name(bcit):
    student = Student("Uday", "A01210638")
    bcit.add(student)
    assert bcit.get_by_name("Uday")[0].name == "Uday"

def test_delete(bcit):
    student = Student("Uday", "A01210638")
    bcit.add(student)
    assert bcit.delete("A01210638")
    assert not bcit.delete("A01210638")
