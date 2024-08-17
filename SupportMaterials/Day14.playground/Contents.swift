import Cocoa
//                OPTIONAL-THE VALUE THAT WILL COME FOR MISSING VALUES
//let opposites = [
//    "Mario": "Wario",
//    "Luigi": "Waluigi"
//]
//
//let peachOpposite = opposites["Peach"]
////print(peachOpposite) //nil
////What will peachOpposite be after that code runs?-nil
//
////              unwrapping optionals
//if let marioOpposite = opposites["Mario"] {//if value exist then unwrap it or create and else part for no value
//    print("Mario's opposite is \(marioOpposite)")
//}
//var username: String? = nil
//
//if let unwrappedName = username {
//    print("We got a user: \(unwrappedName)")
//} else {
//    print("The optional was empty.")
//}
//func square(number: Int) -> Int {
//    number * number
//}
//
//var number: Int? = nil
//if let unwrappedNumber = number {
//    print(square(number: unwrappedNumber))
//}

//how to unwrap optional with gaurd
//var myVar: Int? = 3

//if let unwrapped = myVar {
//    print("Run if myVar has a value inside")
//}

//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//}


//how to unwrap optional with nil coalescing-providing default for nil
//let captains = [
//    "Enterprise": "Picard",
//    "Voyager": "Janeway",
//    "Defiant": "Sisko"
//]

//let new = captains["Serenity"]//nil
//way 1 to fix
//let new = captains["Serenity"] ?? "N/A"
//print(new)
//alternative
//let new = captains["Serenity",default:"N/A"]
//print(new)


//more examples
//let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
//let favorite = tvShows.randomElement() ?? "None"
//print(favorite)
//
//struct Book {
//    let title: String
//    let author: String?
//}
//
//let book = Book(title: "Beowulf", author: nil)
//let author = book.author ?? "Anonymous"
//print(author)
//
//
//let input = ""
//let number = Int(input) ?? 0
//print(number)


//                      OPTIONAL CHAININIG
//let names = ["Arya", "Bran", "Robb", "Sansa"]
//
//let chosen = names.randomElement()?.uppercased() ?? "No one"//if the optional has a value inside, unwrap it then…
//print("Next in line: \(chosen)")
//
//struct Book {
//    let title: String
//    let author: String?
//}
//
//var book: Book? = nil
//let author = book?.author?.first?.uppercased() ?? "A"
//print(author)


//           HANDLING FUNCTION FAILURES USING OPTIONALS-USING TRY
//enum UserError: Error {
//    case badID, networkFailed
//}
//
//func getUser(id: Int) throws -> String {
//    throw UserError.networkFailed
//}
//
//if let user = try? getUser(id: 23) {
//    print("User: \(user)")
//}
//let user1 = (try? getUser(id: 23)) ?? "Anonymous"
//print(user1)

//                          CHECKPOINT 9
func mindBlown(_ input: [Int]?) -> Int { return input?.randomElement() ?? Int.random(in: 1...100) }
print(mindBlown(nil))       // This prints a random number.
print(mindBlown([0, 1,2,3,4,5,6]))    // This prints 0 or 1.

