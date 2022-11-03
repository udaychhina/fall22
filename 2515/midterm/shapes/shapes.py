import math


class Shape:
    """A simple representation of a shape with a color
    """
    def __init__(self, color) -> None:
        if color == None or not type(color) == str:
            raise ValueError("not provided or not string")

        self.color = color

    def surface(self):
        """the surface method for the shape class. Implemented for the
        inherited classes but not for the parent class

        Raises:
            NotImplementedError: The method has not been implemented for the
            parent class
        """
        raise NotImplementedError()

    def __str__(self):
        """the string representation of a shape

        Returns:
            string: the name and color of the shape.
        """
        string_rep = f'{type(self).__name__} ({self.color})'
        return string_rep


class Circle(Shape):
    """A simple representation of a circle

    Args:
        Shape (Shape): The parent class: Shape
    """
    def __init__(self, radius, color) -> None:
        super().__init__(color)
        self.radius = radius

    def surface(self):
        """The surface area of the circle

        Returns:
            float: the surface area of the cicle
        """
        return round(math.pi * (self.radius * self.radius), 2)


class Rectangle(Shape):
    """A simple representation of a Rectange

    Args:
        Shape (Shape): The parent class: Shape
    """
    def __init__(self, width, height, color) -> None:
        super().__init__(color)
        self.width = width
        self.height = height

    def surface(self):
        """Surface area of a rectangle

        Returns:
            float: The surface area of the rectangle
        """
        return round((self.width * self.height), 2)


class Square(Rectangle):
    """A simple rerpresentation of a square

    Args:
        Rectangle (Rectangle): The parent class: Rectangle
    """
    def __init__(self, size, color) -> None:
        self.size = size
        super().__init__(self.size, self.size, color)
