//
//  SecondViewController.swift
//  denver_sports
//
//  Created by Gabe Raymondi on 2/2/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let espnScheme = "espn://"
    let theScoreScheme = "theScore://"
    let thirdPartyScheme = "http://www.bleacherreport.com"
    
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
    
    
    @IBAction func goCheckScores(_ sender: Any) {
        
        let espnInstalled = schemeAvailable(scheme: espnScheme)
        let theScoreInstalled = schemeAvailable(scheme: theScoreScheme)
        
        if espnInstalled {
            openApp(scheme: espnScheme)
        } else if theScoreInstalled {
            openApp(scheme: theScoreScheme)
        } else {
            openApp(scheme: thirdPartyScheme)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

