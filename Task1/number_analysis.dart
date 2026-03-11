// Task 1: Number Analysis App

/// Returns the largest number in the list using a manual loop.
int findMax(List<int> numbers) {
  if (numbers.isEmpty) throw ArgumentError('list must not be empty');
  // Requirement: Initialize running maximum to the first element
  int currentMax = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > currentMax) {
      currentMax = numbers[i];
    }
  }
  return currentMax;
}

/// Returns the smallest number in the list using a loop.
int findMin(List<int> numbers) {
  if (numbers.isEmpty) throw ArgumentError('list must not be empty');
  int currentMin = numbers[0];

  for (int num in numbers) {
    if (num < currentMin) {
      currentMin = num;
    }
  }
  return currentMin;
}

/// Returns the sum of all numbers using an accumulator pattern.
int calculateSum(List<int> numbers) {
  if (numbers.isEmpty) throw ArgumentError('list must not be empty');
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

/// Returns the average as a decimal by calling calculateSum() internally.
double calculateAverage(List<int> numbers) {
  // Call calculateSum() to avoid re-computing logic
  int totalSum = calculateSum(numbers);
  return totalSum / numbers.length;
}

void main() {
  final numbers = [15, -5, 8, 20, -3, 10];
  print('Analyzing the list: $numbers');
  print('-------------------------');

  // Demonstrate each function
  final max = findMax(numbers);
  print('Maximum: $max');

  final min = findMin(numbers);
  print('Minimum: $min');

  final sum = calculateSum(numbers);
  print('Sum: $sum');

  final average = calculateAverage(numbers);
  print('Average: ${average.toStringAsFixed(2)}');

  print('-------------------------');
  print('Testing with an empty list:');
  // Demonstrate error handling for an empty list
  try {
    findMax([]);
  } catch (e) {
    print(
      'Caught expected error: ${e.toString().replaceFirst('Invalid argument(s): ', '')}',
    );
  }
}
