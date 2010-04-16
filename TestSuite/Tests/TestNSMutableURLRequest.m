//
//  TestNSMutableURLRequest.m
//  HelperKit
//
//  Created by Alex Wayne on 4/15/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSMutableURLRequest.h"


@implementation TestNSMutableURLRequest

- (void)tests {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURLString:@"http://google.com"];
    
    [self assert:@"cachePolicy should be a settable property" do:^{
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        return (BOOL)(request.cachePolicy == NSURLRequestReloadIgnoringLocalCacheData);
    }];
    
    [self assert:@"body should be a settable property" do:^{
        request.body = @"this=is&a=test";
        return (BOOL)([request.body isEqualToString:@"this=is&a=test"]);
    }];
    
    [self assert:@"httpMethod should be a settable property" do:^{
        request.httpMethod = @"DELETE";
        return (BOOL)([request.httpMethod isEqualToString:@"DELETE"]);
    }];
    
    [self assert:@"shouldHandleCookies should be a settable property" do:^{
        request.shouldHandleCookies = NO;
        return (BOOL)(!request.shouldHandleCookies);
    }];
    
    [self assert:@"mainDocumentURL should be a settable property" do:^{
        request.mainDocumentURL = [NSURL URLWithString:@"http://apple.com"];
        return (BOOL)([[request.mainDocumentURL host] isEqualToString:@"apple.com"]);
    }];
    
    [self assert:@"url should be a settable property" do:^{
        request.url = [NSURL URLWithString:@"http://yahoo.com"];
        return (BOOL)([[request.url host] isEqualToString:@"yahoo.com"]);
    }];
}

@end
