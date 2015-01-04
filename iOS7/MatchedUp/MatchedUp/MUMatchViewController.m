//
//  MUMatchViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/4/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUMatchViewController.h"
#import "MUConstants.h"
#import <Parse/Parse.h>

@interface MUMatchViewController()
@property (strong, nonatomic) IBOutlet UIImageView *matchedUserImageView;
@property (strong, nonatomic) IBOutlet UIImageView *currentUserImageView;

@end

@implementation MUMatchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)chatNowButtonPressed:(UIButton *)sender {
    
}

- (IBAction)keepBrowsingButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
