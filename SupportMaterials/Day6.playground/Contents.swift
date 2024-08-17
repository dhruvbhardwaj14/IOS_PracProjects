//import Cocoa
//
//// for loop
////var platforms=["macOS","ios","tvOS","watchOS"]
////for os in platforms{
////    print("swift works great in \(os)")
////}
//var s=""
//for i in 1...5{//1 and 12 both included in the range
//    for _ in 1...i{//if loop variable not used then replace it bt "_"
//        s+="*"
//    }
//    s+="\n"
//}
//print(s)
//
//for i in 1...5{
//    print("count from 1 to 5 :\(i)")
//}
//for i in 1..<5{
//    print("count from 1 upto 5 :\(i)")
//}

//while loop
//var countdown=10
//while countdown>0{
//print("Current number \(countdown)")
//    countdown-=1
//}

//taking random numbers
//let id=Int.random(in: <#T##Range<Int>#>)
//let id=Int.random(in:1...100000)
//print(id)
//let decimal_id=Double.random(in: 0...1)
//print(decimal_id)
//print(Double(id)+decimal_id)

//var roll=0;
//while roll != 20{
//    roll=Int.random(in: 16...20)
//    print("I Rolled a roll \(roll)")
//}
//
////break and continue
////continue-skip the current iteration only
////break-skip the current iteration as well as all the iterations after it.
//let number1=4;
//let number2=14;
//var multiples=[Int]()
//var count=0;
//for i in 1...100_000{
//    if count==10 {
//        break;
//    }
////    if i%4==0 && i%14==0 {
////        multiples.append(i)
////        count+=1;
////    } alterantive
//    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
//        count+=1
//        multiples.append(i)
//    }
//}
//print(multiples)


//FIZZ BUZZ-checkpoint 3
for i in 1...100{
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FIZZBUZZ")
    }
    else if i.isMultiple(of: 3) {
        print("FIZZ")
    }
    else if i.isMultiple(of: 5){
        print("BUZZ")
    }
    
    else{
        print(i)
    }
}
