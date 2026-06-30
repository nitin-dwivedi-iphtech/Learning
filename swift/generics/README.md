# Learning Swift: Generics & Abstract Type Systems

This repository contains essential code patterns demonstrating how Swift utilizes **Generics** to create reusable, flexible code components while strictly preserving compile-time type safety.

## Key Concepts Learned

### 1. Type Abstraction & The Placeholder (`<T>`)
* **Eliminating Duplication:** Generics allow you to write a single algorithm (like `swapValues` or `pairUp`) that works with *any* data type, eliminating the need to write identical clone functions for `Int`, `String`, or custom objects.
* **Compile-Time Inference:** When you pass arguments into a generic function, the Swift compiler dynamically infers what type parameter `T` represents and locks it down instantly for that specific execution instance.

### 2. Descriptive Type Parameterization (`<Value>`)
* **Readability Over Cryptic Syntax:** While single letters like `<T>` are fine for simple functions, custom data structures benefit from descriptive placeholders like `<Value>` or `<Element>`.
* **Type Specialization:** Once a generic structure like `StorageBox` is initialized with a specific type (e.g., `StorageBox<String>`), its internal properties and mutating methods are strongly typed to match that specialization.

### 3. Type Constraints (`<T: Protocol>`)
* **Restricting Scope:** A raw placeholder `<T>` could represent absolutely any type, which means you cannot perform common operations like equality checking (`==`) or mathematical comparisons on it.
* **Protocol Enforcement:** By constraining a placeholder to a protocol (e.g., `<T: Equatable>`), you guarantee to the compiler that the generic type is equipped with the necessary properties or operators to execute your internal logic.

### 4. Protocol Generics (`associatedtype`)
* **Protocol Placeholders:** Protocols cannot use angle-bracket generic syntax (`<T>`). Instead, they declare a placeholder using the `associatedtype` keyword.
* **Implicit Conformance Resolution:** When a structure or class adopts the protocol, Swift looks at the properties implemented (such as an array of `[String]`) to implicitly figure out what concrete type should satisfy the `associatedtype` contract.

### 5. Advanced Constraints (`where` Clauses)
* **Granular Structural Filtering:** Using a generic `where` clause lets you cross-examine multiple generic architectures. You can enforce rules stating that two separate structures must share the exact same internal `associatedtype` payload, or that a deep nested element must conform to a supporting protocol before the function is allowed to compile.

---

## Code Reference Playground

### Generic Functions & Custom Structures
```swift
import Foundation

// 1. In-Out Parameter Type Swapping via Generic Placeholders
func swapValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 5
var y = 10
swapValues(a: &x, b: &y)
print("x: \(x), y: \(y)") // Outputs: x: 10, y: 5

// 2. Compile-Time Type Inference mapping
func pairUp<T>(first: T, second: T) -> [T] {
    return [first, second]
}

let stringPair = pairUp(first: "Apple", second: "Banana") // T is inferred as String
let numberPair = pairUp(first: 7, second: 11)             // T is inferred as Int


// 3. Descriptive Generic Type Wrapping
struct StorageBox<Value> {
    var contents: Value
    
    mutating func updateContents(to newValue: Value) {
        self.contents = newValue
    }
}

var toyBox = StorageBox<String>(contents: "Teddy Bear")
var pointBox = StorageBox<Int>(contents: 42)