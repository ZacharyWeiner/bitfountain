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
    if(![[[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME] isEqualToString:@""]){
        self.usernameTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    }
    
    if(![[[NSUserDefaults standardUserDefaults] objectForKey:PASSWORD] isEqualToString:@""]){
        self.passwordTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:PASSWORD];
    }
}
- (IBAction)addAccountBarButtonTapped:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toCreateAccountSegue" sender:sender];
}
- (IBAction)loginButtonTapped:(UIButton *)sender {
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:PASSWORD];
    if([self.usernameTextField.text isEqualToString:username]  && [self.passwordTextField.text isEqualToString:password]){
        [self performSegueWithIdentifier:@"toViewControllerSegue" sender:sender];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Username and Password combo does not match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
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
    if([segue.destinationViewController   isKindOfClass:[LRECreateAccountViewController class]]){
        LRECreateAccountViewController *vC = segue.destinationViewController;
        vC.delegate = self;
    }
}
@end
