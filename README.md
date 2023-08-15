# Fractions
One Identity - Coding challenge

# Problem

Write a command-line program that takes operations on fractions as input and produces a fractional
result.

- The command-line program shall repeatedly prompt the user for input and display the result
until user types "exit".
- Legal operators shall be *, /, +, - (multiply, divide, add, subtract).
- Operands and operators shall be separated by one or more spaces.
- Mixed numbers shall be represented by whole&numerator/denominator; for example,
"3&1/4", "-1&7/8".
- Improper fractions, whole numbers, and negative numbers are allowed as operands.

# Prerequisites

1. Install rbenv: `brew install rbenv`
2. Add the following line to your profile file: `eval "$(rbenv init -)"`
3. With rbenv, install the right ruby version: `rbenv install`
4. Install gems: `bundle install`

# Run the app

1. Navigate to the `app` folder
2. Use the following command `ruby main.rb`
3. Write commands
4. For closing the app, use the `exit` command

# Run the tests

For running all tests, please do the following:
1. Navigate to the `tests` folder
2. Use the following command `ruby all.rb`

For running a specific test, please do the following:
1. Navigate to the `tests` folder
2. Navigate to the folder of the desired test
3. Use the following command `ruby <desired_test>.rb`

# Useful commands
- Check linting: `rubocop`  

# Improvement ideas
- Handle exponential expressions
- Handle longer expressions with more operations
