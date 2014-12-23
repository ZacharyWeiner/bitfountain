//
//  RTSpaceShipView.m
//  RaceToTheTop
//
//  Created by Zachary Weiner on 12/22/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import "RTSpaceShipView.h"

@implementation RTSpaceShipView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){}
    [self drawRect:frame];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.0;
    
    [bezierPath moveToPoint:CGPointMake(((1/6.0) * self.bounds.size.width), ((1/3.0) * self.bounds.size.height))];
    [bezierPath addLineToPoint:CGPointMake(((1/6.0) * self.bounds.size.width), ((2/3.0) * self.bounds.size.height))];
    [bezierPath addLineToPoint:CGPointMake(((5/6.0) * self.bounds.size.width), ((2/3.0) * self.bounds.size.height))];
    [bezierPath addLineToPoint:CGPointMake(((2/3.0) * self.bounds.size.width), ((1/2.0) * self.bounds.size.height))];
    [bezierPath addLineToPoint:CGPointMake(((1/3.0) * self.bounds.size.width), ((1/2.0) * self.bounds.size.height))];
    
    [bezierPath closePath];
    [bezierPath stroke];
    
    UIBezierPath *cockpitWindowPath = [UIBezierPath bezierPathWithRect:CGRectMake((2/3.0)*self.bounds.size.width, (1/2.0)*self.bounds.size.height, (1/6.0)*self.bounds.size.width, (1/12.0) * self.bounds.size.height)];
    [[UIColor blueColor] setFill];
    [cockpitWindowPath fill];
    
}

@end
