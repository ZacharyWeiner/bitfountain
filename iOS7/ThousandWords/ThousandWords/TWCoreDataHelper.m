//
//  TWCoreDataHelper.m
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import "TWCoreDataHelper.h"
#import <UIKit/UIKit.h>
@implementation TWCoreDataHelper
+ (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    
    return context;
}
@end
