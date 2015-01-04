//
//  MUEditProfileViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/3/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUEditProfileViewController.h"
#import <Parse/Parse.h>
#import "MUConstants.h"
@interface MUEditProfileViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *profilePrictureImageView;
@property (strong, nonatomic) IBOutlet UITextView *tagLineTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveTabBarButton;
@end

@implementation MUEditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFQuery *query = [PFQuery queryWithClassName:kMUPhotoClassKey];
    [query whereKey:kMUPhotoUserKey equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"error getting objects in class Photo for User ");
        }
        if([objects count] > 0){
            PFObject *photo = objects[0];
            PFFile *picFile = photo[kMUPhotoPictureKey];
            [picFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                self.profilePrictureImageView.image = [UIImage imageWithData:data];
            }];
        }else{
            NSLog(@"no pictures in collection");
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

#pragma mark - IBActions

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender {
}
@end
