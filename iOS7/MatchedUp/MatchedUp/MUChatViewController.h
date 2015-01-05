//
//  MUChatViewController.h
//  MatchedUp
//
//  Created by Zachary Weiner on 1/4/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSMessagesViewController.h>
#import <Parse/Parse.h>
@interface MUChatViewController : JSMessagesViewController <JSMessagesViewDataSource, JSMessagesViewDelegate>
@property (strong, nonatomic) PFObject *chatRoom;
@end
