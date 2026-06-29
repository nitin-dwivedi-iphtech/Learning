// Operators

/* 
    Assignment Operators
    The assignment operator (a = b) initializes or updates the value of a with the value
*/
let b = 10
var a = 5
a = b
print("a: \(a), b: \(b)")

let (x, y) = (1, 2) // Tuple assignment
print("x: \(x), y: \(y)")

/* 
    Arithmetic Operators
    Swift supports the standard arithmetic operators: addition (+), subtraction (-), multiplication (*), division (/), and remainder (%).
*/
let sum = 5 + 3 // Addition
let difference = 10 - 4 // Subtraction
let product = 6 * 7 // Multiplication
let quotient = 20 / 4 // Division
let remainder = 10 % 3 // Remainder 

print("Sum: \(sum), Difference: \(difference), Product: \(product), Quotient: \(quotient), Remainder: \(remainder)")


// Unary Minus operator
let negativeSum = -sum
print("Negative Sum: \(negativeSum)")

// Plus operator
let positiveSum = +sum
print("Positive Sum: \(positiveSum)")

// Compound Assignment Operators
var compoundValue = 10
compoundValue += 5 // compoundValue = compoundValue + 5
print("Compound Value after += 5: \(compoundValue)")

// Comparison Operators
let isEqual = (5 == 5) // true
let isNotEqual = (5 != 3) // true
let isGreaterThan = (10 < 5) // false

// Ternary Conditional Operator
let aValue = 10
let bValue = 20
let maxValue = (aValue > bValue) ? aValue : bValue // maxValue will be 20
print("Max Value: \(maxValue)")

// Nil-Coalescing Operator
let optionalValue: Int? = nil
let defaultValue = optionalValue ?? 42 // If optionalValue is nil, defaultValue will be 42
print("Default Value: \(defaultValue)")

// Range Operators
let range = 1...5 // Closed range from 1 to 5
for number in range {
    print("Number in range: \(number)")
}

// Half-Open Range Operator
let halfOpenRange = 1..<5 // Half-open range from 1 to 4
for number in halfOpenRange {
    print("Number in half-open range: \(number)")
}

// One-Sided Ranges
let names = ["Alice", "Bob", "Charlie", "David", "Eve"]
for name in names[2...] { // From index 2 to the end
    print("Name from index 2 to end: \(name)")
}

// Logical Operators
let isTrue = true
let isFalse = false
let logicalAnd = isTrue && isFalse // false
let logicalOr = isTrue || isFalse // true
let logicalNot = !isTrue // false   

