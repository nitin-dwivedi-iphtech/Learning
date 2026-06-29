// Swift Control Flow Examples

// For-In Loops (Collections & Ranges)

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
    // Renders every 5 minutes (0, 5, 10 ... 55)
    print("Tick: \(tickMark)")
}

// Using Stride (Closed: including the through marker)
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // Renders every 3 hours (3, 6, 9, 12)
    print("Hour Tick: \(tickMark)")
}


// While Loops

// While loop (Evaluates condition at the START)
var count = 3
while count > 0 {
    print("Count is \(count)")
    count -= 1
}

// Repeat-While loop (Evaluates condition at the END - runs at least once)
var step = -1
repeat {
    print("This runs at least once even if the condition is false!")
    step -= 1
} while step > 0


// Conditional Branches (If & Switch)

// Inline If-Statement Expression (Swift 5.9+)
let temperatureInCelsius = 25
let weatherAdvice = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)

// Switch Statement with Compound Cases (No explicit break needed in Swift)
let someCharacter: Character = "z"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}

// Switch with Value Binding & Where Clauses
func evaluatePoint(_ point: (Int, Int)) {
    switch point {
    case let (x, y) where x == y:
        print("somewhere on the diagonal line x == y (\(x),\(y))")
        
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
        
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
}

evaluatePoint((3, 3)) 
evaluatePoint((2, 0)) 
evaluatePoint((0, 0)) 


// Early Exit & Scope Control (Guard & Defer)

// Guard Statement for Early Exit Clean Up
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        print("Error: Name missing from record.")
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice where you are.")
        return
    }
    
    print("I hear the weather is nice in \(location).")
}
greet(person: ["name": "John", "location": "Cupertino"])

// Defer Block (Executes clean-up execution right before exiting current scope)
func testDeferScope() {
    print("Step 1")
    defer {
        print("Step 3 (Deferred Clean Up)")
    }
    print("Step 2")
}
testDeferScope()