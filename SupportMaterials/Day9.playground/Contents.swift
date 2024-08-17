//import Cocoa
//
////func greetUser() {
////    print("Hi there!1")
////}
//
////greetUser()
//
////var greetCopy = greetUser
////var greetCopy: () -> Void = greetUser// ()-parameters ->returntype
////greetCopy()
//
////directly to a variable
////let sayHello = {
////    print("Hi there!")
////}
//
////sayHello()
//
////for parameters and return type use them inside the braces curly
////let sayHello = {(name:String)-> String in
//    //in is used to mark that after this the func code is started
////    "Hi there! \(name)"
////}
//
////print(sayHello("dhruv"))
//
////func getUserData(for id: Int) -> String {
////    if id == 1989 {
////        return "Taylor Swift"
////    } else {
////        return "Anonymous"
////    }
////}
////
////let data: (Int) -> String = getUserData
////let user = data(1989)
////print(user)
//
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//let sortedTeam = team.sorted()
////if i want suzanne captain comes first and then sort others
//print(sortedTeam)
//func captainFirstSorted(name1: String, name2: String) -> Bool {
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//}
////let captainFirstTeam = team.sorted(by: captainFirstSorted)
////print(captainFirstTeam)
//
////using closure
//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})
//print(captainFirstTeam)

//using trailing closures removing by, a,b, datatype,return type
//let captainFirstTeam = team.sorted {
//    if $0 == "Suzanne" {
//        return true
//    } else if $1 == "Suzanne" {
//        return false
//    }
//
//    return $0 < $1
//}
//print(captainFirstTeam)

//if same code done in reverse sort
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

//filtering with some condition-Use filter to loop over a collection and return an Array containing only those elements that match an include condition.
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

//Use map to loop over a collection and apply the same operation to each element in the collection.
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


//how to take a function as a parameter
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
//makeArray-func name
//arguement 1- int the size of array to make
//arguement 2- a func that generates a number
//()-the generator func won't take any arguements
// ->Int -the generator func has return type int
//[Int]-the makearray func has return type array of integers

//both of them doing same thing
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)//generator function made using closure
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)


//using multiple closures for multiple functions
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}
doImportantWork{
    print("First work done")
}second: {
    print("Second work done")
}third: {
    print("Third work done")
}


//checkpoint 5
var luckynumbers=[7,4,38,21,16,15,12,33,31,49]
//filter out the even number
let evennumbers=luckynumbers.filter{$0.isMultiple(of: 2)}
print(evennumbers)
//sort in ascending order
luckynumbers=luckynumbers.filter{!($0.isMultiple(of: 2))}.sorted()
//write each number with a letter is a lucky number in each line
var updated=luckynumbers.map{String($0)+" is a lucky number"}
for i in updated{
    print(i)
}
