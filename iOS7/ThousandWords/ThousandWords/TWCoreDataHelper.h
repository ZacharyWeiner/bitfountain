//
//  TWCoreDataHelper.h
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface TWCoreDataHelper : NSObject
+(NSManagedObjectContext *) managedObjectContext;
@end
