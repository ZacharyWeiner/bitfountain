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

#define RTMAP_STARTING_SCORE 15000
#define RTMAP_SCORE_DECREMENT_AMOUNT 100
#define RTTIME_INTERVAL 0.1
#define RTWALL_PENALTY 500

@interface ViewController ()
@property (weak, nonatomic) IBOutlet RTPathView *pathView;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
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
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:RTTIME_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", RTMAP_STARTING_SCORE];
}

- (void)timerFired{
    [self decrementScoreByAmount:RTMAP_SCORE_DECREMENT_AMOUNT];
}

- (void)tapDetected:(UITapGestureRecognizer *)recognizer{
    NSLog(@"Tapped");
}

-(void)panDetected:(UIPanGestureRecognizer *)recognizer{
    NSLog(@"Panned: X: %f   Y: %f", [recognizer locationInView:self.pathView].x, [recognizer locationInView:self.pathView].y);
    if(recognizer.state == UIGestureRecognizerStateBegan && [recognizer locationInView:self.pathView].y > 750){
        self.timer = [NSTimer scheduledTimerWithTimeInterval:RTTIME_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", RTMAP_STARTING_SCORE];
    }else if(recognizer.state == UIGestureRecognizerStateChanged){
        for (UIBezierPath *path in [RTMountainPath mountainPathsForRect:self.pathView.bounds]) {
            UIBezierPath *tapTarget = [RTMountainPath tapTargetForPath:path];
            if ([tapTarget containsPoint:[recognizer locationInView:self.pathView]]) {
                //NSLog(@"You Hit The Wall");
                [self decrementScoreByAmount:RTWALL_PENALTY];
            }
        }
    }else if (recognizer.state == UIGestureRecognizerStateEnded && [recognizer locationInView:self.pathView].y >= 165){
        [self.timer invalidate];
        self.timer = nil;
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please start at the bottom of the path" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        [self.timer invalidate];
        self.timer = nil;
        
    }
}

- (void)decrementScoreByAmount:(int)amount{
    NSString *scoreText = [[self.scoreLabel.text componentsSeparatedByString:@" "] lastObject];
    int score = [scoreText integerValue];
    
    score -= amount;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", score];
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
