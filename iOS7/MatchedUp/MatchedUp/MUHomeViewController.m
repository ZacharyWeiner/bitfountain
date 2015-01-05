//
//  MUHomeViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/3/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUHomeViewController.h"
#import <Parse/Parse.h>
#import "MUConstants.h"
#import "MUProfileViewController.h"

@interface MUHomeViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *chatBarButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *settingsBarButtonItem;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *taglineLabel;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) IBOutlet UIButton *dislikeButton;

@property (strong, nonatomic) NSArray *photos;
@property (nonatomic) int currentIndex;
@property (strong, nonatomic) PFObject *photo;

@property (nonatomic) BOOL isLikedByCurrentUser;
@property (nonatomic) BOOL isDislikedByCurrentUser;
@property (nonatomic, strong) NSMutableArray *actvities;
@end

@implementation MUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.likeButton.enabled = NO;
    //self.infoButton.enabled = NO;
    //self.dislikeButton.enabled = NO;
    self.currentIndex = 0;
    
    PFQuery *query = [PFQuery queryWithClassName:kMUPhotoClassKey];
    [query includeKey:kMUPhotoUserKey];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            [self showAlertIsError:YES withMessage:[NSString stringWithFormat:@"Error getting photos for user: %@", error]];
            return;
        }
        self.photos = objects;
        [self queryForCurrentPhotoIndex];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if([segue.identifier isEqualToString:@"homeToProfileSegue"]){
         MUProfileViewController *destinatationVC = segue.destinationViewController;
         destinatationVC.photo = self.photo;
     }else if([segue.identifier isEqualToString:@"homeToMatchSegue"]){
         MUMatchViewController *matchVC = segue.destinationViewController;
         matchVC.matchedUserImage = self.photoImageView.image;
         matchVC.delegate = self;
     }
 }



#pragma mark -IBActions
- (IBAction)chatBarButtonItemPressed:(UIBarButtonItem *)sender {
     [self performSegueWithIdentifier:@"homeToMatchesSegue" sender:self];
}

- (IBAction)settingsBarButtonItemPressed:(id)sender {
}

- (IBAction)likeButtonPressed:(UIButton *)sender {
    [self checkLike];
}

- (IBAction)infoButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"homeToProfileSegue" sender:self];
}

- (IBAction)dislikeButtonPressed:(id)sender {
    [self checkDisike];
}

#pragma mark - Heleprs
- (void)queryForCurrentPhotoIndex{
    if(self.photos.count > 0){
        self.photo = self.photos[self.currentIndex];
        PFFile *file = self.photo[kMUPhotoPictureKey];
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if(error){
                [self showAlertIsError:YES withMessage:[NSString stringWithFormat:@"error getting File for Photo: %@", error]];
                return;
            }
            UIImage *image = [UIImage imageWithData:data];
            self.photoImageView.image = image;
            [self updateView];
        }];
        
//        PFQuery *queryForLike = [PFQuery queryWithClassName:kMUActivityClassKey];
//        [queryForLike whereKey:kMUActivityTypeKey equalTo:kMUActivityTypeLikeKey];
//        [queryForLike whereKey:kMUActivityPhotoKey equalTo:self.photo];
//        [queryForLike whereKey:kMUActivityFromUserKey equalTo:[PFUser currentUser]];
//        
//        PFQuery *queryForDislike = [PFQuery queryWithClassName:kMUActivityClassKey];
//        [queryForLike whereKey:kMUActivityTypeKey equalTo:kMUActivityTypeDislikeKey];
//        [queryForLike whereKey:kMUActivityPhotoKey equalTo:self.photo];
//        [queryForLike whereKey:kMUActivityFromUserKey equalTo:[PFUser currentUser]];
//        
//        PFQuery *likeAndDislikeQuery = [PFQuery orQueryWithSubqueries:@[queryForLike, queryForDislike]];
        
        PFQuery *query = [PFQuery queryWithClassName:kMUActivityClassKey];
        [query  whereKey:kMUActivityFromUserKey equalTo:[PFUser currentUser]];
        [query whereKey:kMUActivityPhotoKey equalTo:self.photo];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if(error){
                
            }
            
            self.actvities = [objects mutableCopy];
            if (self.actvities.count == 0) {
                self.isLikedByCurrentUser = NO;
                self.isDislikedByCurrentUser = NO;
            }else{
                if([self.actvities[0][kMUActivityTypeKey] isEqualToString: kMUActivityTypeLikeKey]){
                    self.isLikedByCurrentUser = YES;
                    self.isDislikedByCurrentUser = NO;
                }else if ([self.actvities[0][kMUActivityTypeKey] isEqualToString: kMUActivityTypeDislikeKey]){
                    self.isLikedByCurrentUser = NO;
                    self.isDislikedByCurrentUser = YES;
                }else{
                    //OTHER ACTIVITY
                }
            }
            [self updateView];
        }];
    }
}

