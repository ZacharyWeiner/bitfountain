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
    self.matchedUserImageView.image = self.matchedUserImage;
    PFQuery *query = [PFQuery queryWithClassName:kMUPhotoClassKey];
    [query whereKey:kMUPhotoUserKey equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"error getting photo for current user. error: %@", error);
            return;
        }
        if(objects.count > 0){
            PFObject *photo = objects[0];
            PFFile *photoFile = photo[kMUPhotoPictureKey];
            [photoFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                self.currentUserImageView.image = [UIImage imageWithData:data];
            }];
        }
    }];
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
    [self.delegate presentMatchesViewController];
}

- (IBAction)keepBrowsingButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
