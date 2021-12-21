import Foundation

public class FactoryMethod: Testable {
    public init() {}
    
    public func test() {
        print("---팩토리 메서드 패턴 test---")
        let factory = NetworkErrorFactory()
        print(factory.make(with: "403")?.errorMessage ?? "")
        print(factory.make(with: "404")?.errorMessage ?? "")
    }
}

class NetworkErrorFactory {
    func make(with errorCode: String) -> NetworkError? {
        switch errorCode {
            case "403":
                return ForbiddenError()
            case "404":
                return NotFoundError()
            default:
                return nil
        }
    }
}

protocol NetworkError {
    var errorMessage: String { get }
}

struct NotFoundError: NetworkError {
    var errorMessage: String = "URL을 찾을수 없습니다"
}

struct ForbiddenError: NetworkError {
    var errorMessage: String = "접근 권한이 없습니다"
}
