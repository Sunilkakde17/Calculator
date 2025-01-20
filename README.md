# Calculator
A new Flutter project.

This is a simple yet functional mobile application built with Flutter. It emulates a basic calculator, with the standard arithmetic operations: addition, subtraction, multiplication, and division. In addition, it includes a history log and error handling for invalid input, such as division by zero.

## Key Features

 1. Basic Arithmetic Operations
  - The app performs the basic operations: addition (+), subtraction (-), multiplication (*), and division (/).
  - The user interface of buttons is clean and simple, allowing inputs of numbers and operators.

 2. Clear Functionality
  - The "C" button clears the current input and resets the display to 0.

 3. Backspace Button (X)
  - The backspace functionality helps the user remove the last character from the current string in the input. This helps correct possible mistakes made during the     process.

 4. Calculation History
  - The app stores the history of calculations made, showing the equation and the result in a history log.
  - The "History" button opens a dialog box where the user can view previous calculations.

 5. Error Handling
  - The app gracefully handles errors, including division by zero, and displays a user-friendly error message in case of invalid input.

 6. Responsive Layout
  - The layout of the calculator is responsive and clean with 'fitting' buttons for various sizes of screens.

 7. Material Design
  - The application uses Material Design, adhering to the guidelines provided by Flutter using `MaterialApp` and `ThemeData` to ensure it is both aesthetically pleasing and functional.

## Application Structure

 1. `CalculatorApp` Widget
  - This widget serves as the main entry point for running the app and sets up the theme and title.

 2. `CalculatorHomePage` Stateful Widget
  - The `CalculatorHomePage` widget controls the state of the application, including the `_input` and the result to be shown (`_output`).
  - The class `State`, `_CalculatorHomePageState`, contains the logic for handling button clicks, calculations, and history.

 3. Logic for Button
  - The function `_onButtonPressed` handles input whenever a button on the calculator is clicked. Based on which button is pressed (number, operator, clear, etc.), the UI is updated.

 4. Calculation Logic
  - The `_calculateResult` function uses regular expressions to parse the input expression, split it into tokens (numbers and operators), and then perform the arithmetic operations to compute the result.

 5. History
  - The `_history` list stores all calculations performed and allows users to view a history of their previous calculations via the "History" button.

 6. Backspace & Clear Functions
  - The "X" button provides backspace functionality (deletion of the previous character).
  - The "C" button resets any input entered.

 7. History Dialog
  - The `_showHistoryDialog` function displays a dialog showing the computations made by the user.

## Technologies Used
- **Flutter**: A UI toolkit to implement natively-compiled applications for mobile, web, and desktop from a single codebase.
- **Dart**: The programming language used for the app's overall logic.
- **Material Design**: The app uses Flutter's Material Design widgets for the interface, including `ElevatedButton`, `AlertDialog`, and `Scaffold`.

## Future Enhancements
- **Advanced Mathematical Functions**: Adding scientific calculator features like square roots, exponents, trigonometric functions, etc.
- **Customization of the UI**: Implementing a feature to switch between light and dark modes of the UI.
- **Persistent History**: Saving calculation history locally, so it persists even after closing the app.
- **Input Validation**: More robust input validation for edge cases like multiple consecutive operators or invalid characters.

---
