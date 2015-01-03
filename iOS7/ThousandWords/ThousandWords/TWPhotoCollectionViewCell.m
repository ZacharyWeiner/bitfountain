//
//  TWPhotoCollectionViewCell.m
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import "TWPhotoCollectionViewCell.h"



@implementation TWPhotoCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [self initWithCoder:aDecoder];
    if(self){
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.userInteractionEnabled = YES;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGE_VIEW_BORDER_LENGTH, IMAGE_VIEW_BORDER_LENGTH)];
    
    [self.contentView addSubview:self.imageView];
}

@end
