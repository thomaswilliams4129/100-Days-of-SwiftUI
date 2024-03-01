//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Williams on 2/29/24.
//

import Observation
import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
    
    
    
}

#Preview {
    ContentView()
}
