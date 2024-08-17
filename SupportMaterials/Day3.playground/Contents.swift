//import Cocoa
//
////var beatles=["Adrian","Dhruv","HEllo"]//array it is and have only one datatype any
////beatles.append("Enrique")
////print(beatles)
//
////defining an Array
////var scores=Array<Int>()//use this syntax
////scores.append(10)
////scores.append(100)
////scores.append(101)
////scores.append(120)
////scores.append(103)
////print(scores)
//
////another way
//var names=[String]()
//names.append("ROhan")
//names.append("Sohan")
//names.append("Wuhan")
//names.append("Dhruv")
//print(names)
////size of an array-count
////print(names.count)
////print(scores.count)
////print(beatles.count)
////removing a single element-.remove
////names.remove(at: 1)//1 is index
////print(names)
////names.removeAll()
////print(names)
//
////to check if an array contains something or not
//print(names.contains("Dhruv"))
//print(names.contains("Wuhan"))
////sorting an array
//names=names.sorted()
//print(names)


//                                DICTIONARIES
//let employee=["name":"DHRUV","age":"12","gender":"male"]
////print(employee["name"])//output-Optional("DHRUV") to remove it set a default value which is value printed if no such key exists
//print(employee["name",default: "unknown"])

//another way of defining it is
//var height=[String:Int]()
//height["Dhruv"]=180
//height["Shruti"]=160
//height["Devuu"]=160
//print(height)

//                      SETS-order is not same as array
//not storing duplicates
//var name=Set(["Dhruv","Devuu","Rishabh","Dhruv"])
//print(name)//output-["Devuu", "Rishabh", "Dhruv"]-not in order
//name.insert("Shruti")
//name.insert("Sanchit")
//name.insert("Vanshii")
//name.insert("Dhruv")
//print(name)//no dhruv is twice but only once
//print(name.contains("DHruv"))
//print(name.contains("Dhruv"))
//print(name.count)//6-no. of elements in set
//print(name.sorted())//sorted array

//ENUMS-define a particular set having a set of all values predefined

enum weekday{
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//    case saturday
//    case sunday
    
//    or
    case monday,tuesday,wednesday,thursday,friday,saturday,sunday
}
var day1=weekday.sunday//fixed datatype
var day2=weekday.sunday
day2=weekday.friday
//or
day2 = .monday
print(day2)
