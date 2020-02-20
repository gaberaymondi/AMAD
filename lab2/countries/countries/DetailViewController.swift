//
//  DetailViewController.swift
//  drewleague
//
//  Created by Gabe Raymondi on 2/18/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var teamData = TeamDataController()
    var selectedTeam = 0
    var playerList = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        playerList = teamData.getPlayers(idx: selectedTeam)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        cell.textLabel?.text = playerList[indexPath.row]

        return cell
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            playerList.remove(at: indexPath.row)
            teamData.deletePlayer(dataIdx: selectedTeam, playerIdx: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {

        }    
    }
    

    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fromRow = fromIndexPath.row
        let toRow = to.row
        
        let movePlayer = playerList[fromRow]
        
        playerList.swapAt(fromRow, toRow)
        
        teamData.deletePlayer(dataIdx: selectedTeam, playerIdx: fromRow)
        teamData.addPlayer(dataIdx: selectedTeam, newPlayer: movePlayer, playerIdx: toRow)
    }
    

    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        if segue.identifier == "save" {
            let source = segue.source as! AddPlayerViewController
            
            if source.addedPlayer.isEmpty == false {
                teamData.addPlayer(dataIdx: selectedTeam, newPlayer: source.addedPlayer, playerIdx: playerList.count)
                playerList.append(source.addedPlayer)
                tableView.reloadData()
            }
        }
    }

}
