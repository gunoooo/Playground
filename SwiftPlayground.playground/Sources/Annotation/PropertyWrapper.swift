import Foundation

public class PropertyWrapperTest: Testable {
    override public func test() {
        super.test()
        
        let number = Number(number1: 3)
        print(number.number1)
        print(number.number2)
    }
}

struct Number {
    @Square var number1: Int
    @Square(wrappedValue: 5) var number2: Int
}

@propertyWrapper
struct Square {
    private(set) var value: Int = 0
    
    var wrappedValue: Int {
        get {
            value
        }
        set {
            value = newValue * newValue
        }
    }
    
    init(wrappedValue initialValue: Int) {
        self.wrappedValue = initialValue
    }
}
