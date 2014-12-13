// Playground - noun: a place where people can play

import UIKit

var firstInteger = 2, secondInteger = 29

var thirdInteger:Float = (Float)(secondInteger / firstInteger) // this evaluates first then casts
var fourthInteger:Int = 5
var fifthInteger:Int = (Int)(thirdInteger) * fourthInteger



//I will be using this later to track the discount at this department store 
// it will change seasonally



var discountOnShoesAtStore = 0.3
var priceOfShoes:Double = 33
var priceAfterDiscount = priceOfShoes * (1.0 - discountOnShoesAtStore)
var downPayment = 10.5

priceAfterDiscount = priceAfterDiscount - downPayment


//Numeric Literal 
var over1Million = 10_000_000_000



//strings
var myFirstSwifString = "Hi IM Freakin Awesome!"
myFirstSwifString = myFirstSwifString.uppercaseString

var x = 5
var newString = "\(x)"

var doubleValue = 3.4
var newDoubleAsString = "\(doubleValue)" + "!"


//string to int
var intAsString = "9"
var stringAsInt = intAsString.toInt()
var optionalToInt = stringAsInt!

//string to double 
var doubleAsString = "3.9765"
var doubleValueFromString = Double((doubleAsString as NSString).doubleValue)

doubleValueFromString += 3.2

//constants
let string2 = "world"

//constants cant do this
string2  = "new"

















