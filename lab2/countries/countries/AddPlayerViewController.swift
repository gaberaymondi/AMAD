//
//  AddPlayerViewController.swift
//  drewleague
//
//  Created by Gabe Raymondi on 2/18/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerTextField: UITextField!
    
    var addedPlayer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            if playerTextField.text?.isEmpty == false {
                addedPlayer = playerTextField.text!
            }
        }
    }
    

}
