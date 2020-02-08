//
//  ViewController.swift
//  countries_demo
//
//  Created by Gabe Raymondi on 2/6/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var continentsDataController = ContinentDataController()
    var continentsList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            try continentsDataController.loadData()
            continentsList = continentsDataController.getContinents()
        } catch {
            print(error)
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContinentCell", for: indexPath)
        
        cell.textLabel?.text = continentsList[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CountrySegue" {
            
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            
            if let selection = indexPath?.row {
                detailVC.selectedContinent = selection
                detailVC.title = continentsList[selection]
                detailVC.continentsDataController = continentsDataController
            }
        }
    }


}

