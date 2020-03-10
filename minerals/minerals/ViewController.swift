//
//  ViewController.swift
//  minerals
//
//  Created by Gabe Raymondi on 3/9/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = minerals[myIndex]
        infoLabel.text = mineral_info[myIndex]
        myImageView.image = UIImage(named: minerals[myIndex]+".jpg")
    }


}

