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
    var lions:[Lion] = []
    var selectedTiger = 0;
    var currentAnimal = (species:"Tiger", index:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tigers.append(self.createTiger(2, name: "Ting", breed: "Bengal", image: UIImage(named: "BengalTiger.jpg")!))
        tigers.append(self.createTiger(5, name: "Indie Squad", breed: "Indochinese", image: UIImage(named: "IndochineseTiger.jpg")!))
         var lazin = self.createTiger(2, name: "My Lazin", breed: "Malaysian", image: UIImage(named: "MalayanTiger.jpg")!)
         var sigh = self.createTiger(1, name: "Sigh beard", breed: "Sibearian", image: UIImage(named: "SiberianTiger.jpg")!)
        tigers += [lazin, sigh]
        for thisTiger in tigers{
            println("\(thisTiger.name) is a \(thisTiger.age) year old \(thisTiger.breed) tiger")
        }
        currentAnimal = ("Tiger", selectedTiger)
        setUIProperties()
        
        lions.append(self.createLion(2, name: "Mufasa", subSpecies: "Lion", image: UIImage(named: "Lion.jpg")!, isAlpha: true))
        lions.append(self.createLion(2, name: "Jane", subSpecies: "Lion", image: UIImage(named: "Lioness.jpeg")!, isAlpha: true))
        lions.append(self.createLion(6, name: "Im Lyin", subSpecies: "Lion", image: UIImage(named: "Lion.jpg")!, isAlpha:false))
        lions.append(self.createLion(4, name: "Cubby Hole", subSpecies: "Lion Cub", image: UIImage(named: "LionCub1.jpg")!, isAlpha:false))
        
        lions[3].changeToAlphaMale()
        println("isAlpha: \(lions[3].isAlphaMale)")
        

    }

    @IBAction func nextClicked(sender: UIBarButtonItem) {
        updateAnimal()
        setUIProperties()
    }
    
    func createTiger(age:Int, name:NSString, breed:NSString , image:UIImage) -> Tiger{
        var myTiger = Tiger()
        myTiger.name = name
        myTiger.age = age
        myTiger.breed = breed
        myTiger.image = image
        return myTiger
    }
    
    func createLion(age:Int, name:NSString, subSpecies:NSString , image:UIImage, isAlpha:Bool) -> Lion{
        var myLion = Lion()
        myLion.name = name
        myLion.age = age
        myLion.subSpecies = subSpecies
        myLion.image = image
        return myLion
    }
    
    func setUIProperties(){
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                if(self.currentAnimal.species == "Tiger"){
                    let tiger = self.tigers[self.currentAnimal.index]
                    self.nameLabel.text = tiger.name
                    self.ageLabel.text = "\(tiger.age)"
                    self.breedLabel.text = tiger.breed
                    self.myImageView.image = tiger.image!
                    var isLoud = (self.selectedTiger > 3)
                    tiger.chuffNumberOfTimes(tiger.age, isLoud: isLoud)
                    println(tiger.randomFact())
                }else{
                    let lion = self.lions[self.currentAnimal.index]
                    self.nameLabel.text = lion.name
                    self.ageLabel.text = "\(lion.age)"
                    self.breedLabel.text = lion.subSpecies
                    self.myImageView.image = lion.image!
                    var isLoud = (self.selectedTiger > 3)
                    lion.roar()
                    println(lion.randomFact())
                }
            },
            completion: {
                (finished: Bool) -> () in
        })
    }
    
    
    func updateAnimal() {
        switch currentAnimal{
        case ("Tiger", _):
            let randomNumber = Int(arc4random_uniform(UInt32(tigers.count)))
            currentAnimal = ("Lion", randomNumber)
            selectedTiger = randomNumber
        default:
            let randomNumber = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Tiger", randomNumber)
            selectedTiger = randomNumber
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

