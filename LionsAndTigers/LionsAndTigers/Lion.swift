//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subSpecies = ""
    
    func roar(){
        println("Lion: Roar Roar...")
    }
    
    func changeToAlphaMale(){
        self.isAlphaMale = true
    }
    
    func randomFact()-> NSString{
        var randomFact:NSString;
        if self.isAlphaMale {
            randomFact = "Male Lions are easy to recognize due to their maines"
        }else{
            randomFact = "Female Lionesses form the stable social unit and do not tollerate outside females"
        }
        return randomFact
    }
}