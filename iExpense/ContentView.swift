//
//  ContentView.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showAddExpense: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar(content: {
                Button {
                    showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }

            })
            .navigationTitle("iExpense")
            .sheet(isPresented: $showAddExpense) {
                AddView(expenses: expenses)
            }
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
