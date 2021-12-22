import Foundation

public class SingletonTest: Testable {
    override public func test() {
        super.test()
        Login().login()
        Profile().show()
    }
}

class UserData {
    static let shared: UserData = UserData()
    
    var id: String?
    var name: String?
}

class Login {
    func login() {
        UserData.shared.id = "user"
        UserData.shared.name = "유저"
    }
}

class Profile {
    func show() {
        print(UserData.shared.id ?? "")
        print(UserData.shared.name ?? "")
    }
}
