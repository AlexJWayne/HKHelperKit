//
//  TestNSURLRequest.m
//  HelperKit
//
//  Created by Alex Wayne on 3/20/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSURLRequest.h"


@implementation TestNSURLRequest

- (void)tests {
    [self assert:@"[NSURLRequest requestWithURLString:] should create a new request from a string" do:^{
        NSURLRequest *req = [NSURLRequest requestWithURLString:@"http://google.com"];
        return (BOOL)([[req URL] isEqual:[NSURL URLWithString:@"http://google.com"]]);
    }];    
}

@end
