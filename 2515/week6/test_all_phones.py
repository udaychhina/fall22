from phone import Phone
from apple_phone import ApplePhone
from android_phone import AndroidPhone


def test_apple_phone():
    """Apple phones only receive the model, the brand is always 'iPhone'"""
    iphone = ApplePhone("11XS")
    assert iphone.brand == "iPhone"
    assert iphone.model == "11XS"


def test_android_phone():
    """Android phones behave like regular phones"""
    droid = AndroidPhone("OnePlus", "5")
    assert droid.brand == "OnePlus"
    assert droid.model == "5"


def test_inheritance():
    """Apple and Android phones inherit from Phone"""
    iphone = ApplePhone("11XS")
    assert isinstance(iphone, Phone)

    droid = AndroidPhone("OnePlus", "5")
    assert isinstance(droid, Phone)
