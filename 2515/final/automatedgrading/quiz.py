import csv

class Quiz:
    def __init__(self, filename) -> None:
        """The constructor for automated testing

        Args:
            filename (string): The name of the file containing the quiz questions
        """
        self.filename = filename
        self.questions = []
        self.answers = []
        self.student_answers = []
        self.correct_answers = []
        with open(filename, "r") as fp:
            reader = csv.reader(fp)
            for row in reader:
                self.questions.append(row[0])
                self.answers = row[1:-1]
                self.correct_answers.append(int(row[-1]))

    def get_question(self, id):
        """Returns the question for the given id

        Args:
            id (int): The id of the question

        Returns:
            question: The question for the given id
        """
        if type(id) is not int:
            return None
        if id <= 0 or id > len(self.questions):
            return None
        return self.questions[id-1]

    def get_answer(self, id):
        """Returns the answer for the given id

        Args:
            id (int): The id of the answer

        Returns:
            answer: The answer for the given id
        """
        if type(id) is not int:
            return None
        if id <= 0 or id > len(self.correct_answers):
            return None
        return self.correct_answers[id-1]

    def grade(self, filename):
        """Grades the quiz
        
        Args:
            filename (string): The name of the file containing the student's answers
            
        Returns:
            dict: A dictionary containing the student's score and a list of questions that were answered incorrectly
        """
        score = 0
        retDict = {}
        wrong_questions = []
        with open(filename, "r") as fp:
            answers = fp.readlines()
            for answer in answers:
                self.student_answers.append(int(answer.strip()))

        if len(self.student_answers) != len(self.answers):
            raise RuntimeError
        else:

            for num in range(len(self.student_answers)):
                if self.student_answers[num] == self.correct_answers[num]:
                    score += 1
                else:
                    wrong_questions.append(self.get_question(num+1))
            
            retDict["score"] = score
            retDict["wrong"] = wrong_questions
        return retDict


    def get_full_question(self, id):
        """Returns the full question for the given id
        
        Args:
            id (int): The id of the question
            
        Returns:
            string: The full question for the given id
        """
        returnString = ''
        returnString += self.questions[id-1]
        for num, ans in enumerate(self.answers, start=1):
            returnString += f'\n{num} {ans}'
        return returnString