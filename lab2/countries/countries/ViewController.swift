//
//  ViewController.swift
//  drewleague
//
//  Created by Gabe Raymondi on 2/18/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var teamList = [String]()
    var teamDataController = TeamDataController()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        do {
            try teamDataController.loadData()
            teamList = teamDataController.getTeams()
        } catch {
            print(error)
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        cell.textLabel?.text = teamList[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerSegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            if let selection = indexPath?.row {
                detailVC.selectedTeam = selection
                detailVC.title = teamList[selection]
                detailVC.teamData = teamDataController
            }
        } else if segue.identifier == "TeamSegue" {
            let infoVC = segue.destination as! TeamInfoTableViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            infoVC.team = teamList[indexPath!.row]
            let playerList = teamDataController.getPlayers(idx: indexPath!.row)
            infoVC.number = String(playerList.count)
            infoVC.title = teamList[indexPath!.row]
        }
    }
}

