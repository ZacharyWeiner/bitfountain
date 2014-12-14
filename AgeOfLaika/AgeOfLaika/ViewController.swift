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
        
        if((sender as UIButton).titleLabel?.text == "Convert to real dog years"){
            var humanYears:Double = Double((humanYearsTextField.text as NSString).doubleValue)
            var dogYears:Double = 0
            if(humanYears < 2){
                dogYears = humanYears * 10.5;
            }else{
                dogYears = 2 * 10.5;
                dogYears += ((humanYears-2) * Double(7))
            }
              convertedLabel.text = "Dog Years:" + "\(dogYears)"
        }
        else{
        convertedLabel.text = "Dog Years: " + "\(humanYearsTextField.text.toInt()! * 7)"
        }
        convertedLabel.hidden = false
        humanYearsTextField.resignFirstResponder()
    }
}

