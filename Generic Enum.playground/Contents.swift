import UIKit

/*
    Generic Enum
    Problem: A little more complex assciated value
 */


//: Introducing Generic Enum
enum Information<T, U> {
    case name(T)
    case website(T)
    case age(U)
}

// Information.name("Samet")
// T is "String", but U?

Information<String, Int>.age(20)

Information<String, Any>.website("Oracle")

//: Optionals with Enum
let quickOptionals: String? = "Samet"
let explicitOptionals = Optional("Samet")

print(explicitOptionals!)

let string = "123123"
let newString = String("123123")


//: Custom Optionals
enum MyOptional<T> {
    case none // nil
    case some(T)
    
    init(_ anyValue: T) {
        self = .some(anyValue)
    }
}

//if let value = MyOptional("Samet") {
//    print(value)
//}

MyOptional("Samet")
