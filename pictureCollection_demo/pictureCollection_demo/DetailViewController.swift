//
//  DetailViewController.swift
//  pictureCollection_demo
//
//  Created by Gabe Raymondi on 2/18/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //hold the name of the image
    var imageName : String?
    
    //connection
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = imageName {
            imageView.
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
