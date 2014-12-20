//
//  LRESignInViewController.h
//  LoginRegistrationExample
//
//  Created by Zachary Weiner on 12/16/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRECreateAccountViewController.h"

@interface LRESignInViewController : UIViewController <LRECreateAccountViewControllerDelegate>

-(void) didCancel;
-(void) didCreateAccount;

@end
