//
//  ContentView.swift
//  Word Scrample
//
//  Created by Thomas Williams on 2/21/24.
//


import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List (people, id: \.self) {
            Text("\($0)")
        }
        .listStyle(.grouped)
    }
    
    func testBundles() {
        if let fileUrl = Bundle.main.url(forResource: "someFile", withExtension: "txt") {
            // we found the file in our bundle
            if let fileContents = try? String(contentsOf: fileUrl) {
                
            }
        }
    }
    
    func testStrings() {
        let input = """
        a
        b
        c
        """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
    }
}

#Preview {
    ContentView()
}
