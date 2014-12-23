//
//  RTPathView.m
//  RaceToTheTop
//
//  Created by Zachary Weiner on 12/23/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import "RTPathView.h"
#import "RTMountainPath.h"

@implementation RTPathView

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    for(UIBezierPath *path in [RTMountainPath mountainPathsForRect:rect ]){
        [[UIColor blackColor] setFill];
        [path stroke];
    }
}


@end
