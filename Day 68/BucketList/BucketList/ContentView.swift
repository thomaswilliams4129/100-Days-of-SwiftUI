//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Williams on 4/9/24.
//

import SwiftUI
import MapKit

struct ContentView: View {

    var body: some View {
        Map()
            .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ContentView()
}
