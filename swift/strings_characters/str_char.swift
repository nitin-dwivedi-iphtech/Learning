// String

let someString = "Some string literal value"

// Multiline String Literals
let multilineString = """
This is a multiline string literal.
It can span multiple lines.
""" 
print(multilineString)

// special characters in strings
let specialCharactersString = "\"This string contains special characters\": \n\t\"Hello, World!\""
print(specialCharactersString)

// Initializing an empty string
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("The string is empty.")
}
if anotherEmptyString.isEmpty {
    print("Another string is also empty.")
}
else {
    print("The string is: \(emptyString) and another string is: \(anotherEmptyString)")
}

// String Mutability
var mutableString = "Hello"
mutableString += ", World!" // Concatenation
print(mutableString)    


// Characters

let character: Character = "A"
let str:String = "Apple"

if str.contains(character) {
    print("The string contains the character A.")
}

// character array to string

let dogCharArray:[Character] = ["D", "o", "g", "🐶"]
let dogString = String(dogCharArray)
print("The dog string is: \(dogString)")

// String Interpolation

let name = "Alice"
let age = 30
let greeting = "Hello, my name is \(name) and I am \(age) years old."
print(greeting)

// String Indexing and Slicing

let sampleString = "Hello, Swift!"
let startIndex = sampleString.startIndex
let endIndex = sampleString.index(sampleString.startIndex, offsetBy: 5)
let substring = sampleString[startIndex..<endIndex] // Hello
print("Substring: \(substring)")

let anotherEndIndex = sampleString.index(sampleString.startIndex, offsetBy: sampleString.count)
let anotherSubstring = sampleString[startIndex..<anotherEndIndex] // Hello, Swift!
print("Another Substring: \(anotherSubstring)")


for index in sampleString.indices {
    print("Character at index \(index): \(sampleString[index])")
}

// Inserting and Removing Characters

var mutableSampleString = "Hello, Swift!"
mutableSampleString.insert("!", at: mutableSampleString.endIndex) // Insert at the end
print("After insertion: \(mutableSampleString)")
mutableSampleString.remove(at: mutableSampleString.index(before: mutableSampleString.endIndex)) //Remove last character
print("After removal: \(mutableSampleString)")

