//
//  MUMatchesViewController.m
//  MatchedUp
//
//  Created by Zachary Weiner on 1/4/15.
//  Copyright (c) 2015 com.mostbestawesome. All rights reserved.
//

#import "MUMatchesViewController.h"
#import <Parse/Parse.h>
#import "MUConstants.h"
#import "MUChatViewController.h"
@interface MUMatchesViewController () 
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *availableChatRooms;
@end

@implementation MUMatchesViewController
- (NSMutableArray *)availableChatRooms{
    if(!_availableChatRooms){_availableChatRooms = [NSMutableArray new];}
    return _availableChatRooms;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self updateAvailableChatRooms];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"matchesToChatSegue"]){
        MUChatViewController *chatVC  = segue.destinationViewController;
        NSIndexPath *indexpath = (NSIndexPath *)sender;
        NSNumber *index = (NSNumber *)sender;
        chatVC.chatRoom = [self.availableChatRooms objectAtIndex:[index integerValue]];
    }
}




#pragma mark - Helper Methods
- (void)updateAvailableChatRooms{
    [self.availableChatRooms removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"ChatRoom"];
    [query whereKey:@"user1" equalTo:[PFUser currentUser]];
    [query includeKey:@"chat"];
    [query includeKey:@"user1"];
    [query includeKey:@"user2"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error getting chats for current user. error: %@", error);
            return;
        }
        self.availableChatRooms  = [objects mutableCopy];
        [self.tableView reloadData];
        
        PFQuery *query2 = [PFQuery queryWithClassName:@"ChatRoom"];
        [query2 whereKey:@"user2" equalTo:[PFUser currentUser]];
        [query2 includeKey:@"chat"];
        [query2 includeKey:@"user1"];
        [query2 includeKey:@"user2"];
        [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if(error){
                NSLog(@"Error getting chats for current user. error: %@", error);
                return;
            }
            [self.availableChatRooms addObjectsFromArray:objects];
            [self.tableView reloadData];
        }];
    }];
}

#pragma mark - UITableView 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    PFObject *chatroom = [self.availableChatRooms objectAtIndex:indexPath.row];
    PFUser *likedUser;
    if(((PFUser *)chatroom[@"user1"]).objectId == [PFUser currentUser].objectId){
        likedUser = [chatroom objectForKey:@"user2"];
    }else{
        likedUser =[chatroom objectForKey:@"user1"];
    }
    
    cell.textLabel.text = likedUser[@"profile"][@"firstName"];
    
    // cell.imageview.image = placeholer image
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    PFQuery *queryForPhoto = [PFQuery queryWithClassName:kMUPhotoClassKey];
    [queryForPhoto whereKey:kMUPhotoUserKey equalTo:likedUser];
    [queryForPhoto findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"error getting photo for liked user in cellForRowAtIndexPath of MatchsViewController");
            return;
        }
        if(objects.count > 0){
            PFObject *photo = objects[0];
            PFFile *pictureFile =photo[kMUPhotoPictureKey];
            __block UITableViewCell *blockCell = cell;
            [pictureFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                    //Background Thread
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        blockCell.imageView.image = [UIImage imageWithData:data];
                        blockCell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                        blockCell.detailTextLabel.text = @"";
                    });
                });
                
            }];
        }
    }];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.availableChatRooms.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"matchesToChatSegue" sender:[NSNumber numberWithLong:indexPath.row]];
}
@end
