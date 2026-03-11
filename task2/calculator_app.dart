// Task 2: Async Calculator App (Functional Style)
// Purpose: Demonstrating functional programming, Exception Handling, and Asynchronous programming.

import 'dart:async';

// Synchronous arithmetic functions[cite: 138].
double add(double a, double b) => a + b;
double subtract(double a, double b) => a - b;
double multiply(double a, double b) => a * b;

/// Performs division and throws an ArgumentError if dividing by zero[cite: 139].
double divide(double a, double b) {
  if (b == 0) {
    throw ArgumentError('Cannot divide by zero.');
  }
  return a / b;
}

// A map of operation names to their corresponding functions.
final Map<String, double Function(double, double)> _operations = {
  'add': add,
  'subtract': subtract,
  'multiply': multiply,
  'divide': divide,
};

/// Simulates a 1.5-second network delay before returning a result[cite: 140, 153].
Future<double> computeAsync(double a, double b, String op) async {
  final operation = _operations[op];

  if (operation == null) {
    throw ArgumentError('Unknown operation: $op');
  }

  final result = operation(a, b);

  // Using a named constant for the delay is recommended code quality[cite: 214].
  const delay = Duration(seconds: 1, milliseconds: 500);
  await Future.delayed(delay);
  return result;
}

/// Awaits the calculation and handles potential errors gracefully[cite: 141, 154].
Future<void> displayResult(double a, double b, String op) async {
  try {
    final result = await computeAsync(a, b, op);
    print('$op($a, $b) = $result');
  } catch (e) {
    // Catching errors like divide-by-zero to prevent program crash[cite: 154, 225].
    print('Error: ${e.toString().replaceFirst('Invalid argument(s): ', '')}');
  }
}

Future<void> main() async {
  const calculatorName = 'MyCalculator';
  print('--- $calculatorName ---');

  // Calling displayResult 6 times, including a zero divisor case[cite: 156].
  await displayResult(10, 4, 'add');
  await displayResult(10, 4, 'subtract');
  await displayResult(10, 4, 'multiply');
  await displayResult(10, 4, 'divide');
  await displayResult(15, 3, 'divide');
  await displayResult(10, 0, 'divide'); // Error test case[cite: 178].

  print('All calculations complete.');
}
