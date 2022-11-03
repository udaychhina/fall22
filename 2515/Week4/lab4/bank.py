from account import Account, SavingsAccount, CreditAccount

class Bank:
    """A class for the implementation of a Bank.
    """
    def __init__(self, name) -> None:
        self.name = name
        self.accounts = []

    def create_account(self, category, owner, interest_rate = 0):
        """Creates a banks account

        Args:
            category (string): The category of of account to be created
            owner (Customer): The owner of the account. Class - Customer from customer.py
            interest_rate (int, optional): The interest rate to be used for the
            accounts. Defaults to 0.

        Returns:
            Account: an account of the type Account
        """        
        match category:
            case "account":
                new_account = Account(owner, interest_rate)
            case "savings":
                new_account = SavingsAccount(owner, interest_rate)
            case "credit":
                new_account = CreditAccount(owner, interest_rate)
        self.accounts.append(new_account)
        return new_account

    def compute_interest(self):
        """Computes interest for all the accounts in a bank account.
        """
        for account in self.accounts:
            account.compute_interest()

    def find_accounts(self, cust_name):
        """Finds accounts for the given customer name

        Args:
            cust_name (string): The name of the customer for whom the accounts
            must be found

        Returns:
            list: The list of accounts found for the customer
        """
        found_accounts = []
        for account in self.accounts:
            if account.owner.name == cust_name:
                found_accounts.append(account)
        return found_accounts