//
//  RTMountainPath.h
//  RaceToTheTop
//
//  Created by Zachary Weiner on 12/23/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTMountainPath : UIView
+(NSArray *) mountainPathsForRect:(CGRect) rect;

+(UIBezierPath *)tapTargetForPath:(UIBezierPath *) path;
@end
