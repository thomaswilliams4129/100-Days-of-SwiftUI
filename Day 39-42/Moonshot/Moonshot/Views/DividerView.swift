//
//  DividerView.swift
//  Moonshot
//
//  Created by Thomas Williams on 3/6/24.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
        .preferredColorScheme(.dark)
}
