//
//  ViewController.swift
//  ShoeSizeConverter
//
//  Created by Zachary Weiner on 12/13/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mensShoeSizeTextField: UITextField!
    
    @IBOutlet var womansShoeSizeTextField: UITextField!
    @IBOutlet var mensConvertedShoeSizeLabel: UILabel!
    @IBOutlet var womansConvertedShoeSizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertWomensShoeSizeButtonClicked(sender: AnyObject) {
        let womensShoeSizeFromString = Double((womansShoeSizeTextField.text as NSString).doubleValue)
        let conversionConstant = 30.5
        womansConvertedShoeSizeLabel.hidden = false
        womansConvertedShoeSizeLabel.text = "converted value = " + "\(womensShoeSizeFromString + conversionConstant)"
    }

    @IBAction func convertButtonClicked(sender: AnyObject) {
//        The More verbose way to do the conversions
//        let sizeFromTextField = mensShoeSizeTextField.text
//        let numberFromField = sizeFromTextField.toInt()
//        var intFromTextField = numberFromField!
        
        //shorthand for above
        let intFromTextField = mensShoeSizeTextField.text.toInt()!
        let conversionConstant = 30
        mensConvertedShoeSizeLabel.hidden = false
        mensConvertedShoeSizeLabel.text = "converted value =" + "\(intFromTextField + conversionConstant)"
    }
}

