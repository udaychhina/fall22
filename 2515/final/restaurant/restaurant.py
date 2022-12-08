from food import Food


class Restaurant:
    """A restaurant"""
    def __init__(self, name, opening_time, closing_time, style=None):
        """The constructor for restaurants

        Args:
            name (string): The name of the restaurant
            opening_time (int): The time the restaurant opens
            closing_time (int): The time the restaurant closes
            style (string, optional): The style of the restaurant. Defaults to
            None.

        Raises:
            ValueError: If the name or style is not a string or is an empty string
            ValueError: If the opening time or closing time is not an integer
            or is not between 0 and 24
            ValueError: If the opening time is not before the closing time
        """

        # Check the name is not an empty string
        if type(name) is not str or not len(name):
            raise ValueError

        self.name = name

        # Check the style is None or a non-empty string
        self.style = None
        if type(style) is str and len(style) > 0:
            self.style = style

        # Check the opening and closing times are integers...
        for attr in (opening_time, closing_time):
            if type(attr) is not int:
                raise ValueError
            # ... and are between 0 and 24
            if not 0 <= attr <= 24:
                raise ValueError

        # Check the opening time is before the closing time
        if opening_time >= closing_time:
            raise ValueError

        self.food_items = []

        self.opens_at = opening_time
        self.closes_at = closing_time

    def __str__(self):
        """Returns a string representation of the restaurant
        
        Returns:
            str: A string representation of the restaurant
        """
        return f'{self.name} [{self.opens_at}:00 - {self.closes_at}:00]'

    def is_open_at(self, time):
        """Returns True if the restaurant is open at the given time and False otherwise

        Args:
            time (int): The time to check

        Returns:
            bool: True if the restaurant is open at the given time and False otherwise
        """
        if type(time) is not int:
            return False
        return self.opens_at <= time < self.closes_at

    def get_foods(self):
        """Returns a list of the food items served at the restaurant
        
        Returns:
            list: A list of the food items served at the restaurant
        """
        return self.food_items

    def add_food(self, food_item):
        """Adds a food item to the restaurant

        Args:
            food_item (Food): The food item to add

        Raises:
            TypeError: If the food item is not of type Food
            TypeError: If the food item is not of the same style as the restaurant
        """
        if not isinstance(food_item, Food):
            raise TypeError
        if food_item.style != self.style:
            raise TypeError
        self.food_items.append(food_item)

    def has_food(self, food_name):
        """Checks if the restaurant has the given food item
        
        Args:
            food_name (string): The name of the food to check
            
        Returns:
            bool: True if the restaurant serves the given food and False
            otherwise
        """
        for food in self.food_items:
            if food_name.lower() in food.name.lower():
                return True
        return False

    def has_vegetarian_options(self):
        """Checks if the restaurant has any vegetarian options
        
        Returns:
            bool: True if the restaurant has vegetarian options and False
            otherwise
        """
        for food in self.food_items:
            if food.vegetarian:
                return True
        return False
