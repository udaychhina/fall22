import json
from question import Question
import random

class QuestionLibrary:
    """A class representing a question library: a collection of Question
    Objects. 
    """
    def __init__(self, filename = "trivia.json") -> None:
        with open(filename, 'r') as fp:
           json_data = json.load(fp)
        self.questions = []
        for obj in json_data:
            self.questions.append(Question(obj['question'], 
                obj['correct_answer'],
                 obj['incorrect_answers'], 
                 obj['category'], 
                 obj['difficulty']))
    
    def __len__(self):
        """Dunder method to return the length of the library when the len()
        function is called on the object. 

        Returns:
            int: The length of the questions in the question library
        """
        return len(self.questions)

    def get_categories(self):
        """Method to get the unique categories of all the quesions in the
        question
        library list. 

        Returns:
            set: returns the set of unique categories found in the question
            library. 
        """
        cat_list = []
        for question in self.questions:
            cat_list.append(question.category)
        return list(set(cat_list))

    def get_questions(self, category = None, difficulty = None, number = 2):
        """A method to get the questions based on a number of different
        criteria

        Args:
            category (str, optional): The category of questions to return.
                Defaults to None. 
            difficulty (str, optional): The difficulty of
                the questions to return. Defaults to None. 
            number (int, optional): The number of questions to return.
                Defaults to 10.

        Returns:
            list: all the questions that match the criteria passed into the
            method
        """
        if difficulty not in ['easy', 'medium', 'hard']:
            difficulty = None
        if category == "":
            category = None
        all_q = [q for q in self.questions]
        random.shuffle(all_q)
        all_q_category = [q for q in all_q if category == q.category]
        if not category == None and not difficulty == None:
            return [q for q in all_q_category if q.difficulty == difficulty][:number]
        elif category == None and not difficulty == None:
            return [q for q in all_q if q.difficulty == difficulty][:number]
        elif difficulty == None and category in self.get_categories():
           return all_q_category[:number]
        else:
            return all_q[:number]