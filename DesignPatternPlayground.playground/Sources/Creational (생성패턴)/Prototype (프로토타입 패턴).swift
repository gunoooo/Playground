import Foundation

public class PrototypeTest: Testable {
    override public func test() {
        super.test()
        
        let member1 = Member(id: "user", money: 0)
        var member2 = member1.clone()
        member2.money += 10
        print("User1 \(member1.id) : \(member1.money)")
        print("User2 \(member2.id) : \(member2.money)")
    }
}

protocol Prototype {
    func clone() -> Self
}

struct Member: Prototype {
    var id: String
    var money: Int
    
    func clone() -> Member {
        return Member(id: self.id, money: self.money)
    }
}
