//
//  ContentView.swift
//  iExpense
//
//  Created by Dhruv Bhardwaj on 30/06/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses=Expenses()
    @State private var showingAddExpense=false//check for showing the Addexpense or not
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.item){item in
//                    Text(item.name)//that just shows the name only
                    //showing all details of the expense
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text(item.type)
                                .font(.caption2)
                        }
                        Spacer()
                        Text(item.amount,format: .currency(code: Locale.current.currencyCode ?? "INR"))
                            .foregroundColor((item.amount>=10 && item.amount<=100) ? .green : .red)
                        
                    }
                    
                }
                //adding removeitems func to ondelte modifier to each element
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                    Button{
                        showingAddExpense=true
                    }label: {
                        Image(systemName: "plus")
                    }
                    
                
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
        
        
    }
    /* we can add expenses, we can also add code to remove them. This means adding a method capable of deleting an IndexSet of list items, then passing that directly on to our expenses array*/
    func removeItems(at offsets:IndexSet){
        expenses.item.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
