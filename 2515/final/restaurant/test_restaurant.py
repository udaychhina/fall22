import pytest
from restaurant import Restaurant


@pytest.fixture
def restaurant():
    return Restaurant("Tim's restaurant", 10, 22, "french")


def test_invalid_parameters():
    """The closing time cannot be before the opening time"""
    with pytest.raises(ValueError):
        Restaurant("Tim's restaurant", 22, 10, "french")
    with pytest.raises(ValueError):
        Restaurant("Tim's restaurant", 22, 22, "french")


def test_str(restaurant):
    """String representation of a restaurant - uses the name and times"""
    assert str(restaurant) == "Tim's restaurant [10:00 - 22:00]"


def test_is_open_at(restaurant):
    """The argument must be an integer, and must be between opening and closing times"""
    assert restaurant.is_open_at(12) is True

    assert restaurant.is_open_at(-1) is False
    assert restaurant.is_open_at(26) is False
    assert restaurant.is_open_at("just a string") is False
