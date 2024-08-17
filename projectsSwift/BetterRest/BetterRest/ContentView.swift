//
//  ContentView.swift
//  BetterRest
//
//  Created by Dhruv Bhardwaj on 22/06/22.
//
import CoreML//importing the machine learning
import SwiftUI
struct drawText:ViewModifier{
    let font=Font.system(size:22,weight: .heavy,design: .default)
    func body(content: Content) -> some View {
        content
            .font(font)
    }
}
struct DrawhorizontalText:View{
    var textResult:String
    
    var body:some View{
            Text(textResult)
                .modifier(drawText())
                .foregroundColor(.black)
    }
}
struct ContentView: View {
        @State private var wakeUp = defaultWakeTime
    //changing to default waketime of 7 a.m.
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
        @State private var sleepAmount = 8.0
        @State private var coffeeAmount = 1
    @State private var rangeOfCoffee=1..<21
    @State private var titleAlert = ""
    @State private var messageAlert = ""
    @State private var showingAlert = false
    static var defaultBedTime: Date {
            var components = DateComponents()
            components.hour = 19
            components.minute = 0
            return Calendar.current.date(from: components) ?? Date.now
        }
    var recommendedBedTime: String{
        calculateBedTime()
    }
        var body: some View {
            NavigationView {
//            VStack{// we use Form for better view than in Vstack
            Form{
                    VStack(alignment: .leading, spacing: 0) {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        DatePicker("Please enter a time",selection: $wakeUp,displayedComponents: .hourAndMinute)
                            .foregroundColor(.blue)
                            .labelsHidden()
                            
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Desired Amount of Sleep")
                            .font(.headline)
                        Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in: 4...12,step: 0.25)
                            .foregroundColor(sleepAmount<=9 ? .blue : .red)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Daily Coffee Intake")
                            .font(.headline)
    //                    Stepper(coffeeAmount==1 ? "1 cup" : "\(coffeeAmount) cups",value:$coffeeAmount,in:1...20,step:1)
                            //replacing with a picker
                        Picker("Cups per day", selection: $coffeeAmount) {
                            ForEach(rangeOfCoffee,id: \.self) { number in
                                Text(number==1 ? "1 Cup" : " \(number) cups")
                            }
                        }.pickerStyle(.menu)
                    }
                Section{
                DrawhorizontalText(textResult: "\(recommendedBedTime)")
                }header: {
                    Text("Your ideal Bedtime is..")
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("BetterRest")
                    .navigationBarTitleDisplayMode(.large)
//                    .toolbar{
//                        Button("Calculate",action: calculateBedTime)
//                    }
//                    .alert(titleAlert, isPresented: $showingAlert){
//                        Button("OK"){}
//                    }message: {
//                        Text((messageAlert))
//                    }
          
        }
           
    }
    func calculateBedTime() -> String{//calculation of bedtime
        do{
            let config=MLModelConfiguration()
            let model=try SleepCalculator(configuration: config)
            let components=Calendar.current.dateComponents([.hour,.minute], from: wakeUp)//getting hours and minutes separatedly from the time of wakeup
            let hours=(components.hour ?? 0)*60*60 //nill coalsecing 0 for case if hours not readable
            let minutes=(components.minute ?? 0)*60 //nill coalsecing 0 for case if minutes not readable
            let prediction=try model.prediction(wake: Double(hours+minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount-1))//prediction was part of machine learning
            
            //now the prediction will be a double and we want actual sleep time so we will subtract from festimated wakeup time for that
            let sleepTime=wakeUp-prediction.actualSleep
//            titleAlert = "Your ideal bedtime is…"
//            messageAlert = sleepTime.formatted(date: .omitted, time: .shortened)
            return sleepTime.formatted(date: .omitted, time: .shortened)
        }catch{
            //if code fails
//            titleAlert = "Error"
//            messageAlert = "Sorry, there was a problem calculating your bedtime."
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
