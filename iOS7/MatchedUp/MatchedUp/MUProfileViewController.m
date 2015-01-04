//
//  MUProfileViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/3/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUProfileViewController.h"
#import "MUConstants.h"
#import "ParseCreateUsersHelper.h"
@interface MUProfileViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *profilePictureImageView;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *taglineLabel;

@end

@implementation MUProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFFile *pictureFile = self.photo[kMUPhotoPictureKey];
    [pictureFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        UIImage *image = [UIImage imageWithData:data];
        self.profilePictureImageView.image = image;
    }];
    
    PFUser *user = self.photo[kMUPhotoUserKey];
    NSDictionary *profile = user[kMUUserProfileKey];
    self.locationLabel.text = profile[kMUUserProfileLocationKey];
    self.ageLabel.text = [NSString stringWithFormat:@"%i", [profile[kMUUserProfileAgeKey] intValue]];
    self.statusLabel.text = profile[kMUUserProfileRelationshipStatusKey];
    self.taglineLabel.text = user[kMUUserTagLineKey];
    
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

- (IBAction)AddUsers:(UIButton *)sender {
    [ParseCreateUsersHelper createUsers];
}

@end
