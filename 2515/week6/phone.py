class Phone:
    def __init__(self, brand, model) -> None:
        if type(brand) != str or type(model) != str:
            raise TypeError(
                "Brand and model of the phone can only be strings.")
        self.brand = brand
        self.model = model
