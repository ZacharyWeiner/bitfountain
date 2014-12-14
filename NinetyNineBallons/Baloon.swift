//
//  Baloon.swift
//  NinetyNineBallons
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
import UIKit

class Baloon {
    var baloonCount = 0
    var image = UIImage(named: "")
}

struct MakeBaloon {
    func createBaloon(count:Int, image:UIImage) -> Baloon {
        
        var baloon = Baloon()
        baloon.image = image
        baloon.baloonCount = count
        return baloon
    }
}