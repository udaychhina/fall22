def triangle(size):
    """ This function must print a triangle using the # character on the screen.

    Example:
    >>> triangle(5)
    #
    ##
    ###
    ####
    #####

    """
    for i in range(size):
        print(f"{'#' * (i + 1)}")


def rectangle(width, height):
    """ This function must print a rectangle with the correct dimensions on the screen with #.

    !!! The rectangle is not filled with # !!!

    Examples:
    >>> rectangle(0, 0)
    
    >>> rectangle(1, 1)
    #
    
    >>> rectangle(3, 1)
    ###
    
    >>> rectangle(10, 3)
    ##########
    #        #
    ##########

    """
    print(f'{"#" * width}')
    for line in range(height - 2):
        print(f"#{' ' * (width - 2)}#")
    print(f'{"#" * width}')

if __name__ == "__main__":
    triangle(0)
    triangle(10)

    rectangle(4, 4)
    rectangle(-1, -1)
