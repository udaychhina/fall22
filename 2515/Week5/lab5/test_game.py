import pytest
from unittest.mock import patch, mock_open
from game import Game

JSON_FILE = """[
    {
        "question": "MEDIUM question (general category)?",
        "correct_answer": "correct",
        "incorrect_answers": ["wrong", "false", "incorrect"],
        "category": "general",
        "difficulty": "medium"
    },
    {
        "question": "HARD question (other category)?",
        "correct_answer": "correct",
        "incorrect_answers": ["wrong", "false", "incorrect"],
        "category": "other",
        "difficulty": "hard"
    }
]"""


@pytest.fixture
@patch("builtins.open", new_callable=mock_open, read_data=JSON_FILE)
@patch("builtins.input", side_effect=["", "", "10"])
@patch("random.shuffle")
def game(mock_random, mock_input, mock_file):
    """We create a rigged game where the answers are 1 and 4"""
    g = Game()
    # Force the answer to question 1
    g.questions[0].answer_id = 1
    # Force the answer to question 2
    g.questions[1].answer_id = 4
    # Now we know all the answers!
    return g  

def test_game():
    """Send various user inputs and check the resulting game"""

    with patch("builtins.open", new_callable=mock_open, read_data=JSON_FILE):
        # There is only one "general" question
        with patch("builtins.input", side_effect=["general", "", "10"]):
            g = Game()
            assert len(g.questions) == 1
            assert g.questions[0].category == "general"

        # There is only one "hard" question (in "other")
        with patch("builtins.input", side_effect=["", "hard", "10"]):
            g = Game()
            assert len(g.questions) == 1
            assert g.questions[0].category == "other"
        
        # No questions match!
        with patch("builtins.input", side_effect=["general", "hard", "10"]):
            g = Game()
            assert len(g.questions) == 0

        # All questions
        with patch("builtins.input", side_effect=["", "", "10"]):
            g = Game()
            assert len(g.questions) == 2

def test_score(game):
    """Check the score calculation when playing the game"""
    # All wrong
    with patch("builtins.input", side_effect=["2", "2"]):
        game.play()
        assert game.score == 0

    # Reset score, question 1 correct (medium = 2 points)
    game.score = 0
    with patch("builtins.input", side_effect=["1", "2"]):
        game.play()
        assert game.score == 2

    # Reset score, question 2 correct (hard = 3 points)
    game.score = 0
    with patch("builtins.input", side_effect=["2", "4"]):
        game.play()
        assert game.score == 3

    game.score = 0
    with patch("builtins.input", side_effect=["1", "4"]):
        game.play()
        assert game.score == 5


def test_score_invalid_input(game):
    """Test invalid user inputs"""
    with patch("builtins.input", side_effect=["", "a", "-1", "abc", "0", "1", "2"]):
        game.play()
        assert game.score == 2
