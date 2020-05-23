import UIKit

/*
    Advanced Enum
    Static and Mutating Methods with self
    Problem: Let's make it practical
*/

//: Practical with Storyboard
enum Storyboard: String {
    case profile
    case setting
    case newsfeed
    
    var identifier: String {
        return self.rawValue
    }
}

let profile = Storyboard.profile
profile.identifier

//: API Guideline Goal
func describeStoryboard(storyboard: Storyboard) -> String {
    switch storyboard {
    case .profile:
        return "\(storyboard.identifier): Profile picture, follower"
    case .setting:
        return "\(storyboard.identifier): Logout, invite"
    case .newsfeed:
        return "\(storyboard.identifier): videos, texts"
    }
}

describeStoryboard(storyboard: .profile)

describeStoryboard(storyboard: .setting)

//: Mutating Methods
enum MealProcess: String {
    case breakfast
    case lunch
    case dinner

    var description: String {
        return self.rawValue
    }
    
    mutating func nextMeal() {
        print("Time to move on from \(self.description)")
        
        switch self {
        case .breakfast:
            self = .lunch
            print("I had a nice lunch")
        case .lunch:
            self = .dinner
            print("I had a nice dinner")
        case .dinner:
            self = .breakfast
            print("I had a nice breakfast")
        }
    }
}

var currentMeal = MealProcess.breakfast
currentMeal.nextMeal()
currentMeal.nextMeal()
currentMeal.nextMeal()

//: Static Method



 
//enum AppleDevices {
//    case iWatch
//    case iPhone
//    case iMac
//    case MacPro
//
//    static func getAppleDevice(name: String) -> AppleDevices? {
//        switch name {
//        case "iWatch":
//            return .iWatch
//        case "iPhone":
//            return .iPhone
//        case "iMac":
//            return .iMac
//        case "MacPro":
//            return .MacPro
//        default:
//            return nil
//        }
//    }
//}
//
//let userProduct = AppleDevices.getAppleDevice(name: "MacPro")


 enum AppleDevices: String  {
     case iWatch
     case iPhone
     case iMac
     case MacPro
     
     static func getProduct(name: String) -> AppleDevices? {
         return AppleDevices(rawValue: name)
     }
     
     static func getAppleDevice(enterName: String) -> AppleDevices? {
         switch enterName {
         case "iWatch", "iPhone", "iMac", "MacPro":
             return getProduct(name: enterName)
         default:
             return nil
         }
     }
 }

let product = AppleDevices.getAppleDevice(enterName: "MacPro")


//: Custom Init
enum AppleDevice: String {
    case iWatch, iPhone, iMac, MacPro
    
    init?(name: String) {
        if name == "iWatch" {
            self = .iWatch
        } else {
            return nil
        }
    }
}

AppleDevice(name: "iWatch")
AppleDevice(name: "MacPro")
AppleDevice(rawValue: "iWatch")

enum IntCategory {
    case small
    case medium
    case big
    case weird
    
    init(number: Int) {
        switch number {
        case 0..<1000:
            self = .small
        case 1000..<100000:
            self = .medium
        case 100000..<1000000:
            self = .big
        default:
            self = .weird
        }
    }
}

IntCategory(number: 1231231233453)

//: ### Practical Cae
enum HttpError: String {
    case Code400 = "Bad Request"
    case Code401 = "Unauthorized"
    case Code402 = "Payment Required"
    case Code403 = "Forbidden"
    case Code404 = "Page Not Found"
    
    var description: String {
        return self.rawValue
    }
}

HttpError.Code400.description

//: CellIdentifier
enum CellType: String {
    case ButtonValueCell
    case UnitEditCell
    case ResultLabelCell
    
    var name: String {
        return self.rawValue
    }
}

// UIKit
enum NavigationTheme {
    case Placid
    case Warning
    case Danger
    
    var barTintColor: UIColor {
        switch self {
        case .Placid:
            return .clear
        case .Warning:
            return .blue
        case .Danger:
            return .red
        }
    }
}
let colorSitutuaion = NavigationTheme.Placid
colorSitutuaion.barTintColor

extension NavigationTheme {
    init(numberOfTasks: Int) {
        switch numberOfTasks {
        case 0...3:
            self = .Placid
        case 4...9:
            self = .Warning
        default:
            self = .Danger
        }
    }
}

let currentColor = NavigationTheme(numberOfTasks: 5).barTintColor
