// Task 2: OOP Calculator App
// Purpose: Demonstrating Object-Oriented Programming, Exception Handling, and Asynchronous programming.

import 'dart:async';

/// Calculator class that performs arithmetic operations asynchronously with exception handling.
class Calculator {
  /// Performs addition asynchronously with a simulated delay.
  Future<double> add(double a, double b) async {
    await _simulateDelay();
    return a + b;
  }

  /// Performs subtraction asynchronously with a simulated delay.
  Future<double> subtract(double a, double b) async {
    await _simulateDelay();
    return a - b;
  }

  /// Performs multiplication asynchronously with a simulated delay.
  Future<double> multiply(double a, double b) async {
    await _simulateDelay();
    return a * b;
  }

  /// Performs division asynchronously with a simulated delay.
  /// Throws [ArgumentError] if dividing by zero.
  Future<double> divide(double a, double b) async {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    await _simulateDelay();
    return a / b;
  }

  /// Computes the result of the specified operation asynchronously.
  /// Throws [ArgumentError] for unknown operations or invalid inputs.
  Future<double> compute(double a, double b, String operation) async {
    switch (operation.toLowerCase()) {
      case 'add':
        return await add(a, b);
      case 'subtract':
        return await subtract(a, b);
      case 'multiply':
        return await multiply(a, b);
      case 'divide':
        return await divide(a, b);
      default:
        throw ArgumentError('Unknown operation: $operation');
    }
  }

  /// Displays the result of a calculation, handling errors gracefully.
  Future<void> displayResult(double a, double b, String operation) async {
    try {
      final result = await compute(a, b, operation);
      print('$operation($a, $b) = $result');
    } catch (e) {
      // Handle errors like divide-by-zero or unknown operations
      print('Error: ${e.toString().replaceFirst('Invalid argument(s): ', '')}');
    }
  }

  /// Simulates a network delay for asynchronous operations.
  Future<void> _simulateDelay() async {
    const delay = Duration(seconds: 1, milliseconds: 500);
    await Future.delayed(delay);
  }
}

Future<void> main() async {
  const calculatorName = 'MyCalculator';
  print('--- $calculatorName ---');

  final calculator = Calculator();

  // Calling displayResult 6 times, including a zero divisor case
  await calculator.displayResult(10, 4, 'add');
  await calculator.displayResult(10, 4, 'subtract');
  await calculator.displayResult(10, 4, 'multiply');
  await calculator.displayResult(10, 4, 'divide');
  await calculator.displayResult(15, 3, 'divide');
  await calculator.displayResult(10, 0, 'divide'); // Error test case

  print('All calculations complete.');
}
