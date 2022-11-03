import random


class Question:
    """A class representing a Question for a Trivia Game
    """

    def __init__(self,  question, correct_answer, incorrect_answers,
                 category, difficulty) -> None:
        """Constructor method for the Question class

        Args:
            question (str): The question string correct_answer (str): the
            correct answer string incorrect_answers (list): list of strings of
            incorrect answers category (str): the category string difficulty
            (str): the difficulty string

        Raises:
            AttributeError: Raises attribute error when the inputs are not of
            the correct types. 
        """
        self.question = question
        self.answers = incorrect_answers
        self.answers.append(correct_answer)
        if difficulty not in ['easy', 'medium', 'hard']:
            raise AttributeError("Invalid difficulty")
        else:
            self.difficulty = difficulty
        self.category = category

        random.shuffle(self.answers)
        self.answer_id = self.answers.index(correct_answer) + 1

    def __str__(self):
        """Dunder method for printing desired output when the str or print
        functions are called on the Question object.

        Returns:
            str: Returns a formatted string of the question text and all
            possible answers. 
        """
        q = self.question  # "question?"
        for num, choice in enumerate(self.answers, start=1):
            # \n1 false\n2 incorrect\n3 true\n4 correct
            q += f"\n{num} {choice}"
        return q
