class Detonator():
    def __init__(self) -> None:
        self.good = 25
        self.bad = 5
        self.total = self.good + self.bad

    def useGood(self):
        self.good -= 1
        print(f'{self.good} / {self.good + self.bad}')

    def useBad(self):
        self.bad -= 1
        print(f'{self.bad} / {self.good + self.bad}')
    
    def statusGood(self):
        print(f'{self.good} / {self.good + self.bad}')

    def statusBad(self):
        print(f'{self.bad} / {self.good + self.bad}')
        


