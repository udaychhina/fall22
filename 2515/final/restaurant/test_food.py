import pytest
from food import Food


def test_name():
    """Checks the name attribute"""
    pasta = Food("Cacio y Pepe")
    assert pasta.name == "Cacio y Pepe"

    pasta = Food("Pizza margherita", "italian", vegetarian=True)
    assert pasta.name == "Pizza margherita"


def test_invalid_name():
    """The name of the food is required, and must be a non-emtpy string"""
    for wrong_name in [None, "", 123, [1, 2, 3], {}]:
        with pytest.raises(ValueError):
            Food(wrong_name)


def test_style():
    """
    The food "style" is the second optional argument.
    It is only considered if it is a non-empty string, otherwise, it is set to None.
    """

    food = Food("Pasta")
    assert food.style is None

    food = Food("Pasta", "italian")
    assert food.style == "italian"

    for wrong_value in ["", 12, [1, 2, 3], {}]:
        food = Food("Food", wrong_value)
        assert food.style is None


def test_vegetarian():
    """vegetarian is the third optional parameter, and must be called 'vegetarian'"""
    food = Food("Food")
    assert food.vegetarian is False

    food = Food("Food", vegetarian=True)
    assert food.vegetarian is True

    for wrong_value in ["", "something", 12, [1, 2, 3], {}, False]:
        food = Food("Food", vegetarian=wrong_value)
        assert food.vegetarian is False


def test_str():
    """Checks for the string representation of the dish. Vegetarian dishes have [V] appended"""
    tacos = Food("Tacos al pastor", vegetarian=False)
    assert str(tacos) == "Tacos al pastor"

    pasta = Food("Cacio y Pepe", vegetarian=True)
    assert str(pasta) == "Cacio y Pepe [V]"
