# Learning Swift: Operators

This repository contains my introduction to Swift operators, covering everything from basic assignment and arithmetic to advanced range and logical operators.

##  What I Learned

### 1. Assignment Operators
* **Standard Assignment (`=`):** Initializes or updates a value. Unlike some languages, Swift's assignment operator does not return a value (to prevent accidental `if a = b` bugs).
* **Tuple Assignment:** Allows you to break apart a tuple and assign multiple constants or variables simultaneously.

### 2. Arithmetic & Unary Operators
* **Standard Arithmetic:** Supports addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), and remainder (`%`).
* **Unary Minus (`-`) & Plus (`+`):** The unary minus toggles the sign of a numeric value. The unary plus simply returns the value unchanged (used for symmetry/code clarity).
* **Compound Assignment (`+=`, `-=`, etc.):** Combines an arithmetic operation with an assignment step into a single operation.

### 3. Comparison & Conditional Operators
* **Comparison Operators:** Used to test values (e.g., `==`, `!=`, `<`, `>`). They always return a Boolean value (`true` or `false`).
* **Ternary Conditional Operator (`a ? b : c`):** A shortcut for an `if-else` statement. If condition `a` is true, evaluate `b`; otherwise, evaluate `c`.
* **Nil-Coalescing Operator (`??`):** Unwraps an optional value if it contains a value, or returns a default fallback value if the optional is `nil`.

### 4. Range Operators
Swift includes shorthand representations for sequences of values:
* **Closed Range (`a...b`):** Defines a range that runs from `a` to `b`, including both values.
* **Half-Open Range (`a..<b`):** Defines a range that runs from `a` to `b`, but *excludes* `b`.
* **One-Sided Range (`a...` or `...b`):** Defines a range that continues as far as possible in one direction (often used to reference elements from an index to the end of a collection).

### 5. Logical Operators
Used to modify or combine Boolean logic values:
* **Logical NOT (`!a`):** Inverts a Boolean value (`true` becomes `false`, and vice-versa).
* **Logical AND (`a && b`):** Returns true only if *both* values are true.
* **Logical OR (`a || b`):** Returns true if *at least one* of the values is true.

---

##  Code Examples

### Assignment & Arithmetic
```swift
// Assignment Operators
let b = 10
var a = 5
a = b
print("a: \(a), b: \(b)")

let (x, y) = (1, 2) // Tuple assignment
print("x: \(x), y: \(y)")

// Arithmetic Operators
let sum = 5 + 3          // Addition
let difference = 10 - 4  // Subtraction
let product = 6 * 7      // Multiplication
let quotient = 20 / 4    // Division
let remainder = 10 % 3   // Remainder 

print("Sum: \(sum), Difference: \(difference), Product: \(product), Quotient: \(quotient), Remainder: \(remainder)")

// Unary Operators
let negativeSum = -sum
print("Negative Sum: \(negativeSum)")

let positiveSum = +sum
print("Positive Sum: \(positiveSum)")

// Compound Assignment Operators
var compoundValue = 10
compoundValue += 5 // compoundValue = compoundValue + 5
print("Compound Value after += 5: \(compoundValue)")