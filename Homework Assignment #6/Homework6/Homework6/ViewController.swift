//
//  ViewController.swift
//  Homework6
//
//  Created by Patrick Kalkman on 04/03/2019.
//  Copyright © 2019 SimpleTechture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessageTouch(_ sender: Any) {
        messageLabel.text = "Hello World"
    }
    
}
