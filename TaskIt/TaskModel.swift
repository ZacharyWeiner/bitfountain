//
//  TaskModel.swift
//  TaskIt
//
//  Created by Zachary Weiner on 12/15/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subTask: String
    @NSManaged var task: String

}
