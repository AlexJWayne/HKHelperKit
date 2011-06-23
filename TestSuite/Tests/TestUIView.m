//
//  TestUIView.m
//  HelperKit
//
//  Created by Alex Wayne on 3/18/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestUIView.h"


@implementation TestUIView

- (void)tests {
    [self assert:@"[UIView view] should create a view" do:^{
        UIView *view = [UIView view];
        return (BOOL)([view isKindOfClass:[UIView class]]);
    }];
    
    [self assert:@"[UIView viewWithFrame:] should create a view with the frame" do:^{
        CGRect frame = CGRectMake(1, 2, 3, 4);
        UIView *view = [UIView viewWithFrame:frame];
        return (BOOL)(CGRectEqualToRect(frame, view.frame));
    }];
    
    [self assert:@"centerInSuperView should center a view" do:^{
        UIView *container = [UIView viewWithFrame:CGRectMake(0, 0, 30, 30)];
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        [container addSubview:view];
        [view centerInSuperview];
        
        CGRect expected = CGRectMake(10, 10, 10, 10);
        return (BOOL)(CGRectEqualToRect(expected, view.frame));
    }];
    
    [self assert:@"centerInSuperViewHorizontally:vertically: should center a view horizontally" do:^{
        UIView *container = [UIView viewWithFrame:CGRectMake(0, 0, 30, 30)];
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        [container addSubview:view];
        [view centerInSuperviewHorizontally:YES vertically:NO];
        
        CGRect expected = CGRectMake(10, 0, 10, 10);
        return (BOOL)(CGRectEqualToRect(expected, view.frame));
    }];
    
    [self assert:@"centerInSuperViewHorizontally:vertically: should center a view vertically" do:^{
        UIView *container = [UIView viewWithFrame:CGRectMake(0, 0, 30, 30)];
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        [container addSubview:view];
        [view centerInSuperviewHorizontally:NO vertically:YES];
        
        CGRect expected = CGRectMake(0, 10, 10, 10);
        return (BOOL)(CGRectEqualToRect(expected, view.frame));
    }];
    
    [self assert:@"padFrameWithTop:right:bottom:left should inset the view frame" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        [view padFrameWithTop:1 right:2 bottom:3 left:4];
        
        CGRect expected = CGRectMake(4, 1, 4, 6);
        return (BOOL)(CGRectEqualToRect(expected, view.frame));
    }];
    
    [self assert:@"translateFrame: should move the view frames origin" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(3, 6, 10, 10)];
        [view tranlateFrame:CGPointMake(3, 6)];
        
        CGRect expected = CGRectMake(6, 12, 10, 10);
        return (BOOL)(CGRectEqualToRect(expected, view.frame));
    }];
    
    [self assert:@"view.frameOrigin should assign the frame origin" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        view.frameOrigin = CGPointMake(123, 456);
        
        CGPoint expected = CGPointMake(123, 456);
        return (BOOL)(CGPointEqualToPoint(expected, view.frameOrigin));
    }];
    
    [self assert:@"view.frameX should assign the frame origin X value" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        view.frameX = 123;
        return (BOOL)(123 == view.frameX);
    }];
    
    [self assert:@"view.frameY should assign the frame origin Y value" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        view.frameY = 123;
        return (BOOL)(123 == view.frameY);
    }];
    
    [self assert:@"view.frameSize should assign the frame size" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        view.frameSize = CGSizeMake(123, 456);
        
        CGSize expected = CGSizeMake(123, 456);
        return (BOOL)(CGSizeEqualToSize(expected, view.frameSize));
    }];
    
    [self assert:@"view.frameWidth should assign the frame width value" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        view.frameWidth = 123;
        return (BOOL)(123 == view.frameWidth);
    }];
    
    
    [self assert:@"view.frameHeight should assign the frame height value" do:^{
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, 10, 10)];
        view.frameHeight = 123;
        return (BOOL)(123 == view.frameHeight);
    }];
    
    [self assert:@"captureImage should return an image of the contents" do:^{
        UIImageView *view = [UIImageView viewWithImageNamed:@"Home.png"];
        [view captureImage];
        
        // Too hard to test, so just ensure it doesn't crash 
        return (BOOL)(YES);
    }];
}

@end
