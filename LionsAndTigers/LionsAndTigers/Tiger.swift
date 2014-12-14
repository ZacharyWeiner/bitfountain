//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Zachary Weiner on 12/13/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
import UIKit
struct Tiger{
    var age = 0
    var name = ""
    var breed = ""
    //if you dont actually set a default image this will crash the app
    var image = UIImage(named:"")
    
    func chuff(){
        println("Tiger: Chuff Chuff...")
    }
    
    func chuffNumberOfTimes(numberOfTimes:Int){
        for var chuff = 0; chuff < numberOfTimes; chuff++ {
            self.chuff()
        }
    }
}