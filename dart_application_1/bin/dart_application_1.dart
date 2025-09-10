import 'dart:io';
import 'dart:math';

void main() {
  // List of words to be used in the game
  List<String> wordList = [
    "banana",
    "ear",
    "apple",
    "blue",
    "destruction",
    "security",
    "paint"
  ];

  // Pick a random word from wordList
  String randomWord = wordList[Random().nextInt(wordList.length)].toLowerCase();

  // List to store guessed letters
  List<String> guessedLetters = [];

  // Fill guessedLetters with asterisks
  for (int i = 0; i < randomWord.length; i++) {
    guessedLetters.add("*");
  }

  // Game variables
  int lives = 6;
  List<String> usedLetters = [];

  print("Welcome to the Hangman game!");
  print("Guess the following word:");
  print(guessedLetters.join());

  // Loop continues while lives remain and word not guessed
  while (guessedLetters.join() != randomWord && lives > 0) {
    print("\nLives left: $lives");
    stdout.write("Enter a letter: ");
    String? input = stdin.readLineSync();

    // Validate input
    if (input == null || input.isEmpty || input.length != 1) {
      print("Please enter a single letter!");
      continue;
    }

    input = input.toLowerCase();

    if (usedLetters.contains(input)) {
      print("You have already used that letter!");
      continue;
    }

    usedLetters.add(input);

    if (randomWord.contains(input)) {
      for (int i = 0; i < randomWord.length; i++) {
        if (randomWord[i] == input) {
          guessedLetters[i] = input;
        }
      }
      print("Correct!");
    } else {
      lives--;
      print("Incorrect!, $lives lives left");
    }

    print(guessedLetters.join());
    print("Used letters: ${usedLetters.join(", ")}");
  }

  if (guessedLetters.join() == randomWord) {
    print("Congratulations! You guessed the word: $randomWord");
  } else {
    print("Game over! The correct word was: $randomWord");
  }
}