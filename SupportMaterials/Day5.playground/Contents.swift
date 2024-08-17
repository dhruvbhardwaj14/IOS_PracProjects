import Cocoa

//if and else conditions
let score=81
//if score>80 {
//    print("Great job!")
//}
//else{
//    print("Better luck Next time!")
//}

//multiple conditions
//let age=19
//if age<18 || score<80{print("first condition")}
//else if age>=18 && score>80{print("else if condition")}
//else{print("second")}

//switch cases
enum weather{
    case sun,rain,cloud
}
//let forecast=weather.sun
//switch forecast{
//case .sun:
//    print("Sunny")
//case .rain:
//print("rain")
//case .cloud:
//    print("cloud")
//}
//to print other cases down the matching case
//let name="shruti"
//switch name{
//case "dhruv":
//    print("hi \(name)")
//    fallthrough
//case "shruti":
//    print("hi baby")
//    fallthrough
//default:
//    print("who are you??")
//}


//ternary conditional operator
let age=18
let canVote = age >= 18 ? "YES":"NO"
print(canVote)
let hour=23
print(hour<12 ? "It's before noon": "It's Afternoon")
enum Theme{case light,dark}
let theme = Theme.dark
let background = theme == .dark ? "Dark" : "Light"
print(background)
