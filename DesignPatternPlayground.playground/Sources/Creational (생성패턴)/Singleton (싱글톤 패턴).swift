import Foundation

public class Singleton: Testable {
    public init() {}
    
    public func test() {
        print("---싱글톤 패턴 test---")
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
