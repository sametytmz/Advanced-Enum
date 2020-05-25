import UIKit

/*
    Error Handling With Result Type
    Problem: Error Handling back then
 */

//: ### HTTPS Request

//: Design Error
enum HTTPError {
    case notFound404
    case forbidden403
}

//: Design Result Type
enum ResultType<T> {
    case success(T)
    case failure(HTTPError)
}

let success = ResultType.success("JSON, Image")
let failure: ResultType<Any> = ResultType.failure(.notFound404)

//: Design Function and Return Error Object

func findSubDomain(subdomain: String) -> ResultType<String> {
    switch subdomain {
    case "business":
        return ResultType.failure(.forbidden403)
    case "blog":
        return ResultType.failure(.notFound404)
    default:
        return ResultType.success("json file, html, mp3")
    }
}

// Execute Function (do-try)
let result = findSubDomain(subdomain: "business")
// Handle Error

switch result {
case let .success(data):
    print(data)
    // Map with object
case let .failure(errorType):
    switch errorType {
    case .notFound404:
        print("Not Found: 404")
    case .forbidden403:
        print("Not Allowed: 403")
    }
}
