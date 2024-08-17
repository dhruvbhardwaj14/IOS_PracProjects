//
//  ContentView.swift
//  UnitConversion
//
//  Created by Dhruv Bhardwaj on 17/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var Unit="Length"
    @State private var inputUnit="Meter"
    @State private var inputValue=0.0
    @State private var outputUnit="Meter"
    var initValue:Double{
        //Length Conversions
        if inputUnit==lUnits[0] {
            return inputValue
        }
        else if inputUnit==lUnits[1] {
            return inputValue*1000
        }
        else if inputUnit==lUnits[2] {
            return inputValue*0.3048
        }
        else if inputUnit==lUnits[3] {
            return inputValue*0.9144
        }
        else if inputUnit==lUnits[4] {
            return inputValue*1609.34
        }
        
        //temperature
        else if inputUnit==tempUnits[0] {
            return inputValue
        }
        else if inputUnit==tempUnits[1] {
            return (inputValue-32)*0.5556
        }
        else if inputUnit==tempUnits[2] {
            return inputValue-273.15
        }
        
        //volume
        else if inputUnit==vUnits[0] {
            return inputValue
        }
        else if inputUnit==vUnits[1] {
            return inputValue*1000
        }
        else if inputUnit==vUnits[2] {
            return inputValue*284.131
        }
        else if inputUnit==vUnits[3] {
            return inputValue*568.261
        }
        else if inputUnit==vUnits[4] {
            return inputValue*4546.09
        }
        
        //time
        else if inputUnit==timUnits[0] {
            return inputValue
        }
        else if inputUnit==timUnits[1] {
            return inputValue*60
        }
        else if inputUnit==timUnits[2] {
            return inputValue*3600
        }
        else if inputUnit==timUnits[3] {
            return inputValue*3600*24
        }
        return inputValue
    }
    //ans finding
    var outputValue:Double{
        //Length Conversions
        if outputUnit==lUnits[0] {
            return initValue
        }
        else if outputUnit==lUnits[1] {
            return initValue/1000
        }
        else if outputUnit==lUnits[2] {
            return initValue*3.28084
        }
        else if outputUnit==lUnits[3] {
            return initValue/0.9144
        }
        else if outputUnit==lUnits[4] {
            return initValue/1609.34
        }
        
        //temperature
        else if outputUnit==tempUnits[0] {
            return initValue
        }
        else if outputUnit==tempUnits[1] {
            return (initValue*1.8)+32
        }
        else if outputUnit==tempUnits[2] {
            return initValue+273.15
        }
        
        //volume
        else if outputUnit==vUnits[0] {
            return initValue
        }
        else if outputUnit==vUnits[1] {
            return initValue/1000
        }
        else if outputUnit==vUnits[2] {
            return initValue/284.131
        }
        else if outputUnit==vUnits[3] {
            return initValue/568.261
        }
        else if outputUnit==vUnits[4] {
            return initValue/4546.09
        }
        
        //time
        else if outputUnit==timUnits[0] {
            return initValue
        }
        else if outputUnit==timUnits[1] {
            return initValue/60
        }
        else if outputUnit==timUnits[2] {
            return initValue/3600
        }
        else if outputUnit==timUnits[3] {
            return initValue/(3600*24)
        }
        return initValue
    }
    @FocusState private var inputIsFocused:Bool
    let units=["Length","Temperature","Volume","Time"]
    let lUnits=["Meter","Kilometer","Feet","Yard","Miles"]
    let tempUnits=["°Celsius","°Fahrenheit","Kelvin"]
    let vUnits=["Milliliters","liters","Cups","Pints","Gallons"]
    let timUnits=["Seconds","Minutes","Hours","Days"]
    var outList:[String]{
        if Unit==units[0] {
            return lUnits
        }
        else if Unit==units[1]{
            return tempUnits
        }
        else if Unit==units[2]{
            return vUnits
        }
        else if Unit==units[3]{
            return timUnits
        }
        return lUnits
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                Picker("Unit",selection: $Unit){
                    ForEach(units,id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.menu)
                }header: {
                    Text("Enter the Unit")
                }
                Section{
                    Picker("Output Unit",selection: $inputUnit){
                        ForEach(outList,id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.menu)
            }header: {
                Text("Enter the Input unit")
            }
                Section{
                    TextField("Value",value:$inputValue,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }header: {
                    Text("Enter the Input value")
                }
                Section{
                    Picker("Output Unit",selection: $outputUnit){
                        ForEach(outList,id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.menu)
            }header: {
                Text("Enter the Output unit")
            }
                Section{
                    Text(outputValue,format: .number)
                }header: {
                    Text("Output Value")
                }
            }.navigationTitle("Unit Converter")
                .toolbar{//navigation,small toolbaar at bottom and etc.
                    ToolbarItemGroup(placement: .keyboard){//buttons for toolbar
                        Spacer()
                        Button("Done"){
                            inputIsFocused=false;
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

