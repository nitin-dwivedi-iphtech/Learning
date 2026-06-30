# Swift Extensions & Protocol Default Implementations

This repository contains practical examples demonstrating how to use **Extensions** in Swift to enhance built-in primitive types, as well as how to provide **Default Implementations** for Protocols using Protocol Extensions.

## Key Concepts Explored

### 1. Concrete Type Extensions (`extension Double`)
* **Retrospective Modeling:** Extensions allow you to inject new methods, computed properties, and initializers into types you don't explicitly own (such as Swift's built-in `Double`, `Int`, or `String` structures).
* **Utility Organization:** Instead of writing disjointed global helper helper functions like `convertCelsius(double)`, adding methods directly onto the type (`temperature.celsiusToFahrenheit()`) promotes clean, readable, and object-oriented code syntax.

### 2. Protocol Extensions & Default Implementations
* **Behavior Injection:** Standard protocols only provide a blueprint and cannot contain executable code. However, by extending the protocol (`extension CanSwim`), you can supply a **default implementation** for its methods.
* **Reducing Boilerplate:** Any structural type (`struct`, `class`, or `enum`) that conforms to the protocol inherits this default behavior for free. Conforming types like `Fish` only need to declare the properties—Swift automatically handles the method fallback execution under the hood!

---

## Code Reference

```swift
import Foundation

// =================================================================
// 1. EXTENDING CONCRETE TYPES (Double)
// =================================================================

extension Double {
    /// Converts the current Celsius double value to Fahrenheit
    func celsiusToFahrenheit() -> Double {
        return (self * 9/5) + 32
    }

    /// Converts the current Fahrenheit double value to Celsius
    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5/9
    }
}

// Testing Double Extensions
var temperatureInCelsius: Double = 25.0
var temperatureInFahrenheit = temperatureInCelsius.celsiusToFahrenheit()
print("\(temperatureInCelsius)°C is equal to \(temperatureInFahrenheit)°F") 

var temperatureInFahrenheit2: Double = 77.0
var temperatureInCelsius2 = temperatureInFahrenheit2.fahrenheitToCelsius()
print("\(temperatureInFahrenheit2)°F is equal to \(temperatureInCelsius2)°C")


// =================================================================
// 2. PROTOCOL EXTENSIONS (Default Implementations)
// =================================================================

protocol CanSwim {
    var isSwimming: Bool { get set }
    func swim()
}

// Providing the default implementation for the blueprint requirement
extension CanSwim {
    func swim() {
        isSwimming ? print("Swimming 🐟") : print("Not swimming")
    }
}

// Conforming Struct inherits the default method automatically
struct Fish: CanSwim {
    var isSwimming: Bool
    // 'swim()' implementation is implicitly inherited here!
}

// Testing Protocol Extensions
let fish = Fish(isSwimming: true)
fish.swim()