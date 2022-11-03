"""
ACIT2515 Lab

Week 2 -- complete this file!

"""
import random

# The number of turns allowed is a global constant
NB_TURNS = 10

def pick_random_word():
    """Opens the words.txt file, picks and returns a random word from the file"""
    # WRITE YOUR CODE HERE !
    with open('words.txt', 'r') as fp:
        words = fp.readlines()
    clean_words = [word.strip() for word in words]
    return random.choice(clean_words)

def show_letters_in_word(word, letters):
    """
    This function RETURNS A STRING.
    This function scans the word letter by letter.
    First, make sure word is uppercase, and all letters are uppercase.
    If the letter of the word is in the list of letters, keep it.
    Otherwise, replace it with an underscore (_).

    DO NOT USE PRINT!

    Example:
    >>> show_letters_in_word("VANCOUVER", ["A", "V"])
    'V A _ _ _ _ V _ _'
    >>> show_letters_in_word("TIM", ["G", "V"])
    '_ _ _'
    >>> show_letters_in_word("PIZZA", ["A", "I", "P", "Z"])
    'P I Z Z A'
    """
    # WRITE YOUR CODE HERE
    # This is the noobie way to do it. 
    # my_string = ""
    # for letter in word:
    #     if letter in letters:
    #         my_string += f'{letter} '
    #     else:
    #         my_string += f'_ '
    # return my_string.strip()

    # better way to do it:
    return ' '.join([char if char in [i.upper() for i in letters] else '_' for char in word.upper()])

def all_letters_found(word, letters):
    """Returns True if all letters in word are in the list 'letters'"""
    return '_' not in show_letters_in_word(word, letters)
    # another way to do this would be with set theory
    # word_set = set(word)
    # letters_set = set(letters)
    # expression = word_set.issubset(letters_set)
    # return expression
    # #another way would be to make it short af
    # return set(word).issubset(set(letters))
    # #another way of doing this is
    # return all([character in letters for character in word])

def main(turns):
    """
    Runs the game. Allows for "turns" loops (attempts).
    At each turn:
    1. Ask the user for a letter
    2. Add the letter to the list of letters already tried by the player
    3. If the letter was already tried, ask again
    4. Use the show_letters_in_word function to display hints about the word
    5. Remove 1 to the number of tries left
    6. Check if the player
        - won (= word has been found)
        - lost (= word has not been found, no tries left)

    Do not forget to pick a random word first :-)

    """
    # WRITE YOUR CODE HERE
    word = pick_random_word().upper()
    already_tried_letters = []
    lost = True
    while turns != 0:
        if all_letters_found(word, already_tried_letters):
            lost = False
            break
        letter_is_fine = False
        while not letter_is_fine:
            letter = str(input("Input a letter: ")).upper()
            if letter and letter not in already_tried_letters:
                letter_is_fine = True
                already_tried_letters.append(letter)
        
        hint = show_letters_in_word(word, already_tried_letters)
        print(hint)
        turns -= 1
        print(f'Turns remaining: {turns}')
    if lost:
        print("You lose!")
        print(f"The word was: {word}")
    else:
        print("You win!")


if __name__ == "__main__":
    main(NB_TURNS)