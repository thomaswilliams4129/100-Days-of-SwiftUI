//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Thomas Williams on 3/15/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    @State private var shippingAddress = ShippingAddress()
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $shippingAddress.address.name)
                TextField("Street Address", text: $shippingAddress.address.streetAddress)
                TextField("City", text: $shippingAddress.address.city)
                TextField("Zip", text: $shippingAddress.address.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(!shippingAddress.address.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
