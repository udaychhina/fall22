from customer import Customer

class Account:
    """A class that represents an Account for a customer.
    """    
    def __init__(self, owner, interest_rate=0) -> None:
        if type(owner) != Customer:
            raise AttributeError("Please pass a customer not a string.")
        self.owner = owner
        self.amount = 0
        self.interest = interest_rate

    def deposit(self, dep_amount):
        """Deposits money in the account

        Args:
            dep_amount (float): The amount of money ot be deposited

        Raises:
            AttributeError: Checks if the amount of money being deposited is
            less than 0 or not.
        """
        if dep_amount < 0:
            raise AttributeError("The amount cannot be negative.")
        self.amount += dep_amount

    def withdraw(self, withdraw_amount):
        """Withdraws money from the account

        Args:
            withdraw_amount (float): the amount of money to be withdrawn from
            the account

        Raises:
            AttributeError: Checks if the amount of money being deposited is
            less than 0 or not.
        """
        if withdraw_amount < 0:
            raise AttributeError("The amount cannot be negative.")
        self.amount -= withdraw_amount

    def transfer(self, account, amount):
        """Transfers money from the current account to the given account

        Args:
            account (Account): The account to which the money will be transferred.
            amount (float): The amount of money to be transferred.

        Raises:
            TypeError: Checks to make sure that the account is of type Account
        """
        if type(account) != Account:
            raise TypeError("Account is of incorrect type.")
        self.withdraw(amount)
        account.deposit(amount)

    def compute_interest(self):
        """Computes interest for the accounts
        """
        self.amount = self.amount * (100 + self.interest) / 100
        

class CreditAccount(Account):
    """A child of Account, representing a credit account for a customer.
    """
    def compute_interest(self):
        """Computes interest for a credit account (when money is less than 0)
        """
        if self.amount < 0:
            super().compute_interest()
            self.amount -= 10


class SavingsAccount(Account):
    """A child class of Account, representing a savings accounts for the customer.
    """
    def compute_interest(self):
        """Computes interest for the money in the savings account
        """
        super().compute_interest()

    def withdraw(self, withdraw_amount):
        """Withdraws money from a savings account

        Args:
            withdraw_amount (float): The amount of money to be withdrawn

        Raises:
            UserWarning: Checks to see if more money is being withdrawn than is
            in the account
        """
        if withdraw_amount > self.amount:
            raise UserWarning(
                "Trying to withdraw more money than available in the account.")
