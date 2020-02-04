//
//  FirstViewController.swift
//  denver_sports
//
//  Created by Gabe Raymondi on 2/2/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    //constants
    let teamComp = 0
    let playerComp = 1
    
    //vars
    var teamPlayers = TeamPlayerController()
    var teams = [String]()
    var players = [String]()
    
    @IBOutlet weak var teamPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            //load the data
            try teamPlayers.loadData()
            
            //populate initial teams and players array
            teams = try teamPlayers.getAllTeams()
            players = try teamPlayers.getPlayers(idx: 0)
            
        } catch {
            print(error)
        }
    }
    
    //DataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == teamComp {
            return teams.count
        } else if component == playerComp {
            return players.count
        } else {
            print("Unknown Component")
            return -1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == teamComp {
            return teams[row]
        } else if component == playerComp {
            return players[row]
        } else {
            print("Unknown Component")
            return "unkown"
        }
    }
    
    //1: update albums and label when artist component is changed
    //2: update label when album component is changed
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //check which component changed
        if component == teamComp {
            //task 1
            do {
                players = try teamPlayers.getPlayers(idx: row)
            } catch {
                print(error)
            }
            //reload component
            teamPicker.reloadComponent(teamComp)
            teamPicker.selectRow(0, inComponent: teamComp, animated: true)
            
            //get the currently selected indexes artist and album
            let playerIdx = pickerView.selectedRow(inComponent: playerComp)
            let teamIdx = pickerView.selectedRow(inComponent: teamComp)
            
            choiceLabel.text = "\(players[playerIdx]) plays for the \(teams[teamIdx])"
        }
    }

}

