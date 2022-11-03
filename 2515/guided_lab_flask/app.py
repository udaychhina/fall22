from flask import Flask, render_template, request
from models.school import School

app = Flask(__name__)

school = School("bcit.json")


@app.route("/")
def home():
    return render_template("home.html", school=school), 200


@app.route("/student/<string:student_id>")
def student(student_id):
    student = school.get_student(student_id)
    return render_template("student.html", student=student), 200


@app.route("/student/add", methods=['POST'])
def add_student():
    if request.method == 'POST':
        request_data = request.json
        if request_data.get('name') == None or request_data.get('student_id') == None:
            return 'Invalid data', 400
        else:
            try:
                result = school.add_student(
                    request_data['name'], request_data['student_id'])
                if result:
                    school.save()
                    return 'Student added', 200
                else:
                    return 'Student exists', 409
            except ValueError:
                return 'Invalid data', 400


@app.route("/student/<string:student_id>/grades/add", methods=["POST"])
def add_grades(student_id):
    if request.method == "POST":
        if school.get_student(student_id) is None:
            return 'Student not found', 404

        grade = request.json['grade']
        if int(grade) < 0 or int(grade) > 100:
            return 'Grade not valid', 400
        else:
            student = school.get_student(student_id)
            student.add_grade(grade)
            school.save()
            return 'Grade Added', 200


if __name__ == '__main__':
    app.run(debug=True)
