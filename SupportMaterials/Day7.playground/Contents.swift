import Cocoa
import Darwin

//func numtable(num: Int ,end: Int){
//    for i in 1...end{
//        print("\(num) x \(i) = \(num*i)")
//    }
//}
//numtable(num: 10, end: 12)

//               FUNCTION WHICH RETURNS SOMETHING
//func <name>->return type(parameters){code}
//func rolldice()->Int{
//    return Int.random(in: 1...6)
//}
//var roll=rolldice()
//print(roll)

//check if two strings have same letters
//func is_same(str1:String,str2:String)->Bool{
//    return str1.sorted()==str2.sorted()
//}
//print(is_same(str1: "dhruv", str2: "vurhd"))
//print(is_same(str1: "dhruv", str2: "vurha"))


//pythagoras theorem func
//func pythagoras(num1:Double,num2:Double)->Double{
//    return(sqrt(num1*num1 + num2*num2))
//}
//print(pythagoras(num1: 10, num2: 24))

//               FUNCTION WHICH RETURNS multiple values
//it will return a tuple
//func getuser(firstname:String,Lastname:String)->(firstname:String,Lastname:String){
//    return (firstname,Lastname)
//}
//func getuser(firstname:String,Lastname:String)->(String,String){
//    (firstname,Lastname)//no need to return
//}
//var user=getuser(firstname: "Dhruv", Lastname: "Bhardwaj")
//print("Name is: \(user.0) \(user.1)")

//for using a specific keyword
//either use _ before it or use another variable for inside the number
func printTimesTables(for number: Int) {
    for i in 1...10 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLd"
let result = isUppercase(string)
print(result)
