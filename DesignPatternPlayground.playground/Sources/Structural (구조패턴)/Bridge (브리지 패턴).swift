import Foundation

// MARK: Before

protocol _Response {
    var code: String { get }
}

struct _LoginResponse: _Response {
    var code: String
    
    init(code: String) {
        self.code = code
    }
}

struct _LoginErrorResponse: _Response {
    var code: String
    var message: String
    
    init(code: String) {
        self.code = code
        self.message = "로그인 오류 [\(code)]"
    }
}

// MARK: After

protocol Response {
    var code: String { get }
}

protocol Error {
    var response: Response { get set }
    var message: String { get }
}

struct LoginResponse: Response {
    var code: String
    
    init(code: String) {
        self.code = code
    }
}

struct LoginError: Error {
    var response: Response
    var message: String
    
    init(response: Response) {
        self.response = response
        self.message = "로그인 오류 [\(response.code)]"
    }
}
