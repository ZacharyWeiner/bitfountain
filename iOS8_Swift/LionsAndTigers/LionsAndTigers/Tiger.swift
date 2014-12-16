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
    
    func chuffNumberOfTimes(numberOfTimes:Int, isLoud:Bool){
        for var chuff = 1; chuff <= numberOfTimes; chuff++ {
            if(isLoud){
                self.chuff()
            }else{
                println("Tiger: Purr Purr...")
            }
        }
    }
    
    func randomFact() -> NSString {
        var randomFact:String
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        if(randomNumber == 0){
            randomFact = "The tiger is the biggest of the cat family"
        
        } else if(randomNumber == 1){
            randomFact = " Tigers can reach a length of 3.3 meters"
        } else{
            randomFact = " a group of tigers is also known as an 'ambush'"
        }
        return randomFact
    }
}