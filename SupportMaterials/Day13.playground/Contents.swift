import Cocoa
//                CREATE AND USE  OF PROTOCOLS-contracts to which any confirming types and methods must adhere

protocol Vehicle {//new type-require capital letter and camelCase
    var name: String { get }//read only
    var currentPassengers: Int { get set }//read and write both
    func estimateTime(for distance: Int) -> Int//no function body must be there
    func travel(distance: Int)
}
struct Car: Vehicle {//same as subclass but in a struct
    //all methods in protocol must be in struct
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance:Int,using vehicle:Vehicle){//if Car is replaced by Vehicle then also it will run the same even for all the vehicle protocol confirming structs
    if vehicle.estimateTime(for:distance)>100{
        print("I will take another vehicle")
    }
    else{
        vehicle.travel(distance: distance)
    }
}
let car=Car()
commute(distance: 100, using: car)
struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
getTravelEstimates(using: [car,bike], distance: 150)


//                      OPAQUE RETURN TYPES

func getRandomNumber() -> some Equatable {//hidden return type which changes acc to situation
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {//hidden return type which changes acc to situation
    Bool.random()
}
if(getRandomNumber()==getRandomNumber()){
    print(getRandomNumber())
}

//                      HOW TO USE EXTENSIONS
var quote = "   The truth is rarely pure and never simple   "
//let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)//used for trimming the whitespaces and new lines
//since this code takes too much effort to write again and again we will type an extension for that
extension String{
    func trimmed()->String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim(){
        self=self.trimmed()//converting string itself
    }
    
    var lines: [String] {//no braces if not want any braces
        self.components(separatedBy: .newlines)//breaking string itself
    }
}
//let trimmed=quote.trimmed()
//print(trimmed)
print(quote)
quote.trim()
print(quote)
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.lines)
print(lyrics.lines.count)

//WE CAN ALSO CREATE CUSTOM INITIALIZER IN A STRUCT WHICH EARLIER USED TO REMOVE THE PREINITIALIZER IN A STRUCT BY USING EXTENSION
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let potr=Book(title: "Harry Potter", pageCount: 200)
print(potr)


//              USING PROTOCOLS AND EXTENSIONS-whatif we can extend protocols even

//extension Array {
//    var isNotEmpty: Bool {
//        isEmpty == false
//    }
//}
//if we want to do same for sets dictionaries and arrays as well then we can directly extend the Collection protocol which is protocol of Array dictionary and sets
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Mario", "Luigi", "Peach"]

if /*guests.isEmpty == false*/ /*or*/!guests.isEmpty {
    print("Guest count: \(guests.count)")
}

//another example
protocol Person {
    var name: String { get }
    func sayHello()
}
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
struct Employee: Person {
    let name: String
}
let dhruv=Employee(name: "Dhruv")
dhruv.sayHello()


//                      more on protocol extension
//extension Int {
//    func squared() -> Int {
//        self * self
//    }
//}
//
//let wholeNumber = 5
//print(wholeNumber.squared())

//to do same for int and double
extension Numeric {
    func squared() -> Self {//Self used as Int and Double both can come as output
        self * self
    }
}
//var wholeNumber = 5
//print(wholeNumber.squared())
//let wholeNumber1 = 5.2
//print(wholeNumber1.squared())

//
//struct User: Equatable {
//    let name: String
//}
//let user1 = User(name: "Link")
//let user2 = User(name: "Link")
//print(user1 == user2)
//print(user1 != user2)

struct User: /*may or may not use Equatable,*/ Comparable {//we can use <= as '<'-comparable ==->equatable
    let name: String
   static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1<user2)

//                              checkpoint 8
protocol Building{
    var rooms:Int{get set}
    var cost:Int{get set}
    var agent:String{get}
    func salessummary(for rooms:Int,cost:Int,agent:String)
}
struct House:Building{
    var rooms=5
    
    var cost=500_000
    
    var agent="Stephen"
    
    func salessummary(for rooms: Int, cost: Int, agent: String) {
        print("House of \(rooms) rooms costing Rs.\(cost) is sold by \(agent)")
    }
}
struct Office:Building{
    var rooms=50
    
    var cost=500_000_00
    
    var agent="Stephen Johnes"
    
    func salessummary(for rooms: Int, cost: Int, agent: String) {
        print("Office of \(rooms) rooms costing Rs.\(cost) is sold by \(agent)")
    }
}
let hostel=House()
hostel.salessummary(for: 5, cost: 500, agent: "DHRUV")
let official=Office()
official.salessummary(for: 50, cost: 500_000_00, agent: "VEDIKA")
