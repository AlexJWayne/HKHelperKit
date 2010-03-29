//
//  TestUIImageView.m
//  HelperKit
//
//  Created by Alex Wayne on 3/25/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestUIImageView.h"


@implementation TestUIImageView

- (void)tests {
    UIImage *image = [UIImage imageNamed:@"Home.png"];
    
    [self assert:@"[UIImageView viewWithImage:] should create an image view" do:^{
        UIImageView *view = [UIImageView viewWithImage:image];
        return (BOOL)(view.image == image);
    }];
    
    [self assert:@"[UIImageView viewWithImageNamed:] should create an image view" do:^{
        UIImageView *view = [UIImageView viewWithImageNamed:@"Home.png"];
        return (BOOL)(view.image == image);
    }];
    
    [self assert:@"[UIImageView viewWithImageURL:] should create an image view" do:^{
        UIImageView *view = [UIImageView viewWithImageURL:[[NSBundle mainBundle] urlForResource:@"Home.png"]];        
        return (BOOL)(CGSizeEqualToSize(image.size, view.image.size));
    }];
    
    [self assert:@"[UIImageView viewWithImageURLString:] should create an image view" do:^{
        NSString *urlString = [[[NSBundle mainBundle] urlForResource:@"Home.png"] absoluteString];
        UIImageView *view = [UIImageView viewWithImageURLString:urlString];
        return (BOOL)(CGSizeEqualToSize(image.size, view.image.size));
    }];
}

@end
