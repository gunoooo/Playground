import Foundation

public class KeyPathTest: Testable {
    override public func test() {
        super.test()
        
        print(type(of: \User.id)) // KeyPath
        print(type(of: \User.name)) // WritableKeyPath
        print(type(of: \Address.town)) // ReferenceWritableKeyPath
        
        let user = User(id: "user", name: "유저", address: Address(town: "집"))
        
        print(user.name)
        print(user[keyPath: \User.name])
        
        print(user.address.town)
        print(user[keyPath: \User.address][keyPath: \Address.town])
        print(user[keyPath: \User.address.town])
    }
}

struct User {
    let id: String
    var name: String
    var address: Address
}

class Address {
    var town: String
    
    init(town: String) {
        self.town = town
    }
}
