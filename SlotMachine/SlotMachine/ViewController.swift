//
//  ViewController.swift
//  SlotMachine
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // the UI is divided into 4 sections each one will be responsible for 
    // handling all of its own chidlren
    var titleContainer : UIView!
    var cardContainer : UIView!
    var detailsContainer : UIView!
    var buttonContainer : UIView!
    
    
    //Info Labels in Details container
    var titleLabel:UILabel!
    var creditsLabel:UILabel!
    var betLabel:UILabel!
    var winnerPaidLabel:UILabel!
    var creditsTitleLabel:UILabel!
    var betTitleLabel:UILabel!
    var winnerPaidTitleLabel:UILabel!
    
    
    //Buttons
    var resetButton:UIButton!
    var bet_1Button:UIButton!
    var bet_MaxButton:UIButton!
    var spinButton:UIButton!
    
    
    var slots:[[Slot]] = []
    var credits = 0
    var currentBet = 0
    var winnings = 0
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    let kSixth:CGFloat = 1.0 / 6.0
    let kThird:CGFloat = 1.0 / 3.0
    let kHalf:CGFloat = 1.0 / 2.0
    let kEigth:CGFloat = 1.0 / 8.0
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpContainerViews()
        hardReset()
    }

    func setUpContainerViews(){
        var originX = self.view.bounds.origin.x + kMarginForView
        var originY = self.view.bounds.origin.y
        var heightWithMargin = self.view.bounds.height * kSixth
        var widthWithMargin = self.view.bounds.width - (kMarginForView * 2)
        
        self.titleContainer = UIView(frame: CGRect(x:originX,
                                                   y:originY,
                                                   width:widthWithMargin,
                                                   height: heightWithMargin))
        self.titleContainer.backgroundColor  = UIColor.redColor()
        self.setUpTitleContainer(self.titleContainer)
        self.view.addSubview(self.titleContainer)
        
        
        self.cardContainer = UIView(frame: CGRect(x: originX, y: titleContainer.frame.height, width: widthWithMargin, height: (self.view.bounds.height * (kSixth * 3))))
        self.cardContainer.backgroundColor  = UIColor.blackColor()
        self.setUpcardContainer(self.cardContainer)
        self.view.addSubview(self.cardContainer)
        
        self.detailsContainer = UIView(frame: CGRect(x: originX, y: titleContainer.frame.height + cardContainer.frame.height, width: widthWithMargin, height: heightWithMargin))
        self.detailsContainer.backgroundColor  = UIColor.lightGrayColor()
        self.setUpdetailsContainer(self.detailsContainer)
        self.view.addSubview(self.detailsContainer)
        
        self.buttonContainer = UIView(frame: CGRect(x: originX, y: titleContainer.frame.height + cardContainer.frame.height + detailsContainer.frame.height, width: widthWithMargin, height: heightWithMargin))
        self.buttonContainer.backgroundColor  = UIColor.blackColor()
        self.setupbuttonContainer(self.buttonContainer)
        self.view.addSubview(self.buttonContainer)
        
    }
    
    func setUpTitleContainer(containerView:UIView){
        self.titleLabel = UILabel()
        self.titleLabel!.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setUpcardContainer(containerView:UIView){
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                var slotImageView = UIImageView()
                
                var slot:Slot
                if slots.count != 0 {
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else{
                    slot = Slot()
                }
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + (containerView.bounds.height * CGFloat(slotNumber) * kThird),
                    width: containerView.bounds.width * kThird - kMarginForSlot,
                    height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    func setUpdetailsContainer(containerView:UIView){
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name:"Menlo-Bold", size:CGFloat(16))
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center =
            CGPoint(
                x: containerView.frame.width * kSixth,
                y: containerView.frame.height * kThird * 2)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(creditsLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "credits:"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name:"AmericanTypewriter", size:CGFloat(14))
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center =
            CGPoint(
                x: containerView.frame.width * kSixth,
                y: containerView.frame.height * kThird)
        self.creditsTitleLabel.textAlignment = NSTextAlignment.Center
       
        containerView.addSubview(creditsTitleLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "000000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name:"Menlo-Bold", size:CGFloat(16))
        self.betLabel.sizeToFit()
        self.betLabel.center =
            CGPoint(
                x: containerView.frame.width * kSixth * 3,
                y: containerView.frame.height * kThird * 2)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(betLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "bet:"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name:"AmericanTypewriter", size:CGFloat(14))
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center =
            CGPoint(
                x: containerView.frame.width * kSixth * 3,
                y: containerView.frame.height * kThird)
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        
        containerView.addSubview(betTitleLabel)

        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name:"Menlo-Bold", size:CGFloat(16))
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center =
            CGPoint(
                x: containerView.frame.width * kSixth * 5,
                y: containerView.frame.height * kThird * 2)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(winnerPaidLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "paid:"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name:"AmericanTypewriter", size:CGFloat(14))
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center =
            CGPoint(
                x: containerView.frame.width * kSixth * 5,
                y: containerView.frame.height * kThird)
        self.winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
                containerView.addSubview(winnerPaidTitleLabel)
        
        
    }
    
    func setupbuttonContainer(containerView:UIView){
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * kEigth, y: containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        
        self.bet_1Button = UIButton()
        self.bet_1Button.setTitle("Bet 1", forState: UIControlState.Normal)
        self.bet_1Button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.bet_1Button.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.bet_1Button.backgroundColor = UIColor.lightGrayColor()
        self.bet_1Button.sizeToFit()
        self.bet_1Button.center = CGPoint(x: containerView.frame.width * 3 * kEigth , y: containerView.frame.height * kHalf)
        self.bet_1Button.addTarget(self, action: "bet_1ButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.bet_1Button)
        
        self.bet_MaxButton = UIButton()
        self.bet_MaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        self.bet_MaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.bet_MaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.bet_MaxButton.backgroundColor = UIColor.lightGrayColor()
        self.bet_MaxButton.sizeToFit()
        self.bet_MaxButton.center = CGPoint(x: containerView.frame.width * kEigth * 5, y: containerView.frame.height * kHalf)
        self.bet_MaxButton.addTarget(self, action: "bet_MaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.bet_MaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.spinButton.backgroundColor = UIColor.lightGrayColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * kEigth * 7, y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)


    }
    
    func resetButtonPressed(button:UIButton){
        self.hardReset()
    }
    
    func bet_1ButtonPressed(button:UIButton){
        self.currentBet = 1
    }
    
    func bet_MaxButtonPressed(button:UIButton){
        println("Bet Max button pressed")
    }
    
    func spinButtonPressed(button:UIButton){
        self.slots = Factory.CreateSlots()
        self.removeSlotImageViews()
        self.setUpcardContainer(self.cardContainer)
    }

    func removeSlotImageViews(){
        if self.cardContainer != nil {
            let container : UIView = self.cardContainer!
            let subviews:Array?  = container.subviews
            for view in subviews! {
                view.removeFromSuperview()
            }
        }
    }
    
    func hardReset(){
        self.removeSlotImageViews()
        self.slots.removeAll(keepCapacity: true)
        self.credits = 50
        self.winnings = 0
        self.currentBet = 0
        self.setUpcardContainer(self.cardContainer)
    }
    
    func updateMainView(){
        self.creditsLabel.text = "\(self.credits)"
        self.betLabel.text = "\(self.currentBet)"
        self.winnerPaidLabel.text = "\(self.winnings)"
    }
    
    func showAlertWithText(header:String = "Warning", message: String){
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

