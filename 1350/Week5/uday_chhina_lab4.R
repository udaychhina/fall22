# Author: Uday Chhina
# Date: Oct 7, 2022
# Assignment: Lab 4

# Part 1
# a
choose(26, 5)/choose(52, 5) + choose(26, 5)/choose(52, 5)

# b
1 - choose(26, 5)/choose(52, 5)

# c
# choose one type of card out of 13, then choose 3 out of those. Then choose
# one type of card out of the remaining 12, then choose 2 from them.
# Divide all of this by the combinations of 5 cards
choose(13, 1)*choose(4, 3)*choose(12, 1)*choose(4, 2) / choose(52, 5)


# Part 2
# a
(0.4 * (0.6 ^ 9)) * 10


