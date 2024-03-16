//
//  Address.swift
//  CupcakeCorner
//
//  Created by Thomas Williams on 3/16/24.
//

import Foundation

struct Address: Identifiable, Codable {
    var id = UUID()
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        
        return true
    }
}

@Observable
class ShippingAddress {
    var address = Address() {
        didSet {
            if let encoded = try? JSONEncoder().encode(address) {
                UserDefaults.standard.set(encoded, forKey: "Address")
            }
        }
    }
    
    init() {
        if let savedAddress = UserDefaults.standard.data(forKey: "Address") {
            if let decodedAddress = try? JSONDecoder().decode(Address.self, from: savedAddress) {
                address = decodedAddress
                return
            }
        }
    }
}
