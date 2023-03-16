//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sai Abhilash Gudavalli on 15/03/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: expenseType
    let amount: Double
}
