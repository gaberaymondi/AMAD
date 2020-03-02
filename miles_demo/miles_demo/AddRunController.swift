//
//  AddRunController.swift
//  miles_demo
//
//  Created by Gabe Raymondi on 2/27/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit

class AddRunController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var milesTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(AddRunController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == '\n'
        
    }
    }
    
    @objc func didTapView() {
        self.view.endEditing(true)
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
