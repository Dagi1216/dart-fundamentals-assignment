Dart Fundamentals Assignment

Student Name: Dagim Melese
Student ID: ATE/4246/15


​ Project Overview
​This repository contains the implementation of two core Dart programming tasks focusing on collection handling, Object-Oriented Programming (OOP), and Asynchronous operations.

Task 1: Number Analysis App
​Core Logic: Implemented using manual for loops to process a List<int> containing both positive and negative integers.

​Functions: Includes findMax, findMin, calculateSum, and calculateAverage.
​Design Principle: Reuses calculateSum inside calculateAverage to maintain DRY (Don't Repeat Yourself) code standards.
​Task 2: Async Calculator App
​OOP Design: Utilizes a Calculator class with a typed constructor and modular arithmetic methods.
​Error Handling: Implements a try-catch block to gracefully handle ArgumentError specifically for division by zero.
​Asynchrony: Uses Future.delayed with a duration of 1.5 seconds to simulate real-world data processing delays.

​How to Run

​You can run these files using DartPad (dartpad.dev):
​Open DartPad (https://dartpad.dev/).
​Copy the contents of either number_analysis.dart or calculator_app.dart.
​Click the Run button.
​For Task 2, observe the console for the 1.5-second pause between calculation results.
Repository Structure

dart-fundamentals-assignment/
├── task1/
│   └── number_analysis.dart   # List processing and manual loops
├── task2/
│   └── calculator_app.dart    # OOP, Exception handling, and Async/Await
├── reflection.md              # Answers to conceptual questions QR1-QR4
└── README.md                  # Project documentation