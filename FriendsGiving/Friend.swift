//
//  Friend.swift
//  FriendsGiving
//
//  Created by Lori Rothermel on 4/1/23.
//

import Foundation

struct Friend: Identifiable, Codable {
    var id: String?
    var name: String = ""
    var bringing: String = ""
    var notes: String = ""
}
