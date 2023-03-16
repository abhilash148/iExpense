//
//  AddView.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import SwiftUI

struct AddView: View {
    
    @State private var expenseName: String = ""
    @State private var expenseValue: Double = 0.0
    @State private var expenseType: String = "Personal"
    
    let expenseTypes: [String] = ["Personal", "Business"]
    
    @FocusState private var showToolbar: Bool
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    TextField("Enter expense name", text: $expenseName)
                }
                
                Section("Select expense type") {
                    Picker("Select expense type", selection: $expenseType) {
                        ForEach(expenseTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount") {
                    TextField("Enter expense amount", value: $expenseValue, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($showToolbar)
                }
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        showToolbar = false
                    }
                }
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: expenseName, type: expenseType, amount: expenseValue)
                    expenses.items.append(item)
                    dismiss()
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
