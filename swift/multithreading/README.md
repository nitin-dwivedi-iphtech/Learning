# Swift Concurrency Notes

This file demonstrates the major concurrency concepts introduced in modern Swift.

---

# Table of Contents

1. Grand Central Dispatch (GCD)
2. Tasks
3. async / await
4. async let (Parallel Execution)
5. Task Groups
6. Actors
7. Operation Queue
8. Sendable
9. Keeping the Program Alive

---

# 1. Grand Central Dispatch (GCD)

Grand Central Dispatch (GCD) is Apple's low-level API for executing work concurrently.

Use GCD when you simply want to execute work on another thread.

```swift
DispatchQueue.global().async {
    print("Downloading...")
}
```

### Main Queue

The main queue is responsible for UI updates.

```swift
DispatchQueue.main.async {
    print("Update UI")
}
```

### Global Queue

Runs background work.

```swift
DispatchQueue.global().async {
    print("Heavy computation")
}
```

---

# 2. Task

A `Task` creates a new asynchronous unit of work using Swift Concurrency.

```swift
Task {
    print("Running asynchronously")
}
```

Tasks are much easier to write than GCD because they work naturally with `async/await`.

Example:

```swift
Task {
    let count = await counter.placeOrder()
    print(count)
}
```

---

# 3. async / await

An `async` function can suspend while waiting for some work to complete.

Example:

```swift
func fetchWeather() async -> Int {
    try? await Task.sleep(for: .seconds(1))
    return 25
}
```

Calling it:

```swift
Task {
    let temperature = await fetchWeather()
    print(temperature)
}
```

Benefits:

- No callbacks
- Easy to read
- Structured concurrency
- Better error handling

---

# 4. Parallel Execution using async let

Suppose we need to fetch:

- Avatar
- Email

Instead of waiting for one after another:

```swift
let avatar = await getAvatar()
let email = await getEmail()
```

Run both together:

```swift
async let avatar = getAvatar()
async let email = getEmail()

let (a, e) = await (avatar, email)
```

This reduces the total execution time.

---

# 5. Task Groups

Task Groups execute multiple child tasks concurrently.

Example:

```swift
await withTaskGroup(of: Int.self) { group in

    for number in arr {
        group.addTask {
            return number * number
        }
    }

    var results = [Int]()

    for await result in group {
        results.append(result)
    }

    return results
}
```

### Advantages

- Dynamic number of tasks
- Structured concurrency
- Automatic waiting
- Safe cancellation

> Note:
>
> Task Groups do **not** guarantee the order of results.

---

# 6. Actors

Actors protect mutable state from data races.

Without actors:

```
Thread A
       \
        ---> count += 1 (wrong)
       /
Thread B
```

With actors:

```
Thread A
         \
          ---> Actor ---> count += 1
         /
Thread B
```

Example:

```swift
actor CoffeeCounter {

    private var coffeeCount = 0

    func placeOrder() -> Int {
        coffeeCount += 1
        return coffeeCount
    }
}
```

Usage:

```swift
let count = await counter.placeOrder()
```

Every access to actor-isolated data requires `await`.

Benefits:

- Thread-safe
- No locks
- Prevents data races
- Easier concurrency

---

# 7. Operation Queue

OperationQueue is a higher-level abstraction built on top of GCD.

Useful when tasks have dependencies.

Example:

```swift
let cook = BlockOperation {
    print("Cooking")
}

let serve = BlockOperation {
    print("Serving")
}

serve.addDependency(cook)

queue.addOperation(cook)
queue.addOperation(serve)
```

Execution:

```
Cook Food
      ↓
Serve Food
```

Unlike GCD, OperationQueue understands dependencies.

---

# 8. Sendable

A `Sendable` type can safely move across different tasks or threads.

Example (Struct):

```swift
struct UserProfile: Sendable {
    let name: String
    let age: Int
}
```

Since all properties are immutable (`let`), it is safe.

Example (Class):

```swift
final class ImmutableConfig: Sendable {
    let apiEndpoint = "https://api.example.com"
}
```

A class should usually be:

- immutable
- final
- thread-safe

to conform to `Sendable`.

---

# 9. Keeping the Program Alive

When using multiple Tasks in a command-line application, the program may finish before background work completes.

Example:

```swift
try? await Task.sleep(for: .seconds(100))
```

This keeps the main task alive for 100 seconds so background tasks can finish.

This is useful for learning and demos.

In production code, prefer awaiting the actual tasks instead of sleeping.

---



# Actor vs Class

| Class | Actor |
|--------|-------|
| Not thread-safe | Thread-safe |
| Needs locks | No locks |
| Can have data races | Prevents data races |
| Concurrent access unsafe | Serialized access |

---

# async let vs Task Group

## async let

Use when you know the exact number of tasks.

Example:

```swift
async let avatar = getAvatar()
async let email = getEmail()

let result = await (avatar, email)
```

---

## Task Group

Use when the number of tasks is dynamic.

Example:

```swift
for number in numbers {
    group.addTask {
        return number * number
    }
}
```

---

# Summary

| Concept | Purpose |
|----------|----------|
| DispatchQueue | Run background work |
| Task | Create asynchronous work |
| async/await | Suspend without blocking |
| async let | Run a fixed number of tasks in parallel |
| TaskGroup | Run many dynamic tasks concurrently |
| Actor | Protect shared mutable state |
| OperationQueue | Handle dependent tasks |
| Sendable | Safely share values between tasks |
| Task.sleep | Suspend a task without blocking a thread |

---

# Best Practices

Prefer `Task` over GCD for new Swift code.

Use `async/await` instead of completion handlers.

Use `async let` when the number of concurrent tasks is known.

Use `TaskGroup` when the number of tasks is dynamic.

Protect shared mutable state using `actor`.

Use `Sendable` for values shared across tasks.

Use `Task.sleep()` inside asynchronous code instead of `Thread.sleep()`.

Update UI only from the Main Actor.

---

# Swift Concurrency Workflow

```
Start

   │

   ▼

Task

   │

   ▼

async function

   │

   ▼

await

   │

   ▼

Need Parallel Work?

   │

   ├────────────► async let
   │
   │
   └────────────► Task Group

   │

   ▼

Need Shared Mutable State?

   │

   ▼

Actor

   │

   ▼

Need Safe Data Transfer?

   │

   ▼

Sendable

   │

   ▼

Done
```