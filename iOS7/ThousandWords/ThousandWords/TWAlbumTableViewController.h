//
//  TWAlbumTableViewController.h
//  ThousandWords
//
//  Created by Zachary Weiner on 12/25/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWAlbumTableViewController : UITableViewController <UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *albums;
@end
