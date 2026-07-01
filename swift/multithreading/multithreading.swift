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



func fetchWeather() async -> Int{
    try? await Task.sleep(for: .seconds(0.5)) // Simulate a network delay of 2 seconds
    return 25 // Return a dummy temperature value
}

Task{
    let temperature = await fetchWeather()
    print("The current temperature is \(temperature)°C.")
}


// Parallel execution of multiple tasks

func getAvatar() async -> String {
    try? await Task.sleep(for: .seconds(4)) // Simulate a network delay of 1 second
    return "https://example.com/avatar.jpg" // Return a dummy avatar URL
}

func getEmail() async -> String {
    try? await Task.sleep(for: .seconds(2)) // Simulate a network delay of 1 second
    return "user@example.com" // Return a dummy email address
}

func fetchWeatherData() async{
    let data = await (getAvatar(), getEmail())
    print("Avatar URL: \(data.0), Email: \(data.1)")
}

Task{
    await fetchWeatherData()
}


// Parallel execution of multiple tasks using TaskGroup

let arr:[Int] = [1,2,3,4,5]

func processArray(arr: [Int]) async -> [Int]{
    await withTaskGroup(of: Int.self){ group in
        for number in arr{
            group.addTask{
                try? await Task.sleep(for: .seconds(1)) // Simulate a network delay of 1 second
                return number * number
            }
        }
        
        var results:[Int] = []
        for await result in group{
            results.append(result)
        }
        return results

    }
}
Task{
    let data = await processArray(arr: arr)
    print(data)
}

// Actors

actor Counter {
    private var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func getCount() -> Int {
        return count
    }
}

Task {
    let counter = Counter()
    
    // We use a Task Group to run 10 things concurrently (at the same time)
    await withTaskGroup(of: Void.self) { group in
        for _ in 1...10 {
            group.addTask {
                // Every interaction with an actor's mutable state requires 'await'
                try? await Task.sleep(for: .seconds(2)) // Simulate some work
                await counter.increment()
            }
        }
    }
    
    // 3. Fetch the final count after all 10 background tasks finish
    let finalCount = await counter.getCount()
    print("Final Count: \(finalCount)") // Output will always be safely 10
}

/*
    GCD (Grand Central Dispatch) -> (Low Level)

    -> Task are not dependent on each other, they can run concurrently.

*/
DispatchQueue.global().async{
    print("Doing complex task...")
    Thread.sleep(forTimeInterval:2)

    DispatchQueue.main.async{
        print("Updating UI on the main thread...")
    }
}


/*
    Operation Queue  -> (High Level)

    -> Handels all those task which are dependent on each other, they can run concurrently.

*/

let queue = OperationQueue()

let cook = BlockOperation{
    print("Cooking food...")
    Thread.sleep(forTimeInterval: 2)
}

let serve = BlockOperation{
    print("Serving food...")
}

// we can only server when cook is done with its work

serve.addDependency(cook)

queue.addOperation(serve)
queue.addOperation(cook)


/*
    Sendables:->  Are types that can be safely shared across different threads or tasks without causing data
    races or other concurrency issues. In Swift, a type is considered Sendable if it can be safely passed between different execution contexts,
     such as threads or tasks, without introducing unexpected behavior or data corruption. 
     Sendable types are typically immutable or have well-defined synchronization mechanisms to ensure thread safety.
*/

// For structs
struct UserProfile: Sendable {
    let name: String
    let age: Int
}

// You can safely pass this struct into a background Task
let profile = UserProfile(name: "Alex", age: 28)
Task {
    print(profile.name) // Completely safe!
}


// For classes

final class ImmutableConfig: Sendable {
    let apiEndpoint: String = "https://api.example.com"
}
// main thread is using it
let config = ImmutableConfig()

// background thread is using it
Task{
    print(config.apiEndpoint) // Completely safe!
}

try? await Task.sleep(for: .seconds(100))