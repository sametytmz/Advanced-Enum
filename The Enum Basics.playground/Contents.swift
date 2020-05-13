import UIKit

/*
    The Enum Basics
    ProblemŞ Let's Review
 */

/*
    1- Basic Enumerations
    2- Enumerations that have Raw Values
    3- Enumerations that have Associated Values
 */

//: ### Basic Enumarations
enum Compass {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
}

let earth = Planet.earth // init

switch earth {
case .earth:
    print("Mostly safe")
default:
    print("Not a safe place for me")
}

/*
    Raw Value
    Swift support the following types for the value of an enum
    - Integer
    - Float
    - String
    - Bool
 */

enum Food: String {
    case pizza
    case banana
    case chicken
    case bigMac
}

let stringValueFromPizza = Food.pizza.rawValue

//: Raw Value: Int
enum Days: Int {
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat
    case sun
}

Days.thu.rawValue

//: Initialization from Raw Value
let possibleeDay = Days(rawValue: 10)
print(possibleeDay)

if let someDay = Days(rawValue: 3) {
    switch someDay {
    case .sat, .sun:
        print("Weekends")
    default:
        print("Weekdays")
    }
}

/*
    ### Associated Value
    Example from the Swift Doc
*/

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var myQRCode = Barcode.qrCode("XYZ")
var upcCode = Barcode.upc(4, 2, 5, 5)

//: Validation
if case let Barcode.qrCode(value) = myQRCode {
    print("This is a qrCode")
    print(value)
}

if case let Barcode.upc(numberSystem, manufacturer, product, check) = upcCode {
    print("numberSystem:", numberSystem)
    print("manuFaturer:", manufacturer)
    print("product:", product)
    print("check", check)
}

let code = myQRCode

 
switch code {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}
