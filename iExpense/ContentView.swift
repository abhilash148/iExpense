//
//  ContentView.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar(content: {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 10.0)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }

            })
            .navigationTitle("iExpense")
        }
    }
    
    func removeItems(at offSet: IndexSet) {
        expenses.items.remove(atOffsets: offSet)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
