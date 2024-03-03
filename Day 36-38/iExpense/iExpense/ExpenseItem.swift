//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Thomas Williams on 3/1/24.
//

import Foundation

struct ExpenseItem: Identifiable, Encodable, Decodable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
