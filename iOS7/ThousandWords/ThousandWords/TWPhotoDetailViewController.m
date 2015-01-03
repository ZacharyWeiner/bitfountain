//
//  TWPhotoDetailViewController.m
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import "TWPhotoDetailViewController.h"
#import "Photo.h"

@interface TWPhotoDetailViewController ()
- (IBAction)addFilterPressed:(UIButton *)sender;
- (IBAction)deletePressed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TWPhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.imageView.image = self.photo.image;
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

- (IBAction)addFilterPressed:(id)sender {
}

- (IBAction)deletePressed:(UIButton *)sender {
    [[self.photo managedObjectContext] deleteObject:self.photo];
    NSError *error = nil;
    
    if([[self.photo managedObjectContext] save:&error]){
        NSLog(@"error:%@", error);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
