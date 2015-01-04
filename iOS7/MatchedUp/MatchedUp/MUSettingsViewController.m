//
//  MUSettingsViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/3/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUSettingsViewController.h"
#import "MUConstants.h"
#import  <Parse/Parse.h>
#import <FacebookSDK.h>
@interface MUSettingsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *maxAgeLabel;
@property (strong, nonatomic) IBOutlet UISlider *ageSlider;
@property (strong, nonatomic) IBOutlet UISwitch *menSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *womenSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *singleSwitch;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;
@property (strong, nonatomic) IBOutlet UIButton *editProfileButton;

@end

@implementation MUSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ageSlider.value = [[NSUserDefaults standardUserDefaults] integerForKey:kMUAgeMaxKey];
    self.menSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:kMUMenEnabledKey];
    self.womenSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:kMUWomenEnabledKey];
    self.singleSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:kMUSingleEnabledKey];
    [self.ageSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.menSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.womenSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.singleSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    self.maxAgeLabel.text = [NSString stringWithFormat:@"%i", (int)self.ageSlider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Helper
- (void) valueChanged:(id)sender{
    if(sender == self.ageSlider){
        [[NSUserDefaults standardUserDefaults] setInteger:(int)self.ageSlider.value forKey:kMUAgeMaxKey];
        self.maxAgeLabel.text = [NSString stringWithFormat:@"%i",(int)self.ageSlider.value];
        NSLog(@"Max Age = %@", self.maxAgeLabel.text);
    }else if(sender == self.menSwitch){
        [[NSUserDefaults standardUserDefaults] setBool:self.menSwitch.on forKey:kMUMenEnabledKey];
        NSLog(@"Search Men: %@", (self.menSwitch.on? @"YES" : @"NO"));
    }else if(sender == self.womenSwitch){
        [[NSUserDefaults standardUserDefaults] setBool:self.womenSwitch.on forKey:kMUWomenEnabledKey];
        NSLog(@"Search Women: %@", (self.menSwitch.on? @"YES" : @"NO"));
    }else if(sender == self.singleSwitch){
        [[NSUserDefaults standardUserDefaults] setBool:self.singleSwitch.on forKey:kMUSingleEnabledKey];
        NSLog(@"Search Singles Only: %@", (self.menSwitch.on? @"YES" : @"NO"));
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logoutButtonPressed:(UIButton *)sender {
    [PFUser logOut];
    [FBSession.activeSession closeAndClearTokenInformation];
    [FBSession.activeSession close];
    [FBSession setActiveSession:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)editProfileButtonPressed:(UIButton *)sender {
}

@end
