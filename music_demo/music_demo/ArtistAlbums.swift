//
//  ArtistAlbums.swift
//  music_demo
//
//  Created by Gabe Raymondi on 1/23/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import Foundation

struct ArtistAlbums: Decodable {
    let name: String
    let albums: [String]
}
