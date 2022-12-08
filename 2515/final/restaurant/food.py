class Food:
    """A food item"""

    def __init__(self, name, style=None, vegetarian=False) -> None:
        """The constructor for food items

        Args:
            name (string): The name of the food item
            style (string, optional): The style of the food item. Defaults to
            None.
            vegetarian (bool, optional): Whether the food item is vegetarian.
            Defaults to False.

        Raises:
            ValueError: If the name is not a string or is an empty string

            ValueError: If the style is not a string or is an empty string 

            ValueError: If the vegetarian parameter is not a boolean
        """
        if type(name) is not str or name == "":
            raise ValueError
        self.name = name
        if type(style) is not str or style == "":
            self.style = None
        else:
            self.style = style
        if vegetarian == True and type(vegetarian) is bool:
            self.vegetarian = True
        else:
            self.vegetarian = False

    def __str__(self) -> str:
        """Returns a string representation of the food item
        
        Returns:
            str: A string representation of the food item
        """
        if self.vegetarian:
            return f'{self.name} [V]'
        else:
            return f'{self.name}'
