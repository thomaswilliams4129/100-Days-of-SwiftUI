//
//  Friend.swift
//  FriendFace
//
//  Created by Thomas Williams on 4/1/24.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}
