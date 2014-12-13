//
//  ViewController.swift
//  AgeOfLaika
//
//  Created by Zachary Weiner on 12/13/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var convertedLabel: UILabel!
    @IBOutlet var humanYearsTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertButtonClicked(sender: AnyObject) {
        convertedLabel.text = "Dog Years:" + "\(humanYearsTextField.text.toInt()! * 7)"
        convertedLabel.hidden = false
        humanYearsTextField.resignFirstResponder()
    }

}

