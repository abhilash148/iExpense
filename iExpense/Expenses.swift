//
//  Expenses.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "expenses")
            }
        }
        
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "expenses") {
            
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
            
        }
        items = []
    }
    
}
