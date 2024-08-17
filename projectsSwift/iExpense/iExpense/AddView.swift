//
//  AddView.swift
//  iExpense
//
//  Created by Dhruv Bhardwaj on 02/07/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses:Expenses//only observe that a expenses object exists
    @Environment(\.dismiss) var dismiss//to dismiss the vieew now go to save button
    
    @State private var name=""
    @State private var type="Personal"
    @State private var amount=0.0
    
    let types=["Business","Personal"]
    var body: some View {
        NavigationView{
            
            Form{
                TextField("Name",text:$name)
                Picker("Type",selection:$type){
                    ForEach(types,id:\.self){
                        Text($0)
                    }
                }.pickerStyle(.automatic)
                TextField("Amount",value:$amount,format:.currency(code:Locale.current.currencyCode ?? "INR"))
                .keyboardType(.decimalPad)
            }.navigationTitle("Add new Expenses")
            //button to save the data in Expenses
                .toolbar{
            Button("Save"){
                let item=ExpenseItem(name: name, type: type, amount: amount)
                expenses.item.append(item)
                dismiss()//dismiss
            }
        }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
