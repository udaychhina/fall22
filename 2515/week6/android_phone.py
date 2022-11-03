from phone import Phone


class AndroidPhone(Phone):
    def __init__(self, brand, model) -> None:
        super().__init__(brand, model)
