//import Cocoa
//struct Album{//a must be capitalise(A)
//    let title:String
//    let artist:String
//    let year:Int
//
//    func printsummary(){ print("SONG:-\(title) \(year) by \(artist)")}
//}
//let red=Album(title: "Red", artist: "Taylor Swift", year: 2016)
//let wings=Album(title: "Wings", artist: "BTS", year: 2016)
//red.printsummary()
//wings.printsummary()
//NOTE- WE CAN ONLY GIVE DEFAULT VALUES TO VAR PARTS OF STRUCT
//struct Employee {//e must be capitalised(E)
//    let name: String
//    var vacationRemaining=14
//
////    func takeVacation(days: Int) {
////        if vacationRemaining > days {
////            vacationRemaining -= days//func can't change value of vacationRemaining to do it specially use word mutating
////            print("I'm going on vacation!")
////            print("Days remaining: \(vacationRemaining)")
////        } else {
////            print("Oops! There aren't enough days remaining.")
////        }
////    }
//   mutating func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days//func can't change value of vacationRemaining to do it specially use word mutating
//            print("I'm going on vacation!")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There aren't enough days remaining.")
//        }
//    }
//}
//var dhruv=Employee(name: "Dhruv", vacationRemaining: 5)// we can't make dhruv as var since struct has a mutating func
//dhruv.takeVacation(days: 6)
//print(dhruv.vacationRemaining)


//using dynamic values properties
//struct Employee {
//    let name: String
//    var vacationAllocated = 14
//    var vacationTaken = 0
//
//    var vacationRemaining: Int {
//        vacationAllocated - vacationTaken//dynamically calculated everytime
//    }
//}
//
//var archer=Employee(name: "Dhruv", vacationAllocated: 14)
//archer.vacationTaken+=4
//print(archer.vacationRemaining)
//archer.vacationTaken+=4
//print(archer.vacationRemaining)


//using get and set for dynamically changing some values
//struct Employee {
//    let name: String
//    var vacationAllocated = 14
//    var vacationTaken = 0
//
//    var vacationRemaining: Int {
//        get{
//        vacationAllocated - vacationTaken//dynamically calculated everytime
//    }
//        set{
//            vacationAllocated=vacationTaken + newValue//automatically gives the value we give as new value
//        }
//    }
//}
//
//var archer=Employee(name: "Dhruv", vacationAllocated: 14)
//archer.vacationTaken+=4
//archer.vacationRemaining=5//new value
//print(archer.vacationAllocated)

//taking action when a property changes
//struct Game{
//    var score=0
//}
//var game=Game()
//game.score += 10
//print("Score is now \(game.score)")
//game.score -= 3
//print("Score is now \(game.score)")
//game.score += 1
//print("Score is now \(game.score)")
 
//to change it we use didset inside the code-which attachs a command once a change is made
//struct Game{
//    var score=0{
//        didSet{//after update-has a predefined keyword as oldvalue
//            print("Now the score is \(score)")
//        }
//    }
//}
//var game=Game()
//game.score += 10
//game.score -= 3
//game.score += 1


//using will set and did set
//struct App{
//    var contact=[String](){
//        willSet{
//            print("Current value: \(contact)")
//            print("New value: \(newValue)")
//        }
//        didSet{
//            print("There are now \(contact.count) contacts.")
//                        print("Old value was \(oldValue)")
//        }
//    }
//
//}
//var app = App()
//app.contact.append("Adrian E")
//app.contact.append("Allen W")
//app.contact.append("Ish S")


//using custom initializers

//Normal declaration
//struct Player {
//    let name: String
//    let number: Int
//}
//
//let player = Player(name: "Megan R", number: 15)

//using init. It has the followinf properties
//1.There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
//2.Even though this creates a new Player instance, initializers never explicitly have a return type – they always return the type of data they belong to.
//3.I’ve used self to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.

struct Player {
    var name: String 
    let number: Int

//    init(name: String, number: Int) {
//        self.name = name
//        self.number = number
//    }
    //here we can generate number randomly for each player as well
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
    
}
let player=Player(name: "Dhruv")
let player1=Player(name: "Mayank")
let player2=Player(name: "Rishabh")
print("\(player.name) has number \(player.number)")
print("\(player1.name) has number \(player1.number)")
print("\(player2.name) has number \(player2.number)")
