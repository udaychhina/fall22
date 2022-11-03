from phone import Phone
from android_phone import AndroidPhone
from apple_phone import ApplePhone


class Shop:
    def __init__(self) -> None:
        self.phones = []

    def add_phone(self, phone):
        if issubclass(type(phone), Phone):
            self.phones.append(phone)
        else:
            raise TypeError(
                "Phone is not of type Phone, or any of it's subclasses.")

    def __add__(self, phone):
        if issubclass(type(phone), Phone):
            self.phones.append(phone)
        else:
            raise TypeError(
                "Phone is not of type Phone, or any of it's subclasses.")

    def remove_phones(self, brand_name: str):
        count1 = len(self.phones)
        self.phones = [
            phone for phone in self.phones if phone.brand != brand_name]
        return count1 - len(self.phones)

    def get_iphones(self):
        return [phone for phone in self.phones if type(phone) == ApplePhone]

    def get_android_phones(self):
        return [phone for phone in self.phones if type(phone) == AndroidPhone]

    def __len__(self):
        return len(self.phones)
