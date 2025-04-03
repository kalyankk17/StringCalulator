# StringCalculator

The **String Calculator** is a programming exercise designed to practice **Test-Driven Development (TDD)** and incremental problem-solving. The goal is to implement a `StringCalculator` class with an `Add` method that processes a string of numbers and returns their sum, while handling various edge cases and requirements.

---

## Features

1. **Basic Cases**:
    - An empty string (`""`) returns `0`.
    - A single number (e.g., `"1"`) returns the number itself.
    - Two numbers separated by a comma (e.g., `"1,2"`) return their sum.

2. **Handle Unknown Amount of Numbers**:
    - The method can handle an unknown number of numbers separated by commas (e.g., `"1,2,3,4"`).

3. **Support Newline as a Delimiter**:
    - Numbers can also be separated by newlines (`\n`) in addition to commas (e.g., `"1\n2,3"`).

4. **Support Custom Delimiters**:
    - Custom delimiters can be specified in the format: `//[delimiter]\n[numbers...]`.
    - Example: `"//;\n1;2"` returns `3`.

5. **Handle Negative Numbers**:
    - If the input contains negative numbers, an exception is thrown with the message: `"Negatives not allowed: -x, -y"`, listing all negative numbers.

6. **Ignore Numbers Greater Than 1000**:
    - Numbers greater than `1000` are ignored (e.g., `"2,1001"` returns `2`).

7. **Support Delimiters of Any Length**:
    - Custom delimiters can be of any length, specified in square brackets: `"//[***]\n1***2***3"` returns `6`.

8. **Support Multiple Delimiters**:
    - Multiple custom delimiters can be specified in square brackets: `"//[*][%]\n1*2%3"` returns `6`.

9. **Support Multiple Delimiters of Any Length**:
    - Example: `"//[***][%%%]\n1***2%%%3"` returns `6`.

---