import Foundation

public class AdapterTest: Testable {
    override public func test() {
        super.test()
        
        print(FinCertLoginAdapter().login(id: "user", pw: "123"))
        print(LoginService().login(id: "user", pw: "123"))
    }
}

protocol LoginServiceProtocol {
    func login(id: String, pw: String) -> String
}

class LoginService: LoginServiceProtocol {
    func login(id: String, pw: String) -> String {
        print("login : \(id) \(pw)")
        return "SUCCESS"
    }
}

class FinCertLogin {
    var key: String
    
    init(key: String) {
        self.key = key
    }
    
    func login(id: String, pw: String) -> Int {
        print("FinCert : \(id) \(pw) \(key)")
        return 1
    }
}

// Adapter 안붙여도 될듯 (Service 가 구조상 더 맞는 네이밍일듯)
class FinCertLoginAdapter: LoginServiceProtocol {
    func login(id: String, pw: String) -> String {
        let result = FinCertLogin(key: "key").login(id: id, pw: pw)
        if result == 1 {
            return "SUCCESS"
        } else {
            return "FAIL"
        }
    }
}
