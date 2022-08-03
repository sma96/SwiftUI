//
//  ExpenseItem.swift
//  iExpense
//
//  Created by 마석우 on 2022/08/02.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable, Equatable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
