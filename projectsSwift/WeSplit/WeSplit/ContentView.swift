//
//  ContentView.swift
//  WeSplit
//
//  Created by Dhruv Bhardwaj on 15/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0//amount of bill
    @State private var numberOfPeople = 2//no. of people
    @State private var tipPercentage = 20//tip
//    let tipPercentages=[10,15,20,25,0]
    
    //total per person
    var totalPerPerson:Double{
        //calculate total Per Person here
        let peopleCount=Double(numberOfPeople+2)
        let tipSelection=Double(tipPercentage)
        let tipValue=(checkAmount/100)*tipSelection
        let grandTotal=checkAmount+tipValue
        let valuePerPerson=grandTotal/peopleCount
        return valuePerPerson
    }
    
    //total amount
    var totalAmount:Double{
        return totalPerPerson*(Double(numberOfPeople+2))
    }
    
    //hiding the keyboard
    @FocusState private var amountIsFocuesed:Bool
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("Amount",value: $checkAmount,format: .currency(code: Locale.current.currencyCode ?? "INR"))//for having a sign at beginning of currency and default is INR
                        .keyboardType(.decimalPad)//to use a onscreen decimal keyboard
                    //hiding the keyboard
                        .focused($amountIsFocuesed)
                    Picker("Number of People",selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
//    Naive approach-Text("How much tip you want to leave?")
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)//segmented picker
                }/*adding closure*/header: {
                    Text("How much tip you want to leave?")//looks better now
                }
                Section{
//                    Text(checkAmount,format: .currency(code: Locale.current.currencyCode ?? "INR"))
                    Text("Amount Per Person")
                    Text(totalPerPerson,format: .currency(code: Locale.current.currencyCode ?? "INR"))
                        
                    
            }
                Section{
                    Text("Total Amount")
                    Text(totalAmount,format: .currency(code: Locale.current.currencyCode ?? "INR"))
                        .foregroundColor(tipPercentage==0 ? .red : .black)//conditional modifiers
                        
                    
            }
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.large)
                
                //adding a done button to the keyboard
                .toolbar{//navigation,small toolbaar at bottom and etc.
                    ToolbarItemGroup(placement: .keyboard){//buttons for toolbar
                        Spacer()
                        Button("Done"){
                            amountIsFocuesed=false;
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
