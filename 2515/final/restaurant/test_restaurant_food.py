import pytest
from restaurant import Restaurant
from food import Food


@pytest.fixture
def restaurant():
    return Restaurant("Tim's restaurant", 10, 22, "french")


@pytest.fixture
def tartiflette():
    """Cheesy dish: https://en.wikipedia.org/wiki/Tartiflette"""
    return Food("Tartiflette savoyarde", "french", vegetarian=False)


@pytest.fixture
def ratatouille():
    """Vegetarian dish: https://en.wikipedia.org/wiki/Ratatouille"""
    return Food("Ratatouille", "french", vegetarian=True)


@pytest.fixture
def confit():
    """Duck confit: https://en.wikipedia.org/wiki/Duck_confit"""
    return Food("Duck confit", "french", vegetarian=False)


@pytest.fixture
def tacos():
    """Mexican delicacy: https://en.wikipedia.org/wiki/Al_pastor"""
    return Food("Tacos al pastor", "mexican", vegetarian=False)


def test_add_valid_food(restaurant, tartiflette, ratatouille):
    """Adds dishes to a restaurant, and checks they are available in get_foods()"""
    restaurant.add_food(tartiflette)
    restaurant.get_foods() == [tartiflette]

    restaurant.add_food(ratatouille)
    assert len(restaurant.get_foods()) == 2
    assert ratatouille in restaurant.get_foods()


def test_add_invalid_food_style(restaurant, tacos):
    """Can only add food with the same "style" as the restaurant"""
    with pytest.raises(TypeError):
        restaurant.add_food(tacos)


def test_add_invalid_food_type(restaurant):
    """You can only add Food objects to the restaurant"""
    with pytest.raises(TypeError):
        restaurant.add_food(None)
    with pytest.raises(TypeError):
        restaurant.add_food(1)
    with pytest.raises(TypeError):
        restaurant.add_food("Tasty")


def test_has_food(restaurant, tartiflette, ratatouille):
    """The name provided is searched across all dishes of the restaurant, regardless of case. The search term can be a substring of the dish name"""
    assert restaurant.has_food("tartiflette") is False

    restaurant.add_food(tartiflette)
    assert restaurant.has_food("Tartiflette") is True
    assert restaurant.has_food("tartiflette") is True
    assert restaurant.has_food("artiflet") is True
    assert restaurant.has_food("savoyard") is True

    restaurant.add_food(ratatouille)
    assert restaurant.has_food("ratatouille") is True
    assert restaurant.has_food("tartiflette") is True


def test_vege_property(restaurant, tartiflette, ratatouille, confit):
    """Check for vegetarian options"""
    assert restaurant.has_vegetarian_options() is False

    restaurant.add_food(tartiflette)
    assert restaurant.has_vegetarian_options() is False

    restaurant.add_food(ratatouille)
    assert restaurant.has_vegetarian_options() is True

    restaurant.add_food(confit)
    assert restaurant.has_vegetarian_options() is True
