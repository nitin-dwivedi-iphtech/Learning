# Learning Swift: Variables, Constants, and Advanced Types

This repository contains my introduction to Swift, specifically focusing on how to declare data, handle data types, manage memory mutability, and work with Swift's advanced type features like Tuples and Optionals.

##  What I Learned

### 1. Constants (`let`) vs. Variables (`var`)
* **`let` (Constants):** Used for values that **cannot change** once assigned. They are immutable. Trying to reassign a `let` constant will throw a compilation error.
* **`var` (Variables):** Used for values that **can change** over time. They are mutable.
* **Type Inference:** Swift automatically determines the data type based on the value assigned if you don't explicitly declare one.

### 2. Type Annotation & Type Aliasing
* **Type Annotation:** You can explicitly tell Swift exactly what kind of data a variable or constant should hold by using a colon (`:`) followed by the type name.
* **Type Aliasing:** Allows you to create an alternative name (`typealias`) for an existing type, making your code more contextual and readable.

### 3. Core Swift Data Types
* `Int`: Integer numbers (including unsigned or explicit bit-widths like `UInt8`, `UInt16`, `UInt32`, `UInt64`).
* `Double` / `Float`: Floating-point/decimal numbers (e.g., `3.14`).
* `String`: Textual data (e.g., `"Alice"`).
* `Bool`: Boolean values (`true` or `false`).
* `Character`: A single character literal (e.g., `"A"`).

### 4. Tuples
Tuples group multiple values into a single compound value. The values within a tuple can be of any type. Swift allows you to:
* **Decompose** tuple values directly into separate constants or variables.
* **Ignore** parts of a tuple using the underscore (`_`) wildcard.
* Use **Named Elements** for cleaner, property-like access.

### 5. Optionals & Safety
Optionals are a core safety feature in Swift used to handle the absence of a value. A variable marked with a `?` can either hold a value or be `nil` (nothing). They are safely unwrapped using:
* **Optional Binding (`if let`):** Safely checks and unwraps a value if it exists.
* **Guard Statements (`guard let`):** Used for early exit strategies if a value is missing.
* **Nil-Coalescing Operator (`??`):** Provides a fallback default value if the optional is `nil`.

---

##  Code Examples

### Basic Declarations & Type Inference
```swift
// Declaring a constant (Immutable)
let maxScore = 100
print(maxScore)
// maxScore = 120 //  This will result in a compilation error

// Declaring a variable (Mutable) with Type Inference
var currentName = "John"
currentName = "Doe" //  This is allowed
print(currentName)