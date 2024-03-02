//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Williams on 2/29/24.
//

import SwiftUI

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal expenses") {
                    ForEach(expenses.items.filter{$0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .fontWeight(item.amount < 100 && item.amount > 10 ? .bold : .regular)
                                .foregroundStyle(item.amount >= 100 ? .red : .primary)
                        }
                        
                    }
                    .onDelete(perform: removeItemsFromPersonal)
                }
                
                Section("Buisness expenses") {
                    ForEach(expenses.items.filter{$0.type == "Buisness"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .fontWeight(item.amount < 100 && item.amount > 10 ? .bold : .regular)
                                .foregroundStyle(item.amount >= 100 ? .red : .primary)
                        }
                        
                    }
                    .onDelete(perform: removeItemsFromBusiness)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func removeItemsFromPersonal(at offsets: IndexSet) {
        var expenseItems = expenses.items.sorted { a, b in a.type > b.type}
        expenseItems.remove(atOffsets: offsets)
        expenses.items = expenseItems
    }
    
    func removeItemsFromBusiness(at offsets: IndexSet) {
            // expenses.items.remove(atOffsets: newOffsets)

            let nPersonal = expenses.items.filter { $0.type == "Personal" }.count
            var newOffsets = IndexSet()

            for o in offsets {
                newOffsets.insert(o + nPersonal)
            }

            var orderedExpensesItems = expenses.items.sorted { a, b in a.type > b.type }
            orderedExpensesItems.remove(atOffsets: newOffsets)
            expenses.items = orderedExpensesItems
        }
}

#Preview {
    ContentView()
}
