//
//  TeamInfoTableViewController.swift
//  drewleague
//
//  Created by Gabe Raymondi on 2/18/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class TeamInfoTableViewController: UITableViewController {
    
    var team = String()
    var number = String()
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        teamName.text = team
        playerNumber.text = number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
