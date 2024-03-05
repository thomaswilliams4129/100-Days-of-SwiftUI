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
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formatedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
