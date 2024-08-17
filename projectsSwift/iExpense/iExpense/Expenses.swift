//
//  Expenses.swift
//  iExpense
//
//  Created by Dhruv Bhardwaj on 02/07/22.
//

import Foundation

class Expenses:ObservableObject{
    @Published var item=[ExpenseItem](){
    didSet{//if a value is changed here either add kra ya remove kra toh ye neeche vala code chalao
        if let encoded=try? JSONEncoder().encode(item){
            UserDefaults.standard.set(encoded,forKey: "Items")
        }//user default m save krdo
    }
}
    init(){
        if let savedItems=UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems=try? JSONDecoder().decode([ExpenseItem].self,from: savedItems){//.self represent that we are referring to that array of items itself
                item=decodedItems
                return
            }
        }
        item=[]
    }
}
