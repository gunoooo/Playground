import Foundation

public class Subscript: Testable {
    public init() {}
    
    public func test() {
        print("---Subscript test---")
        
        var list: List<String> = .init()
        list.add("hello")
        print(list[0])
        
        print(Add[1, 3])
    }
}

struct List<T> {
    private var items: [T]
    
    init(items: [T] = []) {
        self.items = items
    }
    
    mutating func add(_ item: T) {
        items.append(item)
    }
    
    subscript(index: Int) -> T {
        get {
            return items[index]
        }
        set {
            items[index] = newValue
        }
    }
}

struct Add {
    static subscript(first: Int, second: Int) -> Int {
        get {
            return first + second
        }
    }
}
