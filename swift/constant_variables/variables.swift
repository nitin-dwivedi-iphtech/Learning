//  Constants vs Variables

/*
    'let' is used to declare constants.
    Once assigned, their value cannot be changed.
    
    let number = 10 
    number = 20 // This will result in a compilation error
*/
let maxScore = 100
print(maxScore)

/*
    'var' is used to declare mutable variables.
    Swift uses 'Type Inference' to automatically determine the data type.
*/
var currentName = "John"
currentName = "Doe" // This is allowed
print(currentName)


//Type Annotation

/*
    You can manually specify the data type using a colon (:).
    This is called 'Type Annotation'.
*/
var age: Int = 30
print(age)

/*
    Common Swift Data Types:
    Int (UInt8, UInt16, UInt32, UInt64), String, Double, Float, Bool, Character
*/

var isSwiftFun: Bool = true
let pi: Double = 3.14

print(isSwiftFun)
print(pi)

//   Type Aliasing

typealias Name = String
let myName: Name = "Alice"
print(myName)


// Tuple
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error // decompose
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error // ignore the status message
print("The status code is \(justTheStatusCode)")

let http200Status = (statusCode: 200, description: "OK") // named elements
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// Optionals

/*
    Optionals are a powerful feature in Swift that allows variables to either hold a value or be nil.
    An optional is declared by appending a '?' to the type.
*/
var optionalName: String? = "Alice"
optionalName = nil

if let optionalName = optionalName { // Optional Binding
    print("The name is \(optionalName)")
} else {
    print("The name is nil")
}

guard let unwrappedName = optionalName else { // Guard Statement
    fatalError("The name is nil") // This will terminate the program if optionalName is nil
}

// Fallback value

let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!" // ?? is fallback operator
print(greeting)


