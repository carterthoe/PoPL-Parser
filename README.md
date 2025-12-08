# PythonLite Parser — ANTLR Project

## Project Description

This project implements a lightweight Python-style parser using ANTLR 4. The parser supports a simplified subset of Python syntax and is intended to demonstrate core compiler and parsing concepts such as expressions, control flow, nesting, and comment handling.

The project was completed incrementally through multiple deliverables:

Deliverable 1 focused on variable assignment, arithmetic expressions, and arrays.  
Deliverable 2 added conditional logic using if / elif / else statements and boolean expressions.  
Deliverable 3 extended the language with while loops, for loops, nested structures, and comment support.

This parser performs syntax analysis only and does not execute code or perform semantic analysis.

---

## Team Members

- Carter Thoe
- Davin Williams
- Zack Beyer

---

## Supported Language Features

The parser supports the following features:

- Variable assignment and compound assignment operators (=, +=, -=, *=, /=, %=)
- Integer, floating-point, string, and boolean values
- Arrays (list-style syntax)
- Arithmetic expressions with correct operator precedence
- Boolean expressions using and, or, and not
- Conditional statements (if / elif / else)
- While loops
- For loops using Python-style iteration (for x in expression)
- Arbitrarily nested control structures using indentation
- Comments
  - Single-line comments using #
  - Multi-line comments using triple quotes (''' ... ''')

---

## Requirements

The following tools and environment are required to run the parser:

- Java JDK 8 or higher
- ANTLR 4 
- macOS, Windows, or Linux operating system
- Terminal or command-line access

The ANTLR complete JAR file is required:
antlr-4.x-complete.jar

---

## Setup Instructions

1. Download ANTLR from the official website:
https://www.antlr.org/download.html

2. Generate the lexer and parser files from the grammar:
java -jar antlr-4.x-complete.jar Python3.g4

3. Compile the generated Java files:
javac *.java

---

## How to Run the Parser

To run the parser in text mode and display the parse tree:

java org.antlr.v4.gui.TestRig Python3 program input.py -tree

To display the parse tree graphically:

java org.antlr.v4.gui.TestRig Python3 program input.py -gui

---

## Online Testing (ANTLR Lab) (Easiest)

This grammar can also be tested using the ANTLR online lab:

1. Navigate to http://lab.antlr.org
2. Paste the grammar into the Parser tab
3. Clear the Lexer tab
4. Set the start rule to program
5. Paste sample input code and run the parser

---

## Project Demo

Demo video link:
[Insert video link here]

---

## Notes

- Indentation is handled using tabs rather than spaces.
- This project is intended for academic purposes and does not fully implement Python.
