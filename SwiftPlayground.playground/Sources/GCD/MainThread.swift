import Foundation

public class MainThreadTest: Testable {
    override public func test() {
        DispatchQueue.main.async {
            print("viewDidLoad")
            DispatchQueue.main.async {
                print("setupUI")
            }
        }
        
        DispatchQueue.main.async {
            print("layoutSubviews")
            DispatchQueue.main.async {
                print("resetUI")
            }
        }
    }
}
