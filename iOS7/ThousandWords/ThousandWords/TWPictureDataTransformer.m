//
//  TWPictureDataTransformer.m
//  ThousandWords
//
//  Created by Zachary Weiner on 1/2/15.
//  Copyright (c) 2015 zachary.weiner. All rights reserved.
//

#import "TWPictureDataTransformer.h"

@implementation TWPictureDataTransformer
- (Class)transformedValueClass
{
    return [NSData class];
}

- (BOOL)allowsReververseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}

- (id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageWithData:value];
    return image;
}
@end
