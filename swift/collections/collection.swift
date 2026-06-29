// Arrays

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

for (index, value) in array.enumerated() {
    print("Item \(index + 1): \(value)")
}

// Default values in an array
var defaultArray = Array(repeating: 0, count: 5) // Creates an array of 5 elements, all initialized to 0
print("Default Array: \(defaultArray)") 

// Adding arrays together
let array1 = [1, 2, 3]
let array2 = [4, 5, 6]
let combinedArray = array1 + array2
print("Combined Array: \(combinedArray)")

// Accessing elements in an array
if let firstElement = array.first {
    print("First element: \(firstElement)")
}

print("Access element at index 2: \(combinedArray[2])") // Accessing the third element (index starts at 0)


// Sets
var set: Set<Int> = [1, 2, 3, 4, 5]
set.insert(6) // Adding an element
print("Set after inserting 6: \(set)")
guard let removedElement = set.remove(3) else {
    fatalError("Element not found in the set.")
}
print("Removed element: \(removedElement)")
print("Set: \(set)")    

// Iterating through a set
for element in set {
    print("Set Element: \(element)")
}

// set operations
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [4, 5, 6, 7, 8]
let unionSet = setA.union(setB).sorted() // Union of two sets with sorting
print("Union of setA and setB: \(unionSet)")
let intersectionSet = setA.intersection(setB) // Intersection of two sets
print("Intersection of setA and setB: \(intersectionSet)")  

// Dictionaries
var dictionary: [String: Int] = ["Alice": 30, "Bob": 25] // we can create empty dictionary using [:] or Dictionary<Key, Value>()
print("Dictionary: \(dictionary)")


// Adding a new key-value pair
dictionary["Charlie"] = 35
print("Dictionary after adding Charlie: \(dictionary)")


// Removing a key-value pair
guard let removedValue = dictionary.removeValue(forKey: "Bob") else {
    fatalError("Key not found in the dictionary.")
}
print("Dictionary after removing Bob: \(dictionary)")

// Iterating through a dictionary
for (key, value) in dictionary {
    print("\(key): \(value)")
}
 
// Accessing values in a dictionary
if let ageOfAlice = dictionary["Alice"] {
    print("Alice's age is \(ageOfAlice)")
} else {
    print("Alice's age is not found.")
}

// storing keys or values in array
let keysArray = Array(dictionary.keys)
print("Keys in the dictionary: \(keysArray)")
let valuesArray = Array(dictionary.values)
print("Values in the dictionary: \(valuesArray)")