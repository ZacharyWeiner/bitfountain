//
//  Album.h
//  ThousandWords
//
//  Created by Zachary Weiner on 12/27/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
