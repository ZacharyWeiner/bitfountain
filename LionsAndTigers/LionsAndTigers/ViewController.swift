//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Zachary Weiner on 12/13/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!

    var tigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tigers.append(self.createTiger(2, name: "Ting", breed: "Bengal", image: UIImage(named: "BengalTiger.jpg")!))
        tigers.append(self.createTiger(5, name: "Indie Squad", breed: "Indochinese", image: UIImage(named: "IndochineseTiger.jpg")!))
        
         tigers.append(self.createTiger(6, name: "Im Lyin", breed: "Lion", image: UIImage(named: "Lion.jpg")!))
         tigers.append(self.createTiger(4, name: "Cubby Hole", breed: "Lion Cub", image: UIImage(named: "LionCub1.jpg")!))
         tigers.append(self.createTiger(7, name: "Cub Scout", breed: "Lion", image: UIImage(named: "LionCub2.jpeg")!))
         tigers.append(self.createTiger(3, name: "Lioness", breed: "Lion", image: UIImage(named: "Lioness.jpeg")!))
         tigers.append(self.createTiger(2, name: "My Lazin", breed: "Malaysian", image: UIImage(named: "MalayanTiger.jpg")!))
         tigers.append(self.createTiger(1, name: "Sigh beard", breed: "Sibearian", image: UIImage(named: "SiberianTiger.jpg")!))
        //println("My tigers name is: \(myTiger.name) and hes a \(myTiger.age) year old \(myTiger.breed) tiger")
       
        for thisTiger in tigers{
            println("\(thisTiger.name) is a \(thisTiger.age) year old \(thisTiger.breed) tiger")
        }
    }

    @IBAction func nextClicked(sender: UIBarButtonItem) {
        
    }
    
    func createTiger(age:Int, name:NSString, breed:NSString , image:UIImage) -> Tiger{
        var myTiger = Tiger()
        myTiger.name = name
        myTiger.age = age
        myTiger.breed = breed
        myTiger.image = image
        return myTiger
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

