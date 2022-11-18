import pygame


def main():
    """Main program"""
    white = (255, 255, 255)
    black = (0, 0, 0)
    # Initialize pygame
    pygame.init()

    # Create a window and fill it with a solid color
    window = pygame.display.set_mode((500, 500))
    window.fill((0, 0, 0))

    # Create a Pygame surface, and fill it a solid color
    background = pygame.Surface((500, 500))
    background.fill(black)

    pygame.draw.circle(background, white, (150, 100), 25)
    pygame.draw.circle(background, white, (350, 100), 25)
    # pygame.draw.arc(background, (160, 60, 210), pygame.Rect(100, 350, 300, 50), 3.14159, 0, 50)

    # Display the surface in the window
    window.blit(background, (0, 0))

    surface_two = pygame.Surface((300, 100))
    surface_two.fill(black)

    pygame.draw.circle(surface_two, white, (150, -100), 200)
    pygame.draw.circle(surface_two, black, (150, -150), 220)
    window.blit(surface_two, (100, 300))
    # Update the display
    pygame.display.update()

    # Event loop
    running = True
    while running:
        clock = pygame.time.Clock()
        clock.tick(60)
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False


if __name__ == "__main__":
    main()
