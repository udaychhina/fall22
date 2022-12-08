import pytest
from unittest.mock import patch
from restaurant import Restaurant
from food import Food

from fastfood import JunkFood, FastFood


def test_fastfood_inheritance_super():
    """
    The FastFood constructor must use the parent class constructor with set arguments.
    Use super() with set arguments!
    """
    with patch("restaurant.Restaurant.__init__", return_value=None) as mock_init:
        mcdo = FastFood("McDonald's")
        mock_init.assert_called_once_with("McDonald's", 0, 24, style="junk")

    mcdo = FastFood("McDonald's")
    assert type(mcdo) == FastFood
    assert isinstance(mcdo, Restaurant)
    assert mcdo.opens_at == 0
    assert mcdo.closes_at == 24
    assert mcdo.style == "junk"


def test_junk_food():
    """Use inheritance for the JunkFood class too. Call the parent constructor!"""
    with patch("food.Food.__init__", return_value=None) as mock_init:
        burger = JunkFood("Cheese burger")
        assert mock_init.call_count == 1

    burger = JunkFood("Cheese burger")
    assert burger.name == "Cheese burger"
    assert burger.style == "junk"
    assert burger.vegetarian is False


def test_add_junk_food():
    """The add_food method must be inherited from Restaurant and not defined / overriden in FastFood"""
    mcdo = FastFood("McDonald's")
    burger = JunkFood("Cheese burger")
    mcdo.add_food(burger)
    assert burger in mcdo.get_foods()
    assert FastFood.add_food is Restaurant.add_food
    assert FastFood.get_foods is Restaurant.get_foods


def test_no_useless_arguments():
    """Free mark - you don't have to do anything as long as your JunkFood and FastFood constructors take ONE argument only"""
    with pytest.raises(TypeError):
        FastFood("McDonald's", 0, 24, "junk")
    with pytest.raises(TypeError):
        JunkFood("Burger", "junk", vegetarian=False)
