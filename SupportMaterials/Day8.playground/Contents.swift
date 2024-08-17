import Cocoa

//default values to a function
//func printTimesTables(for number: Int, end: Int = 12) {//default parameters
//    for i in 1...end {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//
//printTimesTables(for: 5, end: 20)
//printTimesTables(for: 8)

//errors in functions
//enum passwordError: Error{
//    case short,obvious
//}
//
//func checkPassword(_ password: String) throws -> String {
//    if password.count < 5 {
//        throw passwordError.short
//    }
//
//    if password == "12345" {
//        throw passwordError.obvious
//    }
//
//    if password.count < 8 {
//        return "OK"
//    } else if password.count < 10 {
//        return "Good"
//    } else {
//        return "Excellent"
//    }
//}

//main code to check error
//let string = "12345"
//
//do {
//    let result = try checkPassword(string)//checking error in do try must be there before the error throwing functions
//    print("Password rating: \(result)")
//
//}//catch passwordError.short {//for short passwords
////    print("Please use a longer password.")
////} catch passwordError.obvious {
////    print("I have the same combination on my luggage!")
////}
//catch {
//    print("There was an error \(error.localizedDescription).")//for generating a generic error message
//}

//checkpoint 4
enum SquareRoot: Error{
    case outOfBounds,noRoot
}
func sqaureRoot(of number:Int) throws -> Int{
    if number<1 || number>10000 {
        throw SquareRoot.outOfBounds
    }
    else{
        for i in 1...number {
            if i*i==number{
                return i;
            }
        }
    }
    throw SquareRoot.noRoot
}
do{
    let root=try sqaureRoot(of: 100)
    print("Sqaure Root of the number is :\(root)")
}catch SquareRoot.noRoot{print("No Integer Root exists for number")}
catch SquareRoot.outOfBounds{print("Number is out of bounds")}
