//
//  Customer.swift
//  LemonadeStand
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
struct Customer {
    var tastePreference:Double = 0.0
}

class  CustomerFactory{
    class func CreateDailyCustomers() ->[Customer]{
        var customers:[Customer] = []
        var random = Int(arc4random_uniform(UInt32(10)))
        for var x = 0; x < random; x++ {
            var customer = CustomerFactory.CreateCustomer()
            customers.append(customer)
        }
        return customers
    }
    
    class func CreateCustomer() -> Customer {
        var random = Int(arc4random_uniform(UInt32(10)))
        var customerPreference = 1.0 / (random.description as NSString).doubleValue
        return Customer(tastePreference: customerPreference)
    }
}
