//
//  TestNSBundle.m
//  HelperKit
//
//  Created by Alex Wayne on 3/24/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSBundle.h"


@implementation TestNSBundle

- (void)tests {
    NSBundle *bundle = [NSBundle mainBundle];
    
    [self assert:@"[bundle pathForResource:] should return a resource path" do:^{
        return (BOOL)([[bundle pathForResource:@"Home.png" ofType:nil] isEqualToString:[bundle pathForResource:@"Home.png"]]);
    }];
    
    [self assert:@"[bundle urlForResource:] should return a resource file url" do:^{
        NSURL *actual = [bundle urlForResource:@"Home.png"];
        NSURL *expected = [NSURL fileURLWithPath:[bundle pathForResource:@"Home.png"]];
        return (BOOL)([[expected absoluteString] isEqualToString:[actual absoluteString]]);
    }];
    
    [self assert:@"[bundle urlForResource:ofType:] should return a resource file url" do:^{
        NSURL *actual = [bundle urlForResource:@"Home" ofType:@"png"];
        NSURL *expected = [NSURL fileURLWithPath:[bundle pathForResource:@"Home.png"]];
        return (BOOL)([[expected absoluteString] isEqualToString:[actual absoluteString]]);
    }];
}

@end
