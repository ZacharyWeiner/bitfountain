//
//  MUMatchViewController.h
//  MatchedUp
//
//  Created by Zachary Weiner on 1/4/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MUMatchViewControllerDelegate<NSObject>
- (void)presentMatchesViewController;
@end

@interface MUMatchViewController : UIViewController
@property (weak, nonatomic) id <MUMatchViewControllerDelegate> delegate;
@property (strong, nonatomic) UIImage *matchedUserImage;
@end
