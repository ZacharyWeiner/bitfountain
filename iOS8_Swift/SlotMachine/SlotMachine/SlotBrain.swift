//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation

class SlotBrain{
    class func unpackSlotsIntoSlotRows(slots: [[Slot]]) -> [[Slot]]{
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots{
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                }else if index == 1 {
                    slotRow2.append(slot)
                } else {
                    slotRow3.append(slot)
                }
            }
        }
        return [slotRow, slotRow2, slotRow3];
    }
    
    class func computeWinnings(slots:[[Slot]]) -> Int {
        var slotsInRows = SlotBrain.unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkForFlush(slotRow){
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkFor3InARow(slotRow){
                println("3 in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            if checkForThreeOfAKind(slotRow) {
                println("3 of a kind!!!")
                winnings += 1
                threeOfAKindWinCount += 1
            }
        }
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        if straightWinCount == 3 {
            println("Epic Straight")
            winnings += 100
        }
        if threeOfAKindWinCount == 3 {
            println("3's all around!")
            winnings += 50
        }
        return winnings
    }
    
    class func checkForFlush(slotRow:[Slot]) -> Bool {
        var returnValue = false
        let slot1 = slotRow[0];
        let slot2 = slotRow[1];
        let slot3 = slotRow[2];
        var isRedFlush = (slot1.isRed == true) && (slot2.isRed == true) && (slot3.isRed == true)
        var isBlackFlush = (slot1.isRed != true) && (slot2.isRed != true) && (slot3.isRed != true)
        if(isRedFlush || isBlackFlush){
            returnValue = true
        }
        return  returnValue
    }
    
    class func checkFor3InARow(slotRow:[Slot]) -> Bool {
        var returnValue = false
        let slot1 = slotRow[0];
        let slot2 = slotRow[1];
        let slot3 = slotRow[2];
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        } else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        } else {
            return false
        }
    }
    
    class func checkForThreeOfAKind(slotRow:[Slot]) -> Bool {
        
        let slot1 = slotRow[0];
        let slot2 = slotRow[1];
        let slot3 = slotRow[2];
        
        return slot1.value == slot2.value && slot1.value == slot3.value
    }
}