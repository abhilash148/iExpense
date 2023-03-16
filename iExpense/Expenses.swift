//
//  Expenses.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
