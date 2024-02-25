//
//  ContentView.swift
//  Animations
//
//  Created by Thomas Williams on 2/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(
            .easeInOut(duration: 2)
                .delay(1),
            value: animationAmount)
    }
}

#Preview {
    ContentView()
}