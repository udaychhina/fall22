import random

class SecretWord:
    def __init__(self, received_word=None) -> None:
        if received_word == None:
            with open('words.txt', 'r') as fp:
                words = fp.read().split('\n')
            self._word = random.choice(words).upper()
        else:
            self._word = received_word.upper()

    def show_letters(self, letter_list) -> str:
        return ' '.join([char if char in [i.upper() for i in letter_list] else '_' for char in self._word.upper()])

    def check_letters(self, letter_list) -> bool:
        return '_' not in self.show_letters(letter_list)

    def check(self, word) -> bool:
        return self._word == word.upper()


class Game:
    def __init__(self, turns=10):
        self._secret_word = SecretWord()
        self._turns = turns
        self._tried_letters = []

    @property
    def turns(self):
        return self._turns

    def play_one_round(self):
        letter_tried = False
        while not letter_tried:
            # received help from Jack Tam [2C] for this method
            player_input = input('Type a letter or guess the word: ')
            if len(player_input) == 1 and player_input not in self._tried_letters and player_input.isalpha():
                letter_tried == True
                self._turns -= 1
                self._tried_letters.append(player_input)
                print(self._secret_word.show_letters(self._tried_letters))
                return self._secret_word.check_letters(self._tried_letters)

            elif player_input.isalpha() and len(player_input) > 1:
                letter_tried = True
                self._turns -= 1
                return self._secret_word.check(player_input)
    
    def play(self):
        game_on = True
        while game_on:
            status = self.play_one_round()
            print(f'Turns: {self._turns}')
            if status:
                break
            else:
                if self._turns == 0:
                    print(f'You lose, the word was {self._secret_word._word}')
                    return
        print('You win!')
