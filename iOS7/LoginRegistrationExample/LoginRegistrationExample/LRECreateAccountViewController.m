//
//  LRECreateAccountViewController.m
//  LoginRegistrationExample
//
//  Created by Zachary Weiner on 12/16/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import "LRECreateAccountViewController.h"


@interface LRECreateAccountViewController ()

@end

@implementation LRECreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createAccountButtonTapped:(UIButton *)sender {
    [self.delegate didCreateAccount];
}
- (IBAction)cancelButtonTapped:(id)sender {
    [self.delegate didCancel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
