//
//  LRESignInViewController.m
//  LoginRegistrationExample
//
//  Created by Zachary Weiner on 12/16/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import "LRESignInViewController.h"

@interface LRESignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LRESignInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addAccountBarButtonTapped:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toCreateAccountSegue" sender:sender];
}
- (IBAction)loginButtonTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toViewControllerSegue" sender:sender];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- LREAccountViewControllerDelegate
-(void) didCancel{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void) didCreateAccount{
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue   isKindOfClass:[LRECreateAccountViewController class]]){
        LRECreateAccountViewController *vC = segue.destinationViewController;
        vC.delegate = self;
}


@end
