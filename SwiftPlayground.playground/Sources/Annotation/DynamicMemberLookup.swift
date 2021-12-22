import UIKit

public class DynamicMemberLookupTest: Testable {
    override public func test() {
        super.test()
        
        let dictionary = PropertyDictionary(["a":1, "b":2])
        print(dictionary.a ?? "")
        print(dictionary.b ?? "")
        
        let label = UILabel()
            .builder
            .text("hello")
            .base
        print(label.text ?? "")
    }
}

// MARK: ex (1)

@dynamicMemberLookup
struct PropertyDictionary {
    private let properties: [String: Any]
    
    init(_ dictionary: [String: Any]) {
        properties = dictionary
    }

    subscript(dynamicMember string: String) -> Any? {
        return properties[string]
    }
}

// MARK: ex (2)

@dynamicMemberLookup
struct Builder<Base: AnyObject> {

    var base: Base

    init(_ base: Base) {
        self.base = base
    }

    subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<Base, Value>) -> (Value) -> Builder<Base> {
        { [base] value in
            base[keyPath: keyPath] = value
            return Builder(base)
        }
    }
}

protocol Buildable: AnyObject {}

extension Buildable {
    var builder: Builder<Self> {
        Builder(self)
    }
}

extension NSObject: Buildable {}
