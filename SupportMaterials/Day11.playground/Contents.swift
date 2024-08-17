import Cocoa

struct BankAccount{
    private(set) var funds=0
    mutating func deposit(amount:Int){
        funds+=amount
    }
    mutating func withdrawd(amount:Int)->Bool{
        if amount<funds{ funds-=amount
            return true
        }
        else{
            return false
        }
    }
}

var account=BankAccount()
account.deposit(amount: 200)
let success=account.withdrawd(amount: 1000)
if success{
    print("withdraw successful")}
else{print("Not enough funds")}

//account.funds-=1000//this should not be allowed to make it not allowed make it private

//Use private for “don’t let anything outside the struct use this.”
//Use fileprivate for “don’t let anything outside the current file use this.”
//Use public for “let anyone, anywhere use this.”
//private(set) is the best choice for funds: you can read the current bank account balance at any time, but you can’t change it without running through my logic.



//static and properties
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
//now no object needs to be created
School.add(student: "Taylor Swift")
print(School.studentCount)


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
print(AppData.version)

struct Employee {
    let username: String
    let password: String
//  let example = Employee(username: "cfederighi", password: "hairforceone")//error that struct name use inside struct so make it static
    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
print(Employee.example.password)


//checkpoint 6
struct Car{
    private(set) var model:String
    private(set) var seatNumber:Int
    var currentgear=1{ didSet{ print("Previous gear was \(oldValue)")}
        willSet{print("Gear changes to \(newValue)")}
    }
    mutating func changeGear(to gearnum:Int){
        if gearnum>=0 || gearnum<=10{
           currentgear=gearnum
        }
        else{
            print("Invalid gear")
        }
    }
    mutating func gearUp(by gearnum:Int){
        if gearnum+currentgear>=0 && gearnum+currentgear<=10{
        currentgear+=gearnum
     }
     else{
         print("Can't go this up")
     }
        
    }
    mutating func gearDown(by gearnum:Int){
        if (currentgear-gearnum)>=0 && (currentgear-gearnum)<=10{
        currentgear-=gearnum
     }
     else{
         print("Can't go this down")
     }
        
    }
}
var santro=Car(model: "xing25", seatNumber: 5 , currentgear: 1)
santro.gearUp(by: 1)
santro.changeGear(to: 10)
santro.gearUp(by: 1)
santro.gearDown(by: 10)
santro.gearDown(by: 1)
