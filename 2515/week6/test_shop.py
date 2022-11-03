import pytest
from shop import Shop
from phone import Phone
from apple_phone import ApplePhone
from android_phone import AndroidPhone


@pytest.fixture
def iphone():
    """iPhone 11XS fixture"""
    return ApplePhone("11XS")


@pytest.fixture
def oneplus():
    """OnePlus 7T fixture"""
    return AndroidPhone("OnePlus", "7T")


@pytest.fixture
def shop():
    """Standard shop fixture"""
    return Shop()


def test_add_invalid_phone(shop):
    """Can only add phones to the inventory"""
    with pytest.raises(TypeError):
        shop.add_phone("12345")
    with pytest.raises(TypeError):
        shop.add_phone([1, 2, 3, 4, 5])



def test_add_phone(shop, iphone, oneplus):
    """Check the add_phone method"""
    shop.add_phone(iphone)
    assert iphone in shop.phones

    shop.add_phone(oneplus)
    assert oneplus in shop.phones

    class TestPhone(Phone):
        pass

    my_phone = TestPhone("Test", "Test")
    shop.add_phone(my_phone)
    assert iphone in shop.phones
    assert oneplus in shop.phones
    assert my_phone in shop.phones


def test_add_dunder(shop, iphone, oneplus):
    """Same with the dunder method"""
    shop + iphone
    assert iphone in shop.phones

    shop + oneplus
    assert iphone in shop.phones
    assert oneplus in shop.phones


def test_remove_phones(shop, iphone, oneplus):
    """Remove phones based on their brand (string)"""
    iphone2 = ApplePhone("13 Pro Max")
    shop.add_phone(iphone)
    shop.add_phone(iphone2)
    shop.add_phone(oneplus)

    number = shop.remove_phones("iPhone")
    assert iphone not in shop.phones
    assert iphone2 not in shop.phones
    assert oneplus in shop.phones
    assert number == 2


def test_get_iphones(shop, iphone, oneplus):
    """get_iphones returns all Apple phones in the shop"""
    iphone2 = ApplePhone("13 Pro Max")
    shop.add_phone(iphone)
    shop.add_phone(iphone2)
    shop.add_phone(oneplus)

    iphones = shop.get_iphones()
    assert iphone in iphones
    assert iphone2 in iphones
    assert oneplus not in iphones


def test_get_android(shop, iphone, oneplus):
    """get_android_phones returns all Android phones in the shop"""
    droid = AndroidPhone("iPhone", "Android")
    shop.add_phone(iphone)
    shop.add_phone(oneplus)
    shop.add_phone(droid)

    phones = shop.get_android_phones()
    assert oneplus in phones
    assert droid in phones
    assert iphone not in phones


def test_len_shop(iphone, oneplus):
    """The length of the shop instance is the number of phones in the inventory"""
    shop = Shop()
    assert len(shop) == 0

    shop.add_phone(iphone)
    assert len(shop) == 1

    shop.add_phone(oneplus)
    assert len(shop) == 2
