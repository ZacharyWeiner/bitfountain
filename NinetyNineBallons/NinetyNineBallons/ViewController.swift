//
//  ViewController.swift
//  NinetyNineBallons
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balloonsTextLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    var baloons:[Baloon] = []
    
    func createBaloon(count:Int, image:UIImage) -> Baloon {
        var baloon = Baloon()
        baloon.image = image
        baloon.baloonCount = count
        return baloon
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var counter = 0
        for var x = 0; x < 100; x++ {
            switch(counter){
            case 4:
                var b  = self.createBaloon(x, image:UIImage(named: "RedBalloon1.jpg")!)
                self.baloons.append(b)
            case 3:
                var b  = self.createBaloon(x, image:UIImage(named: "RedBalloon2.jpg")!)
                self.baloons.append(b)
            case 2:
                var b  = self.createBaloon(x, image:UIImage(named: "RedBalloon3.jpg")!)
                self.baloons.append(b)
            case 1:
                var b  = self.createBaloon(x, image:UIImage(named: "RedBalloon4.jpg")!)
                self.baloons.append(b)
            default:
                var b  = self.createBaloon(x, image:UIImage(named: "BerlinTVTower.jpg")!)
                self.baloons.append(b)
            }
            counter++
            if counter >= 6{
                counter = 0
            }
        }
    }

    
    @IBAction func nextButtoncClicked(sender: AnyObject) {
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            var index = Int(arc4random_uniform(UInt32(100)))
            var b = self.baloons[index]
            self.backgroundImage.image = b.image!
            self.balloonsTextLabel.text = "\(b.baloonCount) baloons"
            },
            completion: {
                (finished: Bool) -> () in
        })

        
      
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

