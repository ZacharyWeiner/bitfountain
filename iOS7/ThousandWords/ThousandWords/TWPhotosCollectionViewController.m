//
//  TWPhotosCollectionViewController.m
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import "TWPhotosCollectionViewController.h"
#import "TWPhotoCollectionViewCell.h"

@interface TWPhotosCollectionViewController ()
@property(strong, nonatomic) NSMutableArray *photos;
@end

@implementation TWPhotosCollectionViewController

static NSString * const reuseIdentifier = @"Photo_Cell";
- (NSMutableArray *)photos
{
    if(!_photos){_photos = [[NSMutableArray alloc] init];}
    return _photos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[TWPhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    [self presentViewController:picker animated:true completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TWPhotoCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = self.photos[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Finished Picking");
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if(!image){
        image = info[UIImagePickerControllerOriginalImage];
    }
    [self.photos addObject:image];
    [self.collectionView reloadData];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"Cancel Clicked");
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
