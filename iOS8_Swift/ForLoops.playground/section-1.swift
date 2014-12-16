// Playground - noun: a place where people can play

import UIKit

//var meditationHours = 1
//for meditationHours; meditationHours < 100; meditationHours += 1{
//    println("I am getting more enlightened")
//}


//for var meditationHours = 1; meditationHours < 100; meditationHours++ {
//    println("I am getting more enlightened")
//}




/* this gets too large for the system to handle
var wheat  = 1
for var i = 0; i < 64; ++i{
    wheat = wheat * 2
    println("Location on board:\(i) and pieces of wheat:\(wheat) ")
}
*/



for var bottlesRemaining = 99; bottlesRemaining >= 0; bottlesRemaining-- {
    if(bottlesRemaining == 0){
        println("There are no bottles remaining")
    }else{
        println("There are \(bottlesRemaining) bottles remaining")
    }
}


for x in 1...5{
    println("\(x)")
}


var tigerNames:[NSString] = ["Tigger", "Saber", "Thor", "Tiny"]

for (index, tigerName) in enumerate(tigerNames){
    println("index: \(index) tigerName: \(tigerName)")
}