//
//  ContentView.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import SwiftUI

public enum expenseType: Codable {
    case personal
    case business
}

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showAddExpense: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                if expenses.personalItems.count > 0 {
                    Section("Personal") {
                        ForEach(expenses.personalItems) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: "USD"))
                                    .modifier(PrimaryFont(value: item.amount))
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                
                if expenses.businessItems.count > 0 {
                    Section("Business") {
                        ForEach(expenses.businessItems) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .modifier(PrimaryFont(value: item.amount))
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
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

struct PrimaryFont: ViewModifier {
    
    let value: Double
    
    func body(content: Content) -> some View {
        
        if value < 10 {
            return content
                .font(.caption)
        } else if value < 100 {
            return content
                .font(.caption2)
        } else {
            return content
                .font(.footnote)
        }
    }
}
