//
//  Mission.swift
//  Moonshot
//
//  Created by Thomas Williams on 3/4/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Decodable, Encodable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
