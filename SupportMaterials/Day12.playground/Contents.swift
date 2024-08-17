import Cocoa

//                      CLASSES IN SWIFT

//class Game {
//    var score = 0 {
//        didSet {
//            print("Score is now \(score)")
//        }
//    }
//}
//
//var newGame = Game()
//newGame.score += 10
//both are same for now but we will see differences soon!
//                      INHERITANCE
//inheritance- to inherit classes we will use the parent class name after ':' after the current class name

//class Employee{
//    let hours:Int
//    init(hours:Int){
//        self.hours=hours
//    }
//    func printSummary() {
//        print("I work \(hours) hours a day.")
//    }//inheriting a method
//}
//class Developer: Employee{
//    func work(){
//        print("I have been coding for \(hours) hours")
//    }
//    //over riding a method
//    override func printSummary() {
//        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
//    }
//}
//final class Manager: Employee{
//    func work(){
//        print("I have a meeting after \(hours) hours")
//    }
//}
//var john=Developer(hours: 8)
//var dhruv=Manager(hours: 10)
//john.work()
//dhruv.work()
//let novall=Developer(hours: 8)
//novall.printSummary()//inherited normally

//If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.- that means manager won't be inherited again now


//                      HOW TO ADD INITIALIZERS
//class Vehicle {
//    let isElectric: Bool
//
//    init(isElectric: Bool) {
//        self.isElectric = isElectric
//    }
//}
//now if i inherit a class and make init in it then i will have to call supers init as well
//class Car: Vehicle {
//    let isConvertible: Bool
//
//    init(isElectric: Bool, isConvertible: Bool) {
//        self.isConvertible = isConvertible//error if below not here
//        super.init(isElectric: isElectric)
//    }
//}

//class Car: Vehicle {
//    let isConvertible=false
//}

//if child class have default values and doesn't require any initializers then it does not need to have super in it

//let tesla=Car(isElectric: true)


//                      HOW TO COPY CLASSES
//class User {
//    var username = "Anonymous"
//    func copy() -> User {
//            let user = User()
//            user.username = username
//            return user
//        }
//}
//var user1 = User()
//var user2=user1
//user2.username = "Taylor"//will also change username of user2
//print(user1.username)
//print(user2.username)
//so we will create a func called copy
//var user3=user1.copy()
//user3.username="steve"
//print(user3.username)


//                   HOW TO CREATE DEINITIALIZERS
//Just like initializers, you don’t use func with deinitializers – they are special.
//Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//We never call deinitializers directly; they are handled automatically by the system.
//Structs don’t have deinitializers, because you can’t copy them.
//
//class Username {
//    let id: Int
//
//    init(id: Int) {
//        self.id = id
//        print("User \(id): I'm alive!")
//    }
//
//    deinit {//no paranthesis
//        print("User \(id): I'm dead!")
//    }
//}
//var users=[Username]()
//for i in 1...3 {
//    let user = Username(id: i)
//    print("User \(user.id): I'm in control!")
//    users.append(user)
//}
//NOTE- if they are stored in  array then they won't be destroyed unless we clear the array
//print("Loop over!")
//users.removeAll()
//print("Array is clear!")

//          HOW TO WORK WITH VARIABLES IN CLASSES
 /*even if we take let as a variable name still we can assign value to it since it is pointing constantly to the class member and the value of member is changing not the variable*/

//class UserName{
//    var name="Paul"
//}
//var user=UserName()
//user.name="taylor"
//print(user.name)
//user=UserName()//can't do if user is let
//print(user.name)

//                      CHECKPOINT 7
class Animals{
    var legs=0;
    init(legs:Int){
        self.legs=legs
    }
}
class Dog:Animals{
    func speak(){
        print("Dog Barkkkkkkkkkkkkkkkk!")
    }
}
class Poodle:Dog{
    override func speak() {
        print("Poodle Dog Barkkkkkkkkkkkkkkkk!")
    }
    override init(legs: Int) {
        print("I am a poodle and I have \(legs) legs")
        super.init(legs: legs)
    }
}
class Corgi:Dog{
    override func speak() {
        print("Corgi Dog Barkkkkkkkkkkkkkkkk!")
    }
    override init(legs: Int) {
        print("I am a Corgi and I have \(legs) legs")
        super.init(legs: legs)
    }
}
class Cat:Animals{
    var istame:Bool
    func speak(){
        print("Cat Meowwwwwwwwwwwwwwwww!")
    }
    init(legs: Int,istame:Bool) {
        self.istame=istame
        super.init(legs: legs)
    }
}
class Persian:Cat{
    override func speak() {
        print("Persian cat Meowwwwwwwwwwwwwwwww!")
    }
    override init(legs: Int,istame:Bool) {
        print("I am a Persian cat and I have \(legs) legs,Am i wild?: \(istame)")
        super.init(legs: legs,istame: istame)
    }
}

class Lion:Cat{
    override func speak() {
        print("Lion Big Meowwwwwwwwwwwwwwwww!")
    }
    override init(legs: Int,istame:Bool) {
        print("I am a Lion and I have \(legs) legs, Am i wild?: \(istame)")
        super.init(legs: legs,istame: istame)
    }
}
var dog=Dog(legs: 4)
var cat=Cat(legs: 4, istame: false)
var corgi=Corgi(legs: 4)
var poodle=Poodle(legs: 4)
var persian=Persian(legs: 4, istame: false)
var lion=Lion(legs: 4, istame: true)
dog.speak()
cat.speak()
corgi.speak()
poodle.speak()
persian.speak()
lion.speak()
