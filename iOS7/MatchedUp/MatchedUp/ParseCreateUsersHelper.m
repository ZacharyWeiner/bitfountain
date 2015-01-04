//
//  ParseCreateUsersHelper.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/3/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "ParseCreateUsersHelper.h"
#import <Parse/Parse.h>
#import "MUConstants.h"
@interface ParseCreateUsersHelper()
@property (strong, nonatomic) NSMutableArray *usersToAdd; //=[[NSMutableArray alloc]init];
@property (strong, nonatomic) NSMutableArray *profiles; //= [[NSMutableArray alloc]init];
@property (nonatomic) int index;
@end

@implementation ParseCreateUsersHelper

+(void)createUsers
{
    
    ParseCreateUsersHelper *helper = [[ParseCreateUsersHelper alloc]init];
    helper.usersToAdd = [NSMutableArray new];
    helper.profiles = [NSMutableArray new];
    [helper createTestUsers];
   
}

-(void) createTestUsers{
    
    PFUser *newUser1 = [PFUser user];
    newUser1.username = @"user1";
    newUser1.password = @"password1";
    NSDictionary *profile = @{@"age" : @28, @"birthday" : @"11/22/1985", @"firstName" : @"Julie", @"gender" : @"female", @"location" : @"Berlin, Germany", @"name" : @"Julie Adams"};
    [self.usersToAdd addObject:newUser1];
    [self.profiles addObject:profile];
    
    PFUser *newUser2 = [PFUser user];
    newUser2.username = @"user2";
    newUser2.password = @"password22";
    NSDictionary *profile2 = @{@"age" : @20, @"birthday" : @"01/22/1995", @"firstName" : @"Jen", @"gender" : @"female", @"location" : @"LA, California", @"name" : @"Jen Blue"};
    [self.usersToAdd addObject:newUser2];
    [self.profiles addObject:profile2];
    
    PFUser *newUser3 = [PFUser user];
    newUser3.username = @"user3";
    newUser3.password = @"password3";
    NSDictionary *profile3 = @{@"age" : @35, @"birthday" : @"04/22/1980", @"firstName" : @"Laura", @"gender" : @"female", @"location" : @"Seatle, Washington", @"name" : @"Laura Green"};
    [self.usersToAdd addObject:newUser3];
    [self.profiles addObject:profile3];
    
    PFUser *newUser4 = [PFUser user];
    newUser4.username = @"user4";
    newUser4.password = @"password4";
    NSDictionary *profile4 = @{@"age" : @40, @"birthday" : @"06/22/1974", @"firstName" : @"Samantha", @"gender" : @"female", @"location" : @"Chicago, Illinois", @"name" : @"Samantha Brown"};
    [self.usersToAdd addObject:newUser4];
    [self.profiles addObject:profile4];
    
    PFUser *newUser5 = [PFUser user];
    newUser5.username = @"user5";
    newUser5.password = @"password5";
    NSDictionary *profile5 = @{@"age" : @45, @"birthday" : @"08/22/1969", @"firstName" : @"Alison", @"gender" : @"female", @"location" : @"Ft Laud, Florida", @"name" : @"Alison Pink"};
    [self.usersToAdd addObject:newUser5];
    [self.profiles addObject:profile5];
    
    PFUser *newUser6 = [PFUser user];
    newUser6.username = @"user6";
    newUser6.password = @"password6";
    NSDictionary *profile6 = @{@"age" : @45, @"birthday" : @"11/22/1969", @"firstName" : @"Jordan", @"gender" : @"male", @"location" : @"Ft Laud, Florida", @"name" : @"Jordan Bowler"};
    [self.usersToAdd addObject:newUser6];
    [self.profiles addObject:profile6];
    
    PFUser *newUser7 = [PFUser user];
    newUser7.username = @"user7";
    newUser7.password = @"password7";
    NSDictionary *profile7 = @{@"age" : @40, @"birthday" : @"09/22/1974", @"firstName" : @"Albert", @"gender" : @"male", @"location" : @"Porland, Maine", @"name" : @"Albert Snapper"};
    [self.usersToAdd addObject:newUser7];
    [self.profiles addObject:profile7];
    
    PFUser *newUser8 = [PFUser user];
    newUser8.username = @"user8";
    newUser8.password = @"password8";
    NSDictionary *profile8 = @{@"age" : @35, @"birthday" : @"06/22/1980", @"firstName" : @"Brian", @"gender" : @"male", @"location" : @"Ft Laud, Florida", @"name" : @"Brian Onesize"};
    [self.usersToAdd addObject:newUser8];
    [self.profiles addObject:profile8];
    
    PFUser *newUser9 = [PFUser user];
    newUser9.username = @"user9";
    newUser9.password = @"password9";
    NSDictionary *profile9 = @{@"age" : @30, @"birthday" : @"06/22/1984", @"firstName" : @"Doug", @"gender" : @"male", @"location" : @"Brooklyn, NY", @"name" : @"Doug Silly"};
    [self.usersToAdd addObject:newUser9];
    [self.profiles addObject:profile9];
    
    PFUser *newUser10 = [PFUser user];
    newUser10.username = @"user10";
    newUser10.password = @"password10";
    NSDictionary *profile10 = @{@"age" : @20, @"birthday" : @"06/22/1995", @"firstName" : @"Brian", @"gender" : @"male", @"location" : @"Austin, TX", @"name" : @"Steve Beard"};
    [self.usersToAdd addObject:newUser10];
    [self.profiles addObject:profile10];
    
    
    [self recursiveAddUser];
}

-(void)recursiveAddUser{
    if(self.usersToAdd.count > 0){
        PFUser *user = self.usersToAdd[0];
        [self.usersToAdd removeObjectAtIndex:0];
        NSDictionary *profile = self.profiles[0];
        [self.profiles removeObjectAtIndex:0];
        [self signUpUser:user withProfile:profile andImageIndex:self.index];
        self.index++;
    }
}

-(void)signUpUsers:(NSArray *)users withProfiles:(NSArray *)profiles
{
    for (int i =0; i<users.count; i++) {
        [self signUpUser:users[i] withProfile:profiles[i] andImageIndex:i];
    }
}

-(void) signUpUser:(PFUser*)user withProfile:(NSDictionary *)profile andImageIndex:(int)index{
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"sign up %@", error);
        [user setObject:profile forKey:@"profile"];
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            UIImage *profileImage = [UIImage imageNamed:[NSString stringWithFormat:@"person%i", index +1]];
            NSLog(@"Saving: %@", [NSString stringWithFormat:@"person%i", index +1]);
            NSData *imageData = UIImageJPEGRepresentation(profileImage, 0.8);
            PFFile *photoFile = [PFFile fileWithData:imageData];
            [photoFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded){
                    PFObject *photo = [PFObject objectWithClassName:kMUPhotoClassKey];
                    [photo setObject:user forKey:kMUPhotoUserKey];
                    [photo setObject:photoFile forKey:kMUPhotoPictureKey];
                    [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        
                        NSLog(@"Photo saved successfully");
                        if(self.usersToAdd.count > 0){
                            [self recursiveAddUser];
                        }
                    }];
                }
            }];
        }];
    }];
}
@end
