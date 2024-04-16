//
//  ContentView.swift
//  MVVM
//
//  Created by Thomas Williams on 4/15/24.
// Understaind Menu

import SwiftUI

struct ContentView: View {
    var body: some View {
        Menu {
            Button(role: .destructive) {} label: {
                Label("Delete", systemImage: "trash")
            }
            
            Menu {
                Button("Share with Friends") {}
                
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
            }
            
            Button {} label: {
                Label("Edit", systemImage: "pencil")
            }
        } label: {
            Label("More", systemImage: "ellipsis.circle")
                .foregroundColor(.purple)
        }
    }
}

#Preview {
    ContentView()
}
