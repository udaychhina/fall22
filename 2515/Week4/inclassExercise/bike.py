class Bike:
    def __init__(self) -> None:
        pass

    rider = None
    distance = 0

    def start_rental(self, rider):
        if not self.rider == None:
            raise RuntimeError("Someone already rented this bike.")
        else:
            self.rider = rider

    def bike(self, distance):
        if self.rider == None:
            raise RuntimeError("There is no rider on the bike.")
        if not type(distance) == int or int(distance) < 0:
            raise AttributeError("The distance can't be negative")
        self.distance += distance

    def end_rental(self):
        if self.rider == None:
            raise RuntimeError("There was no rental started.")
        final_distance = self.distance
        self.rider = None
        self.distance = 0
        return final_distance
