# Learning Swift: Control Flow

This repository contains essential code patterns demonstrating how Swift handles execution flow, looping mechanics, conditional branching, pattern matching, and explicit scope constraints.

## Key Concepts Learned

### 1. For-In Loops & Strides
* **Collection Iteration:** Loops can safely unpack collections directly. When looping over a `Dictionary`, elements are exposed as a clean `(key, value)` tuple.
* **Wildcard Domain (`_`):** When the index or current item variable isn't needed, using an underscore (`_`) optimizes execution memory allocations by ignoring the value tracking.
* **Stride Control:** Swift uses `stride(from:to:by:)` for half-open intervals (excludes terminal bound) and `stride(from:through:by:)` for closed intervals (includes terminal bound) to jump steps gracefully.

### 2. Loops (`While` vs `Repeat-While`)
* **While Loops:** Evaluate conditions at the **start** of the execution sequence block. If the evaluation is initially false, the sequence block is completely skipped.
* **Repeat-While Loops:** Equivalent to `do-while` in other languages. The condition is evaluated at the **end**, guaranteeing that the execution block runs **at least once** regardless of initial validity.

### 3. Branching (`If` Expressions & Dynamic `Switch`)
* **Inline If-Expressions:** Introduced in modern Swift, `if` statements can assign values directly to variables implicitly without requiring extra assignment code within branches.
* **Pattern Matching Tuple Unwrapping:** `switch` statements can unpack tuples on the fly. By adding `where` clauses, you can inject deep logical constraint validation directly into structural case trees.
* **Fallthrough Protection:** Unlike standard C-style languages, Swift switches **do not** implicitly bleed into lower blocks. They break automatically upon matching a case block.

### 4. Scope Mechanics (`Guard` & `Defer`)
* **Guard Clauses:** Enforces early exit strategy. It keeps your code visually linear and read-friendly by checking for invalid parameters at the top and breaking scope immediately via `return` or `throw`.
* **Defer Execution:** Defers an execution block's resolution to the absolute final microsecond before a local curly-brace scope closes, functioning identically to a decoupled `finally` block.

---

## Code Reference Playground

### Loops & Strides
```swift
// Iterating over an Array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// Iterating over a Dictionary (unwrapping as Key-Value Tuples)
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// Numeric Interval Ranges (Closed Range)
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Ignoring values with an underscore (_) if the index variable isn't needed
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// Using Stride to skip intervals (Half-Open: up to but excluding 60)
let minuteInterval = 5
let minutes = 60
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("Tick: \(tickMark)") // Renders 0, 5, 10 ... 55
}

// Using Stride (Closed: including the through marker)
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print("Hour Tick: \(tickMark)") // Renders 3, 6, 9, 12
}