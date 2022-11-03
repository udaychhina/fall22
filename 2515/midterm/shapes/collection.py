import json

from shapes import Circle, Rectangle, Shape, Square


class Collection:
    """A representation of the collection of shapes
    """
    def __init__(self, name) -> None:
        if not type(name) == str:
            raise TypeError("The name must be a string.")
        self.name = name
        self.shapes = []

    def load_from_json(self, filename):
        """loads collection from json file

        Args:
            filename (string): the file to load the colection from
        """
        with open(filename, 'r') as fp:
            json_data = json.load(fp)
        self.name, self.shapes = json_data['name'], json_data['shapes']

        temp_list = []
        for object in self.shapes:
            if object['type'] in ['rectangle', 'circle', 'square']:
                if object['type'] == 'rectangle':
                    # [width, height] = object['dimensions']
                    temp_list.append(Rectangle(*object['dimensions'], object['color']))
                if object['type'] == 'circle':
                    [radius] = object['dimensions']
                    temp_list.append(Circle(radius, object['color']))
                if object['type'] == 'square':
                    [size] = object['dimensions']
                    temp_list.append(Square(size, object['color']))
                
        self.shapes = temp_list

    def __len__(self):
        """len of colection

        Returns:
            int: length of the collection
        """
        return len(self.shapes)

    def __str__(self):
        """string rep of a collection

        Returns:
            string: string rep of a collection
        """
        string_rep = f'{self.name} ({len(self.shapes)} shapes)'
        return string_rep

    def surface(self):
        """total surface ara of the collection

        Returns:
            float: the total area of all shapes in the collection
        """
        total_surface = 0
        for shape in self.shapes:
            surface = shape.surface()
            total_surface += surface
        return round(total_surface, 2)

    def find_color(self, color):
        """find shapes of the given color

        Args:
            color (string): the color to find shapes by

        Returns:
            list: the shapes matching the files
        """
        return_list = [shape for shape in self.shapes if shape.color == color]
        return_list.sort(key=lambda x: x.surface(), reverse=True)
        return return_list
