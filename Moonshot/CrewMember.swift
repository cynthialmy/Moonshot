//
//  CrewMember.swift
//  Moonshot
//
//  Created by Cynthia LI on 2023-12-06.
//

import Foundation

struct CrewMember: Hashable, Codable {
    let role: String
    let astronaut: Astronaut
}
