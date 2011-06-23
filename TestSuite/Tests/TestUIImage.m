//
//  TestUIImage.m
//  HelperKit
//
//  Created by Alex Wayne on 2/17/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestUIImage.h"


@implementation TestUIImage

- (void)tests {
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com/logos/olympics10-xcskiiing2-hp.png"]]];
    
    [self assert:@"should support NSCoding" do:^{
        NSData *encodedData = [NSKeyedArchiver archivedDataWithRootObject:image];
        UIImage *decodedImage = [NSKeyedUnarchiver unarchiveObjectWithData:encodedData];
        return (BOOL)(image.size.width == decodedImage.size.width);
    }];
    
    [self assert:@"imageByResizing: should resize image" do:^{
        return (BOOL)([image imageByResizing:CGSizeMake(50, 50)].size.width == 50);
    }];    
}


@end
