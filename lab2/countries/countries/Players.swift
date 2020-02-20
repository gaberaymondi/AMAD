//
//  Players.swift
//  drewleague
//
//  Created by Gabe Raymondi on 2/18/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import Foundation
import UIKit

struct TeamsDataModel: Codable {
    var team: String
    var players: [String]
}

enum DataError: Error {
    case NoDataFile
    case CouldNotDecode
    case CouldNotEncode
}

class TeamDataController {
    var allData = [TeamsDataModel]()
    let fileName = "roster"
    let dataFileName = "data.plist"
    
    init() {
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(TeamDataController.writeData(_:)), name: UIApplication.willResignActiveNotification, object: app)
    }
    
    func loadData() throws {
        let pathURL: URL?
        
        let dataFileURL = getDataFile(datafile: dataFileName)
        
        if FileManager.default.fileExists(atPath: dataFileURL.path) {
            pathURL = dataFileURL
        } else {
            pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist")
            
        }

        if let dataURL = pathURL {
            let decoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: dataURL)
                allData = try decoder.decode([TeamsDataModel].self, from: data)
            } catch {
                throw DataError.CouldNotDecode
            }
        }
        else {
            throw DataError.NoDataFile
        }
    }
    
    func getDataFile(datafile: String) -> URL {
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0]
        
        return docDir.appendingPathComponent(datafile)
    }

    
    @objc func writeData(_ notification: NSNotification) throws {
        print("Writing data to \(dataFileName)")
        let dataFileURL = getDataFile(datafile: dataFileName)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(allData.self)
            try data.write(to: dataFileURL)
        } catch {
            print(error)
            throw DataError.CouldNotEncode
        }
        
    }
    
    func getTeams() -> [String] {
        var allTeams = [String]()
        for item in allData {
            allTeams.append(item.team)
        }
        return allTeams
    }
    
    func getPlayers(idx: Int) -> [String] {
        return allData[idx].players
    }
    
    func addPlayer(dataIdx: Int, newPlayer: String, playerIdx: Int) {
        allData[dataIdx].players.insert(newPlayer, at: playerIdx)
    }
    
    func deletePlayer(dataIdx: Int, playerIdx: Int) {
        allData[dataIdx].players.remove(at: playerIdx)
    }
}
