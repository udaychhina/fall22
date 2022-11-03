from bank import BankAccount

def test_account_has_amount():
    account = BankAccount()
    assert hasattr(account, "amount")

def test_amount_zero():
    account = BankAccount()
    assert account.amount == 0

def test_deposit():
    account = BankAccount()
    
    account.deposit(1000)
    assert account.amount == 1000

    account.deposit(1000)
    assert account.amount == 2000

def test_withdraw():
    account = BankAccount()
    
    account.deposit(1000)
    assert account.amount == 1000

    account.withdraw(500)
    assert account.amount == 500