# Swift Protocols: Value vs. Reference Types

This repository contains a practical implementation of Swift Protocols (`protocol`), demonstrating how they enforce uniform behavior across both **Structures (Value Types)** and **Classes (Reference Types)**.

## Key Concepts Explored

### 1. Protocol Property Requirements (`{ get set }`)
* **The Blueprint Contract:** A protocol specifies properties with explicit access traits. Specifying `{ get set }` means any conforming type *must* allow this property to be both read from and written to after initialization.
* **Initialization Requirement:** Swift enforces strict memory safety. Conforming to a protocol with a variable property does *not* mean it gets an automatic default value. The value must still be explicitly passed or assigned when the object is created.

### 2. Structs (Value Types) and Mutability
* **Value Semantics:** Structs copy their data directly upon assignment. 
* **The `let` vs `var` Rule:** When a struct conforms to a protocol requiring a setter (`{ set }`), you **must** instantiate the struct instance as a variable (`var`) if you plan to invoke methods or properties that mutate or interact with that writeable state.

### 3. Classes (Reference Types) and Initialization
* **Reference Semantics:** Classes store references (pointers) to memory on the heap.
* **Implicit Setters:** Unlike structs, classes can safely modify internal property values even when the instance itself is declared as a constant (`let`), because the reference pointer address remains unchanged.
* **Explicit Initializers:** Classes do not receive an automatic memberwise initializer like structs do; you must write an explicit `init()` method to satisfy the setup phase.

---

## Code Reference

```swift
import Foundation

// 1. Defining the Protocol Contract
protocol CanBreathe {
    var isAlive: Bool { get set } // Must be readable and writeable after creation
    func breathe()
}

// 2. Conforming Structure (Value Type)
struct Animal: CanBreathe {
    var isAlive: Bool // Initialized during memberwise instantiation
    
    func breathe() {
        isAlive ? print("Animal is breathing 🐕") : print("Animal is not alive")
    }
}

// Struct instances must be stored as 'var' to satisfy writeable protocol scopes
var dog = Animal(isAlive: true)
dog.breathe()


// 3. Conforming Class (Reference Type)
class Human: CanBreathe {
    var isAlive: Bool
    
    // Classes require explicit initializers
    init(isAlive: Bool) {
        self.isAlive = isAlive
    }
    
    func breathe() {
        isAlive ? print("Human is breathing 🧍") : print("Human is not alive")
    }
}

// Class instances can be stored as 'let' constants and still safely mutate internal states
let person = Human(isAlive: true)
person.breathe()