//
//  ViewController.swift
//  ControlFlow-XCode
//
//  Created by Zachary Weiner on 12/13/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.executeControlFlow()
    }
    
    func executeControlFlow(){
        let truckSpeed = 45
        let lamboSpeed = 120
        var mySpeed:Int
        mySpeed = 55
        
        if mySpeed < 45{
            println(mySpeed)
        }
        else{
            println("TOO FAST!")
        }
        
        
        if mySpeed <= 65 {
            println("If youre on the highway, speed up!")
        }
        else if mySpeed <= 90 {
          println("If youre on the highway, let of the gas, if not hit the breaks!")
        }
        else{
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

