//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myMoneyLabel: UILabel!
    @IBOutlet weak var currentLemonCountLabel: UILabel!
    @IBOutlet weak var currentIceCubeCountLabel: UILabel!
    
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    
    @IBOutlet weak var lemonsToMixLabel: UILabel!
    @IBOutlet weak var iceCubesToMixLabel: UILabel!
    
    var player:Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.player = Player.CreatePlayer(startingMoney: 10, startingLemons: 1, startingIceCubes: 2)
        updateView()
    }
    
    func updateView() {
        myMoneyLabel.text = "\(player.money)";
        currentLemonCountLabel.text = "\(player.lemons)";
        currentIceCubeCountLabel.text = "\(player.iceCubes)";
        lemonsToPurchaseLabel.text = "\(player.lemonsToBuy)";
        iceCubesToPurchaseLabel.text = "\(player.iceCubesToBuy)";
        lemonsToMixLabel.text = "\(player.lemonsToMix)";
        iceCubesToMixLabel.text = "\(player.iceCubesToMix)";
    }
    
    @IBAction func startYourdayClicked(sender: UIButton) {
        player.mixLemonade()
        var customers = CustomerFactory.CreateDailyCustomers()
        player.sellLemonade(customers)
        player.lemonsToBuy = 0
        player.iceCubesToBuy = 0
        player.lemonsToMix = 0
        player.iceCubesToMix = 0
        updateView()
        if player.money == 0 {
            self.showAlertWithText(message: "Game Over")
        }
    }

    @IBAction func decrementLemonsToBuy(sender: UIButton) {
        if player.lemonsToBuy > 0 {
            player.returnLemon()
            updateView()
        }
        
    }
    
    @IBAction func incrementLemonsToBuy(sender: UIButton) {
        if(player.canBuyLemons(player.lemonsToBuy + 1)){
            player.buyLemon()
            updateView()
        }
    }
    
    @IBAction func decrementIceToBuy(sender: UIButton) {
        if player.iceCubesToBuy > 0 {
            player.returnIce()
            updateView()
        }
    }
    
    @IBAction func incrementIceToBuy(sender: UIButton) {
        if player.canBuyIce(player.iceCubesToBuy + 1) {
            player.buyIce()
            updateView()
        }
    }
    
    @IBAction func decrementLemonsToMix(sender: UIButton) {
        if player.lemonsToMix > 1 {
            player.removeLemonFromMix()
            updateView()
        }
    }
    
    @IBAction func incrementLemonsToMix(sender: UIButton) {
        if player.canAddLemonToMix() {
            player.addLemonToMix()
            updateView()
        }
    }
    
    @IBAction func decrementIceToMix(sender: UIButton) {
        if player.iceCubesToMix > 1 {
            player.removeIceFromMix()
            updateView()
        }
    }
    
    @IBAction func incrementIceToMix(sender: UIButton) {
        if player.canAddIceToLemonade() {
            player.addIceToMix()
            updateView()
        }
    }
    
    
    func showAlertWithText(header:String = "Warning", message: String){

        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        resetPlayer()
    }
    
    func resetPlayer() {
        self.player = Player.CreatePlayer(startingMoney: 10, startingLemons: 1, startingIceCubes: 2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

