//
//  ViewController.swift
//  minerals
//
//  Created by Gabe Raymondi on 3/9/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    let cameraScheme = "cameraplus://"
    
    func schemeAvailable(scheme: String) -> Bool {
        //make url from scheme
        if let url = URL(string: scheme) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    func openApp(scheme: String) {
        if let url = URL(string: scheme) {
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in print("Succesfully opened \(scheme)")
            })
        }
    }

    @IBAction func openCamera(_ sender: Any) {
        let theCameraInstalled = schemeAvailable(scheme: cameraScheme)
        
        if theCameraInstalled {
            openApp(scheme: cameraScheme)
        } else {
            print("test")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = minerals[myIndex]
        infoLabel.text = mineral_info[myIndex]
        myImageView.image = UIImage(named: minerals[myIndex]+".jpg")
    }

    
}

