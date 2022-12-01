import pytest

from collection import Collection
from shapes import Circle, Rectangle, Square
from unittest.mock import patch, mock_open


@pytest.fixture
def my_shapes():
    return Collection("Tim's collection")


JSON_DATA1 = """
{
    "name": "Example collection",
    "shapes": [
        {
            "type": "circle",
            "dimensions": [10],
            "color": "blue"
        },
        {
            "type": "circle",
            "dimensions": [20],
            "color": "red"
        },
        {
            "type": "square",
            "dimensions": [50],
            "color": "green"
        },
        {
            "type": "rectangle",
            "dimensions": [5, 10],
            "color": "red"
        },
        {
            "type": "rectangle",
            "dimensions": [10, 10],
            "color": "purple"
        }
    ]
}
"""

JSON_DATA2 = """
{
    "name": "Example collection",
    "shapes": [
        {
            "type": "circle",
            "dimensions": [2],
            "color": "green"
        },
        {
            "type": "rectangle",
            "dimensions": [5, 10],
            "color": "green"
        },
        {
            "type": "square",
            "dimensions": [5],
            "color": "green"
        },
        {
            "type": "circle",
            "dimensions": [1],
            "color": "blue"
        },
        {
            "type": "rectangle",
            "dimensions": [10, 10],
            "color": "blue"
        }
    ]
}
"""


def test_invalid_name():
    """
    The name of the collection must be a string.
    The constructor does not have default values for the arguments.
    """
    with pytest.raises(TypeError):
        c = Collection(12345)

    with pytest.raises(TypeError):
        c = Collection()


def test_collection():
    """Tests attributes and methods of the collection"""
    c = Collection("Tim's collection")
    assert c.name == "Tim's collection"
    assert len(c) == 0
    assert "Tim's collection (0 shape" in str(c)


@patch("builtins.open", new_callable=mock_open, read_data=JSON_DATA1)
def test_collection_load(mock_file, my_shapes):
    """Load shapes from the fake JSON file #1"""
    assert my_shapes.name == "Tim's collection"
    my_shapes.load_from_json("test.json")
    assert mock_file.call_count == 1
    assert "test.json" in mock_file.call_args.args
    assert my_shapes.name == "Example collection"


@patch("builtins.open", new_callable=mock_open, read_data=JSON_DATA1)
def test_collection_load_shapes(mock_file, my_shapes):
    """Load shapes from the fake JSON file #1 and checks the shapes are created"""
    my_shapes.load_from_json("test.json")
    assert len(my_shapes) == 5
    assert str(my_shapes) == "Example collection (5 shapes)"


def test_collection_surface():
    """Compute the surface of a collection, uses fake JSON files #1 and #2"""
    with patch("builtins.open", new_callable=mock_open, read_data=JSON_DATA1):
        c = Collection("")
        c.load_from_json("test.json")
        assert c.surface() == 4220.80

    with patch("builtins.open", new_callable=mock_open, read_data=JSON_DATA2):
        c = Collection("")
        c.load_from_json("test.json")
        assert c.surface() == 190.71


@patch("builtins.open", new_callable=mock_open, read_data=JSON_DATA2)
def test_collection_find_color(mock_file, my_shapes):
    """Find shapes by color - sorted by surface descending (largest surface at the beginning)"""
    my_shapes.load_from_json("test.json")

    blue_shapes = my_shapes.find_color("blue")
    assert len(blue_shapes) == 2
    assert all([shape.color == "blue" for shape in blue_shapes])

    first = blue_shapes[0]
    assert type(first) == Rectangle
    assert (first.width, first.height) == (10, 10)

    last = blue_shapes[-1]
    assert type(last) == Circle
    assert last.radius == 1

    green_shapes = my_shapes.find_color("green")
    assert len(green_shapes) == 3
    assert all([shape.color == "green" for shape in green_shapes])
    assert type(green_shapes[0]) == Rectangle
    assert type(green_shapes[1]) == Square
    assert type(green_shapes[2]) == Circle


INVALID_SHAPES = """
{
    "name": "Invalid",
    "shapes": [
        {
            "type": "I dunno",
            "dimensions": [],
            "color": "Ahoy!"
        },
        {
            "type": "RECTANGLE",
            "dimensions": [5, 5],
            "color": "red"
        }
    ]
}
"""


def test_collection_unknown_shape(my_shapes):
    """No unknown shapes should be added to our collection"""
    with patch("builtins.open", new_callable=mock_open, read_data=INVALID_SHAPES):
        my_shapes.load_from_json("whatever")
        assert len(my_shapes) == 0
