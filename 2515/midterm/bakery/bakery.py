class Bakery:
    """Representation of a simple bakery.
    """
    def __init__(self, name) -> None:
        self.name = name
        self.croissants = 0
        self.money = 0

    def bake(self, num_to_bake):
        """a method to bake croissants.

        Args:
            num_to_bake (integer like): the amount of croissants to bake. can
            be a string as long as it has no decimals and negative values and
            only numbers

        Raises:
            ValueError: raises value error when the input is not of the
            correct type
        """
        num_to_bake = str(num_to_bake)
        if not num_to_bake.isdecimal() or int(num_to_bake) < 0:
            raise ValueError("It must be a number.")
        else:
            self.croissants += int(num_to_bake)

    def sell(self, num_to_sell = 1):
        """A method to sell the croissants

        Args:
            num_to_sell (int, optional): The number of croissants to sell. Defaults to 1.

        Raises:
            ValueError: It must be a postive integer, otherwise raise value
            error
            RuntimeError: The croissants to sell must not be greater than the
            croissants available to sell. 
        """
        if type(num_to_sell) != int or num_to_sell < 0 or not str(num_to_sell).isdecimal():
            raise ValueError("Must be positive integer.")
        elif num_to_sell > self.croissants:
            raise RuntimeError("Don't have enough croissants.")
        else:
            self.croissants -= num_to_sell
            self.money += (num_to_sell * 3)
    
    def __str__(self):
        """string representation of the bakery class

        Returns:
            string: returns the name of the bakery
        """
        return self.name