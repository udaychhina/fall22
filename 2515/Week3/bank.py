class BankAccount:
    def __init__(self, amount = 0) -> None:
        self._amount = amount

    def deposit(self, value) -> None:
        self._amount += value
    
    def withdraw(self, value) -> None:
        if value > self._amount:
            raise ValueError("You can't withdraw more than you have.")
        self._amount -= value

    @property
    def amount(self) -> None:
        return self._amount

    @amount.setter
    def amount(self, new_value) -> None:
        if new_value < 0:
            raise ValueError("Can't have negative balance.")
        self._amount = new_value

    