//
//  ViewController.m
//  RaceToTheTop
//
//  Created by Zachary Weiner on 12/23/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

#import "ViewController.h"
#import "RTPathView.h"
#import "RTMountainPath.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet RTPathView *pathView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapGestureRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.pathView addGestureRecognizer:panGestureRecognizer];
}

-(void)tapDetected:(UITapGestureRecognizer *)recognizer{
    NSLog(@"Tapped");
}

-(void)panDetected:(UIPanGestureRecognizer *)recognizer{
    NSLog(@"Panned: X: %f   Y: %f", [recognizer locationInView:self.pathView].x, [recognizer locationInView:self.pathView].y);
    for (UIBezierPath *path in [RTMountainPath mountainPathsForRect:self.pathView.bounds]) {
        UIBezierPath *tapTarget = [RTMountainPath tapTargetForPath:path];
        if ([tapTarget containsPoint:[recognizer locationInView:self.pathView]]) {
            NSLog(@"You Hit The Wall");
        }
    }

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

@end
