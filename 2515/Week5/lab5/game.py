from question_library import QuestionLibrary


class Game:
    def __init__(self) -> None:
        """A representation of a Game
        """
        lib = QuestionLibrary()
        print(lib.get_categories())
        # correct the type of the input if it is not supplied.
        inp_cat = input("Please input a category: ")
        if inp_cat == "" or not type(inp_cat) == str:
            inp_cat = None
        inp_diff = input("Please input a difficulty: ")
        if inp_diff not in ['easy', 'medium', 'hard'] or not type(inp_diff) == str or inp_diff == "":
            inp_diff = None
        inp_num_q = int(input("Please enter the number of questions: "))
        # while not inp_num_q.isnumeric() or not inp_num_q == 0:
        #     inp_num_q = input("Please input number of questions: ")

        self.questions = lib.get_questions(inp_cat, inp_diff, inp_num_q)
        self.score = 0

    def play(self):
        """A method to play the the game. Iterates through the given questions
        and asks for user input to confirm the correct answer. 
        """
        for question in self.questions:
            print(question)
            inp_choice = input("Please choose your answer: ")
            flag = True
            while flag:
                # convert into int only if numeric and in given list.
                if inp_choice.isnumeric() and int(inp_choice) in [1, 2, 3, 4]:
                    inp_choice = int(inp_choice)
                    flag = False
                else:
                    inp_choice = input("Please choose the correct answer: ")
            if inp_choice == question.answer_id:
                match question.difficulty:
                    case 'easy':
                        self.score += 1
                    case 'medium':
                        self.score += 2
                    case 'hard':
                        self.score += 3
                print(f'Current score = {self.score}')
            else:
                print('Wrong!')
        print(f'Score: {self.score}')

# g = Game()
# g.play()