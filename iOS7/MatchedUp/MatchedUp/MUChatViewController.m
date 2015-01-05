//
//  MUChatViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/4/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUChatViewController.h"
#import "MUConstants.h"
@interface MUChatViewController()
@property (strong, nonatomic) PFUser *withUser;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSTimer *chatsTimer;
@property (nonatomic) BOOL initalLoadComplete;

@property (strong, nonatomic) NSMutableArray *chats;
@end

@implementation MUChatViewController
- (PFUser *)currentUser{
    if(!_currentUser){_currentUser = [PFUser currentUser];}
    return _currentUser;
}

- (NSMutableArray *)chats{
    if(!_chats){_chats = [NSMutableArray new];}
    return _chats;
}

- (void) viewDidLoad{
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    [[JSBubbleView appearance] setFont:[UIFont systemFontOfSize:16.0f]];
    self.messageInputView.textView.placeHolder = @"Are you a 5000 lb elephant? that could break the ice";
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.currentUser = [PFUser currentUser];
    if([self.currentUser.objectId isEqualToString:((PFUser *)self.chatRoom[@"user1"]).objectId]){
        self.withUser = self.chatRoom[@"user2"];
    }else{
        self.withUser = self.chatRoom[@"user1"];
    }
    self.title = self.withUser[kMUUserProfileKey][@"firstName"];
    self.initalLoadComplete = NO;
    [self checkForNewChats];
    self.chatsTimer = [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(checkForNewChats) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.chatsTimer = nil;
}


- (void)checkForNewChats{
    long oldChatCount = [self.chats count];
    PFQuery *queryForChats = [PFQuery queryWithClassName:@"Chat"];
    [queryForChats whereKey:@"chatroom" equalTo:self.chatRoom];
    [queryForChats orderByAscending:@"createdAt"];
    [queryForChats findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){}
        if(self.initalLoadComplete == NO || oldChatCount != objects.count){
            self.chats = [objects mutableCopy];
            [self.tableView reloadData];
            self.initalLoadComplete = YES;
            [JSMessageSoundEffect playMessageReceivedSound];
            [self scrollToBottomAnimated:YES];
        }
    }];
    
}

#pragma mark - Table View Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chats.count;
}

-(void)didSendText:(NSString *)text{
    if(text.length != 0){
        PFObject *chat = [PFObject objectWithClassName:@"Chat"];
        [chat setObject:self.chatRoom forKey:@"chatroom"];
        [chat setObject:self.currentUser forKey:@"fromUser"];
        [chat setObject:self.withUser forKey:@"toUser"];
        [chat setObject:text forKey:@"text"];
        
        [self.chats addObject:chat];
        [chat saveInBackground];
        [JSMessageSoundEffect playMessageSentSound];
        [self.tableView reloadData];
        [self finishSend];
        [self scrollToBottomAnimated:YES];
    }
}

-(JSBubbleMessageType)messageTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *chat = self.chats[indexPath.row];
    if([self.currentUser.objectId isEqualToString:((PFUser *)chat[@"fromUser"]).objectId]){
        return JSBubbleMessageTypeOutgoing;
    }else{
        return JSBubbleMessageTypeIncoming;
    }
}

-(UIImageView *)bubbleImageViewWithType:(JSBubbleMessageType)type forRowAtIndexPath:(NSIndexPath *)indexPath{
    PFObject *chat = self.chats[indexPath.row];
    if([self.currentUser.objectId isEqualToString:((PFUser *)chat[@"fromUser"]).objectId]){
        return [JSBubbleImageViewFactory bubbleImageViewForType:type color:[UIColor js_bubbleGreenColor]];
    }else{
        return [JSBubbleImageViewFactory bubbleImageViewForType:type color:[UIColor js_bubbleLightGrayColor]];
    }
}

-(JSMessagesViewTimestampPolicy)timestampPolicy{
    return JSMessagesViewTimestampPolicyAll;
}

-(JSMessagesViewAvatarPolicy)avatarPolicy{
    return JSMessagesViewAvatarPolicyNone;
}

- (JSMessagesViewSubtitlePolicy)subtitlePolicy{
    return JSMessagesViewSubtitlePolicyNone;
}

-(JSMessageInputViewStyle)inputViewStyle{
    return JSMessageInputViewStyleFlat;
}

#pragma mark - Message view Delegate optional
-(void)configureCell:(JSBubbleMessageCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    if([cell messageType] == JSBubbleMessageTypeOutgoing){
        cell.bubbleView.textView.textColor = [UIColor whiteColor];
    }
}

-(BOOL)shouldPreventScrollToBottomWhileUserScrolling{
    return YES;
}

#pragma mark - Messages View Data Source REQUIRED
-(NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath{
    PFObject *chat = self.chats[indexPath.row];
    NSString *message = chat[@"text"];
    return message;
}

-(NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(UIImageView *)avatarImageViewForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(NSString *)subtitleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
@end
