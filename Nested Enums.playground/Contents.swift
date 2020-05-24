import UIKit


/*
    Nested Enums
    Problem: Just more than one
 */


//: Intro to Nested Enum
enum FutureCourse {
    enum LearnSwiftWithSamet: String {
        case genericProtocol
        case advancedEnum
        
        var chapterDescription: String {
            return self.rawValue
        }
    }
    
    enum UIKitFundamentals: String {
        case realmDatabase
        case noStoryboard
        case cloudcomputing
    
        var chapterDescription: String {
            return self.rawValue
        }
    }
}


FutureCourse.LearnSwiftWithSamet.genericProtocol.chapterDescription
FutureCourse.UIKitFundamentals.noStoryboard.chapterDescription

//: Game Design
struct Character {
    enum CharacterType {
        case prince
        case warrior
        case priest
    }
    
    enum Skill {
        case airwalk
        case transparency
        case prediction
    }
    
    let type: CharacterType
    let skill: Skill
}

let samet = Character(type: .warrior, skill: .airwalk)

//: Another Game Design
enum Wearable {
    enum Weight: Int {
        case light
        case medium
        case heavy
    }
    enum Price: Int {
        case leather
        case iron
        case steel
    }
    
    case armor(weight: Weight, price: Price)
    
    func getDescription() -> String {
        switch self {
        case let .armor(weight, price):
            return "You've chosen \(weight) and \(price)"
        }
    }
}

let myClothes = Wearable.armor(weight: .light, price: .steel)
print(myClothes.getDescription())
