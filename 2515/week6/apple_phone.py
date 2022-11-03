from phone import Phone


class ApplePhone(Phone):
    def __init__(self, model) -> None:
        super().__init__("iPhone", model)
