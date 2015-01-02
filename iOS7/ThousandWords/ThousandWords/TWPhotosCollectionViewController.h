//
//  TWPhotosCollectionViewController.h
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWPhotosCollectionViewController : UICollectionViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
