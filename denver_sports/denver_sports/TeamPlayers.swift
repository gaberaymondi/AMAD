//
//  TeamPlayers.swift
//  denver_sports
//
//  Created by Gabe Raymondi on 2/3/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import Foundation

struct TeamPlayers: Decodable {
    let team: String
    let players: [String]
}
