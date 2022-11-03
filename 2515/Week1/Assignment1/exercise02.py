def count_people(filename: str):
    with open(filename, 'r') as fp:
        contents = fp.read()
        names = contents.split()
        return len(names)