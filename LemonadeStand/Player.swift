//
//  Player.swift
//  LemonadeStand
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
class Player {
    
    var money:Int = 0
    var lemons:Int = 0
    var iceCubes:Int = 0
    var todaysAcidtiyRatio:Int = 0
    
    var iceCubesToMix:Int = 0
    var lemonsToMix:Int = 0
    var iceCubesToBuy:Int = 0
    var lemonsToBuy:Int = 0
    var totalServings: Int = 0
    
    var todaysCustomers:[Customer] = []
    
    class func CreatePlayer(startingMoney:Int = 10, startingLemons:Int = 1, startingIceCubes:Int = 2) -> Player{
        var player = Player()
        player.money = startingMoney
        player.iceCubes = startingIceCubes
        player.lemons = startingLemons
        
        return player
    }
    
    func canBuyIce(toAdd:Int) -> Bool {
        if money >= toAdd {
            return true
        } else {
            //TODO: send warning
            return false
        }
    }
    
    func canAddIceToLemonade() -> Bool {
        if iceCubes - 1 >= 0  {
            return true
        } else {
            //TODO: send warning
            return false
        }
    }
    
    func buyIce(){
        iceCubes += 1
        money -= 1
        iceCubesToBuy += 1
    }
    
    func returnIce(){
        iceCubes -= 1
        money += 1
        iceCubesToBuy -= 1
    }
    
    func addIceToMix(){
        iceCubesToMix += 1
        iceCubes -= 1
    }
    
    func removeIceFromMix(){
        iceCubesToMix -= 1
        iceCubes += 1
    }
    
    func canBuyLemons(buyCount:Int) -> Bool {
        if money >= buyCount * 2  {
            return true
        } else {
            return false
        }
    }
    
    func canAddLemonToMix() -> Bool {
        if lemons - 1 >= 0 {
            return true
        } else {
            //TODO: send warning
            return false
        }
    }
    
    func buyLemon(){
        lemons += 1
        money -= 2
        lemonsToBuy += 1
    }
    
    func returnLemon(){
        lemons -= 1
        money += 2
        lemonsToBuy -= 1
    }
    
    func addLemonToMix(){
        lemons -= 1
        lemonsToMix += 1
    }
    
    func removeLemonFromMix() {
        lemonsToMix -= 1
        lemons += 1
    }
    
    //  add/un- mix for the days worth of mixing
    //  subtract lemons and ice cubes when mixing
    func mixLemonade(){
        todaysAcidtiyRatio = lemonsToMix - iceCubesToMix
    }
    
    func sellLemonade(potentialCustomers:[Customer]){
        if self.lemons == 0 && self.iceCubes == 0 {
            println("Game over")
            return
        }
        println("Todays acidity: \(todaysAcidtiyRatio)")
        for pCusomter in potentialCustomers {
            println("Customer Pref: \(pCusomter.tastePreference)")
            if pCusomter.tastePreference < 0.4 {
                if todaysAcidtiyRatio > 0 {
                    money += 1
                    println("You Made A Sale!")
                }
                else {
                    println("No Sale Today!")
                }
            }else if  pCusomter.tastePreference < 0.6 {
                if todaysAcidtiyRatio == 0 {
                    money += 1
                    println("You Made A Sale!")
                }
                else {
                    println("No Sale Today!")
                }
                
            } else {
                if todaysAcidtiyRatio < 0 {
                    money += 1
                    println("You Made A Sale!")
                }
                else {
                    println("No Sale Today!")
                }
                
            }
        }
    }
}