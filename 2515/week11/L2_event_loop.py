import pygame
import pygame.locals

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

def create_text_surface(text):
    """This function creates a surface and renders the text argument in it"""

    # Get the default font for the system
    times_new_roman = pygame.font.SysFont("Times New Roman", 30, bold=True)
    text_surface = times_new_roman.render(text, True, (0, 0, 0))
    print(text_surface)

    return text_surface


def update_square(window, coords):
    window.fill(WHITE)
    square = pygame.Surface((50, 50))
    pygame.draw.rect(square, BLACK, pygame.Rect(coords[0], coords[1], 50, 50))
    square.fill(BLACK)
    window.blit(square, coords)


def main():
    """Main program"""
    pygame.init()
    # This is required to use pygame's font system
    pygame.font.init()

    window = pygame.display.set_mode((500, 500))
    window.fill(WHITE)
    x, y = 225, 225
    update_square(window, (x, y))
    # Event loop
    running = True
    clock = pygame.time.Clock()
    while running:
        clock.tick(120)
        for event in pygame.event.get():
            print(event.type)
            if event.type == pygame.locals.QUIT:
                running = False


        keys = pygame.key.get_pressed()
        if keys[pygame.K_LEFT]:
            x -= 1
            update_square(window, (x, y))
        if keys[pygame.K_RIGHT]:
            x += 1
            update_square(window, (x, y))
        if keys[pygame.K_UP]:
            y -= 1
            update_square(window, (x, y))
        if keys[pygame.K_DOWN]:
            y += 1
            update_square(window, (x, y))
        pygame.display.update()


if __name__ == "__main__":
    main()
