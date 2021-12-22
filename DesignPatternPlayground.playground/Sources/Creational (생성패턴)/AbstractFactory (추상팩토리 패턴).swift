import UIKit

public class AbstractFactoryTest: Testable {
    override public func test() {
        super.test()
        print(BankingViewConstantFactory().header.title)
        print(MoneyViewConstantFactory().header.title)
    }
}

// MARK: Header

protocol Header {
    var title: String { get }
    var icons: [UIImage?] { get }
}

class BankingHeader: Header {
    var title: String {
        return "뱅킹"
    }
    
    var icons: [UIImage?] {
        return [
            UIImage(named: "wallet"),
            UIImage(named: "my")
        ]
    }
}

class MoneyHeader: Header {
    var title: String {
        return "머니버스"
    }
    
    var icons: [UIImage?] {
        return [
            UIImage(named: "calendar"),
            UIImage(named: "wallet"),
            UIImage(named: "my")
        ]
    }
}

// MARK: GoalExtension

protocol GoalExtension {
    var lists: [GoalExtensionItem] { get }
    var themeColor: UIColor { get }
}

struct GoalExtensionItem {
    var icon: UIImage?
    var title: String
    var subTitle: String
}

class BankingGoalExtension: GoalExtension {
    var lists: [GoalExtensionItem] {
        return [
            GoalExtensionItem(
                icon: UIImage(named: "upcycle"),
                title: "친환경 실천하고 업사이클링 가방받기",
                subTitle: "미션 참여하기"
            )
        ]
    }
    
    var themeColor: UIColor {
        return .blue
    }
}

class MoneyGoalExtension: GoalExtension {
    var lists: [GoalExtensionItem] {
        return [
            GoalExtensionItem(
                icon: UIImage(named: "upcycle"),
                title: "친환경 실천하고 업사이클링 가방받기",
                subTitle: "미션 참여하기"
            )
        ]
    }
    
    var themeColor: UIColor {
        return .green
    }
}

// MARK: Factory

protocol HomeViewConstantFactory {
    var header: Header { get }
    var goalExtension: GoalExtension { get }
}

class BankingViewConstantFactory: HomeViewConstantFactory {
    var header: Header {
        return BankingHeader()
    }
    
    var goalExtension: GoalExtension {
        return BankingGoalExtension()
    }
}

class MoneyViewConstantFactory: HomeViewConstantFactory {
    var header: Header {
        return MoneyHeader()
    }
    
    var goalExtension: GoalExtension {
        return MoneyGoalExtension()
    }
}
