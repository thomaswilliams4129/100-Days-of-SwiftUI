//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Williams on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    @Observable
    class Expense {
        var items = [ExpenseItem]()
    }
    
    var body: some View {
        Text("Hi")
    }
    
    
    
}

#Preview {
    ContentView()
}
