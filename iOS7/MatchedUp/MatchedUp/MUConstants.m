//
//  MUConstants.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/3/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUConstants.h"

@implementation MUConstants
NSString *const kMUUserProfileKey = @"profile";
NSString *const kMUUserProfileNameKey = @"name";
NSString *const kMUUserProfileFirstNameKey = @"firstName";
NSString *const kMUUserProfileLocationKey = @"location";
NSString *const kMUUserProfileGenderKey = @"gender";
NSString *const kMUUserProfileBirthdayKey = @"birthday";
NSString *const kMUUserProfileInterestedInKey = @"interestedIn";
NSString *const kMUUserProfilePictureURL = @"pictureURL";

NSString *const kMUUserProfileRelationshipStatusKey = @"relationshipStatus";
NSString *const kMUUserProfileAgeKey = @"age";

#pragma mark - Photo Class
NSString *const kMUPhotoClassKey = @"Photo";
NSString *const kMUPhotoUserKey = @"user";
NSString *const kMUPhotoPictureKey = @"image";

#pragma - mark User
NSString *const kMUUserTagLineKey = @"tagLine";

#pragma - mark Activity
NSString *const kMUActivityClassKey = @"Activity";
NSString *const kMUActivityTypeKey = @"type";
NSString *const kMUActivityFromUserKey = @"fromUser";
NSString *const kMUActivityToUserKey = @"toUser";
NSString *const kMUActivityPhotoKey = @"photo";
NSString *const kMUActivityTypeLikeKey = @"like";
NSString *const kMUActivityTypeDislikeKey = @"dislike";

#pragma mark - Settings
NSString *const kMUMenEnabledKey = @"men";
NSString *const kMUWomenEnabledKey = @"women";
NSString *const kMUSingleEnabledKey = @"single";
NSString *const kMUAgeMaxKey = @"ageMax";

@end
