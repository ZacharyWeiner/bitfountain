//
//  LRECreateAccountViewController.h
//  LoginRegistrationExample
//
//  Created by Zachary Weiner on 12/16/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LRECreateAccountViewControllerDelegate <NSObject>

-(void) didCancel;
-(void) didCreateAccount;

@end
@interface LRECreateAccountViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassTextField;
@property (weak, nonatomic) id<LRECreateAccountViewControllerDelegate> delegate;
@end
