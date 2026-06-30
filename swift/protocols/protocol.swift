import Foundation

// Protocols

protocol CanBreathe{
    var isAlive: Bool { get set }
    func breathe()
}

struct Animal:CanBreathe{
    var isAlive: Bool
    func breathe() {
        isAlive ? print("Animal is breathing") : print("Animal is not alive")
    }
}

let dog = Animal(isAlive: true)
dog.breathe()

class Human:CanBreathe{
    var isAlive: Bool
    init(isAlive: Bool) {
        self.isAlive = isAlive
    }
    func breathe() {
        isAlive ? print("Human is breathing") : print("Human is not alive")
    }
}

let person = Human(isAlive: true)
person.breathe()