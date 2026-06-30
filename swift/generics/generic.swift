// Generic

func swapValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 5
var y = 10
swapValues(a: &x, b: &y)
print("x: \(x), y: \(y)")

// The compiler guarantees that 'first' and 'second' must match in type, whatever it ends up being.
func pairUp<T>(first: T, second: T) -> [T] {
    return [first, second]
}

// The compiler safely maps 'T' dynamically based on arguments at compile time:
let stringPair = pairUp(first: "Apple", second: "Banana") // T is inferred as String
let numberPair = pairUp(first: 7, second: 11)             // T is inferred as Int

// We can name the placeholder descriptively (like 'Value') instead of just 'T'
struct StorageBox<Value> {
    var contents: Value
    
    // Mutating methods inside generic structures follow the placeholder rules automatically
    mutating func updateContents(to newValue: Value) {
        self.contents = newValue
    }
}

// Specializing instances with concrete types
var toyBox = StorageBox<String>(contents: "Teddy Bear")
var pointBox = StorageBox<Int>(contents: 42)

//  <T: Equatable> constraints T to types that Swift already knows how to compare.
func findMatchingIndex<T: Equatable>(itemToFind: T, inside list: [T]) -> Int? {
    for (index, item) in list.enumerated() {
        if item == itemToFind { // Allowed because T is explicitly Equatable!
            return index
        }
    }
    return nil
}

// associatedtype creates an abstract placeholder for protocols
protocol ItemContainer {
    associatedtype HoldableItem // The protocol doesn't care what this is yet
    
    var items: [HoldableItem] { get set }
    mutating func appendItem(_ newInternalItem: HoldableItem)
}

// When a struct conforms to it, Swift implicitly figures out what the associatedtype is
struct SecureVault: ItemContainer {
    // Swift figures out that 'HoldableItem' is 'String' because of this array definition
    var items: [String] = [] 
    
    mutating func appendItem(_ newInternalItem: String) {
        items.append(newInternalItem)
    }
}

// 'where' checks deep nested properties of complex generic structures
func compareContainers<C1: ItemContainer, C2: ItemContainer>(containerA: C1, containerB: C2) -> Bool 
    where C1.HoldableItem == C2.HoldableItem, C1.HoldableItem: Equatable {
    
    // This function guarantees that both containers hold the EXACT same type of data,
    // and that data is safe to compare using '=='
    return containerA.items.count == containerB.items.count
}