-(void) updateView{
    self.firstNameLabel.text = self.photo[kMUPhotoUserKey][kMUUserProfileKey][kMUUserProfileFirstNameKey];
    self.taglineLabel.text = self.photo[kMUPhotoUserKey][kMUUserTagLineKey];
    self.ageLabel.text = [NSString stringWithFormat:@"%@", self.photo[kMUPhotoUserKey][kMUUserProfileKey][kMUUserProfileAgeKey]];
    //self.dislikeButton.enabled = !self.isDislikedByCurrentUser;
    //self.likeButton.enabled = !self.isLikedByCurrentUser;
}

- (void)setupNextPhoto{
    if(self.currentIndex + 1 < self.photos.count){
        self.currentIndex++;
        [self queryForCurrentPhotoIndex];
    }else{
        [self showAlertIsError:NO withMessage:@"You've perved all the locals already!"];
    }
    [self updateView];
}

- (void)showAlertIsError:(BOOL)isError withMessage:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)saveLike{
    PFObject *likeActivity  = [PFObject objectWithClassName:kMUActivityClassKey];
    [likeActivity setObject:kMUActivityTypeLikeKey forKey:kMUActivityTypeKey];
    [likeActivity setObject:[PFUser currentUser] forKey:kMUActivityFromUserKey];
    [likeActivity  setObject:[self.photo objectForKey:kMUPhotoUserKey] forKey:kMUActivityToUserKey];
    [likeActivity setObject:self.photo forKey:kMUActivityPhotoKey];
    [likeActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        self.isLikedByCurrentUser = YES;
        self.isDislikedByCurrentUser = NO;
        [self.actvities addObject:likeActivity];
        [self checkForPhotoUserLikes];
    }];
}

- (void)saveDislike{
    PFObject *likeActivity  = [PFObject objectWithClassName:kMUActivityClassKey];
    [likeActivity setObject:kMUActivityTypeDislikeKey forKey:kMUActivityTypeKey];
    [likeActivity setObject:[PFUser currentUser] forKey:kMUActivityFromUserKey];
    [likeActivity  setObject:[self.photo objectForKey:kMUPhotoUserKey] forKey:kMUActivityToUserKey];
    [likeActivity setObject:self.photo forKey:kMUActivityPhotoKey];
    [likeActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        self.isLikedByCurrentUser = NO;
        self.isDislikedByCurrentUser = YES;
        [self.actvities addObject:likeActivity];
        [self setupNextPhoto];
    }];
}

- (void)checkLike{
    if(self.isLikedByCurrentUser){
        [self setupNextPhoto];
        return;
    }else if (self.isDislikedByCurrentUser){
        for (PFObject *activity in self.actvities) {
            [activity deleteInBackground];
        }
        [self.actvities removeLastObject];
        [self saveLike];
    }else{
        [self saveLike];
    }
}

- (void)checkDisike{
    if(self.isDislikedByCurrentUser){
        [self setupNextPhoto];
        return;
    }else if (self.isLikedByCurrentUser){
        for (PFObject *activity in self.actvities) {
            [activity deleteInBackground];
        }
        [self.actvities removeLastObject];
        [self saveDislike];
    }else{
        [self saveDislike];
    }
}

- (void) checkForPhotoUserLikes{
    PFQuery *query = [PFQuery queryWithClassName:kMUActivityClassKey];
    [query whereKey:kMUActivityFromUserKey equalTo:self.photo[kMUPhotoUserKey]];
    [query whereKey:kMUActivityToUserKey equalTo:[PFUser currentUser]];
    [query  whereKey:kMUActivityTypeKey equalTo:kMUActivityTypeLikeKey];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"error getting likes from photo owner. error: %@", error);
            return;
        }
        if(objects.count > 0){
            [self createChatRoom];
            
        }else{
            [self setupNextPhoto];
        }
    }];
}

- (void)createChatRoom{
    NSLog(@"Create Chatroom called");
    PFQuery *queryForChatRoom = [PFQuery queryWithClassName:@"ChatRoom"];
    NSArray *matches = [NSArray arrayWithObjects:[PFUser currentUser], (PFUser *)self.photo[kMUPhotoUserKey],  nil];
    [queryForChatRoom whereKey:@"user1" containedIn:matches];
    [queryForChatRoom findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"error getting chats for users. error: %@", error);
            return;
        }
        if(objects.count == 0){
            //create chat room
            PFObject *chatRoom = [PFObject objectWithClassName:@"ChatRoom"];
            [chatRoom setObject:[PFUser currentUser] forKey:@"user1"];
            [chatRoom setObject:self.photo[kMUPhotoUserKey] forKey:@"user2"];
            [chatRoom saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                [self performSegueWithIdentifier:@"homeToMatchSegue" sender:self];
                [self setupNextPhoto];
            }];
        
        }else{
            // do nothing, the chat exitst
        }
    }];
}
-(void)presentMatchesViewController{
    [self dismissViewControllerAnimated:NO completion:^{
        [self performSegueWithIdentifier:@"homeToMatchesSegue" sender:self];
    }];

}
@end
