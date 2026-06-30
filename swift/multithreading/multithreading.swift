import Foundation

print("1. User taps the 'Download Profile' button.")

DispatchQueue.global().async {
    print("2. Background chef starts downloading the picture...")
}

print("5. The app stays smooth and the user can still scroll!")

actor CoffeCounter{
    private var coffeeCount:Int = 0

    func placeOrder() -> Int{
        coffeeCount += 1
        return coffeeCount
    }
}

let counter = CoffeCounter()

Task{
    let count = await counter.placeOrder()
    print("Coffee count: \(count)")
}

func caffe() async -> Int{
    return await counter.placeOrder() // Error: Call to actor-isolated instance method 'placeOrder()' in a synchronous nonisolated context
}


