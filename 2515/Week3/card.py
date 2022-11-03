from cmath import isnan


class Card:
    def __init__(self, card_number, card_color = "black" or "red") -> None:
        if card_color not in ['red', 'black']:
            raise AttributeError("The color is not valid.")
        
        try:
            card_number = int(card_number)
        except ValueError:
            raise AttributeError("The number is not valid")

        if not card_number in range(1, 11):
            raise AttributeError('The number is not valid.')

        self.value = card_number
        self.color = card_color
    
    def is_stronger_than(self, Card) -> bool:
        return self.value > Card.value