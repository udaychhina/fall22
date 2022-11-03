import pytest
import math
from shapes import Shape, Square, Rectangle, Circle
from unittest.mock import patch


@pytest.fixture
def red_square_5():
    """A red square, dimensions = 5"""
    return Square(5, "red")


@pytest.fixture
def blue_rectangle_5_10():
    """A blue rectangle, dimensions = 5x10"""
    return Rectangle(5, 10, "blue")


@pytest.fixture
def green_circle_10():
    """A green circle, dimensions (radius) = 10"""
    return Circle(10, "green")


def test_shape():
    """Check basic attributes of the Shape class"""

    s = Shape("black")
    # The constructor sets the color attribute
    assert s.color == "black"

    # The surface method raises an exception
    with pytest.raises(NotImplementedError):
        s.surface()


def test_rectangle():
    """Check attributes for a 10x20 rectangle"""

    r = Rectangle(10, 20, "black")
    assert r.color == "black"
    assert r.width == 10
    assert r.height == 20
    assert r.surface() == 200


def test_square():
    """Check attributes for a square (= rectangle with same width and height)"""
    s = Square(10, "purple")
    assert s.color == "purple"
    assert s.width == 10
    assert s.height == 10

    assert s.surface() == 100


def test_circle():
    """Check attributes for a circle"""
    c = Circle(10, "orange")
    assert c.color == "orange"
    assert c.radius == 10

    # We use a trick to make the surface value easy to test
    c = Circle(1 / math.sqrt(math.pi), "orange")
    assert c.surface() == 1


def test_surface_shapes_round(red_square_5, blue_rectangle_5_10, green_circle_10):
    """Surface calculations should be rounded 2 decimals precision"""
    for shape in red_square_5, blue_rectangle_5_10, green_circle_10:
        with patch("builtins.round") as mock_round:
            shape.surface()
            assert mock_round.call_count == 1
            assert mock_round.call_args.args[1] == 2


def test_inheritance_shapes(red_square_5, blue_rectangle_5_10, green_circle_10):
    """Check inheritance for the shapes classes"""

    # They all inherit from Shape
    for s in [red_square_5, blue_rectangle_5_10, green_circle_10]:
        assert isinstance(s, Shape)

    # But Square should inherit from Rectangle
    assert isinstance(red_square_5, Rectangle)


def test_str_shapes(red_square_5, blue_rectangle_5_10, green_circle_10):
    """The __str__ method should only be defined once on the Shape class"""

    # HINT: to get the class name as a string for the object called "instance"
    #       use type(instance).__name__
    #       For example:
    #       type(red_square_5).__name__ == "Square"

    assert str(red_square_5) == "Square (red)"
    assert str(blue_rectangle_5_10) == "Rectangle (blue)"
    assert str(green_circle_10) == "Circle (green)"

    assert Square.__str__ == Shape.__str__
    assert Rectangle.__str__ == Shape.__str__
    assert Circle.__str__ == Shape.__str__


@patch("shapes.Shape.__init__")
def test_inheritance_super(mock_init):
    """Tests that Rectangle and Circle use the Shape constructor"""
    r = Rectangle(10, 20, "black")
    assert mock_init.call_args.args == ("black",)
    c = Circle(10, "orange")
    assert mock_init.call_args.args == ("orange",)

    assert mock_init.call_count == 2


@patch("shapes.Rectangle.__init__")
def test_inheritance_square(mock_init):
    """Tests that Rectangle and Square are very closely related"""

    # The surface method should only be defined once
    assert Square.surface == Rectangle.surface

    # Tests that the Rectangle constructor is used
    s = Square(10, "purple")
    assert mock_init.call_count == 1
    assert mock_init.call_args.args == (10, 10, "purple")
