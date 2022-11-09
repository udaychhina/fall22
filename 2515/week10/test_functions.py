import functions
import pytest
from unittest.mock import patch, mock_open


def test_something():
    assert 4 == 4
    assert 5 == 5


def test_add():
    result = functions.add(2, 3)
    result == 5


def test_add_float():
    result = functions.add(87.133, 83.15)
    assert result == 170.283

    result = functions.add("90", 30)
    assert result == 120
    

def test_add_invalid_parameters():
    with pytest.raises(TypeError):
        functions.add("five", 5)


@patch("builtins.input", side_effect=["10", "23.87"])
def test_add_input(mock_input):
    assert functions.add_input() == 33.87
    assert mock_input.call_count == 2

# another way to do this without the decorator
def test_add_input_no_patch():
    with patch("builtins.input", return_value="10") as mock_input:
        assert functions.add_input() == 20
        assert mock_input.call_count == 2

# TODO
@patch("builtins.input", side_effect=["five", 10])
def test_add_input_invalid(mock_input):
    assert functions.add_input() == 0
    assert mock_input.call_count == 2


@patch("builtins.open", new_callable=mock_open, read_data="1\n2\n3\n4\n5")
def test_number_lines(mock_file):
    assert functions.number_lines("example.json") == 5
    assert mock_file.call_args.args[0] == "example.json"