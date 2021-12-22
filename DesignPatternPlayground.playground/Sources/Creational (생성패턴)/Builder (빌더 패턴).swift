import Foundation

public class BuilderTest: Testable {
    override public func test() {
        super.test()
        
        var builder = UserBuilder(id: "user")
        builder.address = "서울"
        builder.age = 10
        builder.name = "유저"
        print(builder.build().address ?? "")
        print(builder.build().name ?? "")
    }
}

struct User {
    var id: String
    var age: Int?
    var address: String?
    var name: String?
}

struct UserBuilder {
    private var user: User
    
    init(id: String) {
        self.user = User(id: id)
    }
    
    var age: Int? {
        didSet {
            self.user.age = age
        }
    }
    
    var address: String? {
        didSet {
            guard let address = address else {
                return
            }
            self.user.address = "주소: \(address)"
        }
    }
    
    var name: String? {
        didSet {
            guard let name = name else {
                return
            }
            self.user.name = "\(name) 입니다!"
        }
    }
    
    func build() -> User {
        return user
    }
}
