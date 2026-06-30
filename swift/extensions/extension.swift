// Extensions

extension Double {
    func celsiusToFahrenheit() -> Double {
        return (self * 9/5) + 32
    }

    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5/9
    }
}

var temperatureInCelsius: Double = 25.0
var temperatureInFahrenheit = temperatureInCelsius.celsiusToFahrenheit()
print("\(temperatureInCelsius)°C is equal to \(temperatureInFahrenheit)°F") 

var temperatureInFahrenheit2: Double = 77.0
var temperatureInCelsius2 = temperatureInFahrenheit2.fahrenheitToCelsius()
print("\(temperatureInFahrenheit2)°F is equal to \(temperatureInCelsius2)°C")


protocol CanSwim {
    var isSwimming: Bool { get set }
    func swim()
}

extension CanSwim {
    func swim() {
        isSwimming ? print("Swimming") : print("Not swimming")
    }
}

struct Fish: CanSwim {
    var isSwimming: Bool
}

let fish = Fish(isSwimming: true)
fish.swim()