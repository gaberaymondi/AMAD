//
//  TeamPlayerController.swift
//  denver_sports
//
//  Created by Gabe Raymondi on 2/3/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import Foundation

enum DataError: Error {
    case BadFilePath
    case CouldNotDecodeData
    case NoData
}

class TeamPlayerController {
    //properties
    var teamPlayerData: [TeamPlayers]?
    let filename = "Denver"

    //read from plist and decode to array of ArtistAlbum struct
    func loadData() throws {
        print("Loading data...")
        
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: ".plist") {
            //found the file!
            let decoder = PropertyListDecoder()
            
            do {
                let data = try Data(contentsOf: pathURL)
                teamPlayerData = try decoder.decode([TeamPlayers].self, from: data)
                print("Data Loaded")
            } catch {
                throw DataError.CouldNotDecodeData
            }
        } else {
            throw DataError.BadFilePath
        }
    }
    
    func getAllTeams() throws -> [String] {
        var teams = [String]()
        
        //make sure we have data
        if let data = teamPlayerData {
            //we have data
            for teamStruct in data {
                teams.append(teamStruct.team)
            }
            return teams
        } else {
            throw DataError.NoData
        }
    }
    
    //get all of the players for their corresponding team
    func getPlayers(idx: Int) throws -> [String] {
        //make sure we have data
        if let data = teamPlayerData {
            //good data
            return data[idx].players
        } else {
            //no data
            throw DataError.NoData
        }
    }
}
