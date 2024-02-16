//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Thomas Williams on 2/15/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

extension View {
    
    func title() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Title")
                .title()
        }
    }
}



#Preview {
    ContentView()
}
