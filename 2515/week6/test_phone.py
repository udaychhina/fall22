import pytest

from phone import Phone


def test_normal_phone():
    """A phone has a model and a brand"""
    p = Phone("OnePlus", "5")
    assert p.brand == "OnePlus"
    assert p.model == "5"


def test_invalid_brand():
    """Brand can only be a string"""
    with pytest.raises(TypeError):
        Phone(1234, "abc")
    with pytest.raises(TypeError):
        Phone([1, 2, 3, 4], "abc")


def test_invalid_model():
    """Model can only be a string"""
    with pytest.raises(TypeError):
        Phone("OnePlus", 1234)
    with pytest.raises(TypeError):
        Phone("OnePlus", [1, 2, 3, 4])
