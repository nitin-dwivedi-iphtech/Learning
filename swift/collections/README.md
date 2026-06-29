# Learning Swift: Collections (Arrays, Sets, and Dictionaries)

This repository contains my introduction to Swift collections. It demonstrates how to store, modify, and iterate through ordered lists (Arrays), unique unordered groups (Sets), and key-value associations (Dictionaries).

## What I Learned

### 1. Arrays
* **Ordered Collection:** Arrays store values of the same type in an ordered list. Elements can be duplicated, and access is fast using 0-based integer indices.
* **Initialization:** Elements can be added via `.append()`, generated with a default repeating value, or concatenated using the `+` operator.
* **Enumeration:** You can iterate through elements directly, or use `.enumerated()` to safely extract both the loop index and the value simultaneously.

### 2. Sets
* **Unordered, Unique Values:** A `Set` stores distinct values of the same type with no defined ordering. It is optimized for checking whether an item exists inside the collection (membership tests).
* **Set Operations:** Swift makes mathematical operations easy with built-in methods like `.union()` (combining sets) and `.intersection()` (finding common elements).
* **Safe Eviction:** Removing items can return an optional value depending on whether the element was present in the collection.

### 3. Dictionaries
* **Key-Value Associations:** Dictionaries store associations between keys of the same type and values of the same type in an unordered collection. Each key must be unique.
* **Optional Lookup:** Accessing a dictionary by its key always returns an *Optional* value because the requested key might not exist.
* **Key/Value Extraction:** You can cleanly isolate and export all keys or values independently into dedicated standalone standard arrays using `Array(dictionary.keys)` or `Array(dictionary.values)`.

---

## Code Examples

### Arrays
```swift
var array: [Int] = [1, 2, 3, 4, 5]
print("Array: \(array)")

// Adding elements to an array
array.append(6)
print("Array after appending 6: \(array)")

// Removing elements from an array
array.remove(at: 0) // Removes the first element
print("Array after removing the first element: \(array)")

// Iterating through an array
for element in array {
    print("Element: \(element)")
}

// Enumerated loop for index and value tracking
for (index, value) in array.enumerated() {
    print("Item \(index + 1): \(value)")
}

// Default values in an array
var defaultArray = Array(repeating: 0, count: 5) // Creates [0, 0, 0, 0, 0]
print("Default Array: \(defaultArray)") 

// Adding arrays together
let array1 = [1, 2, 3]
let array2 = [4, 5, 6]
let combinedArray = array1 + array2
print("Combined Array: \(combinedArray)")

// Accessing elements safely via first property or directly via subscripting
if let firstElement = array.first {
    print("First element: \(firstElement)")
}

print("Access element at index 2: \(combinedArray[2])") // Accessing the third element