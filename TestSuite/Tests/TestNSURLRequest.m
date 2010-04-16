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
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURLString:@"http://google.com"];
    
    [self assert:@"[NSURLRequest requestWithURLString:] should create a new request from a string" do:^{
        NSURLRequest *request = [NSURLRequest requestWithURLString:@"http://google.com"];
        return (BOOL)([[request URL] isEqual:[NSURL URLWithString:@"http://google.com"]]);
    }];
    
    [self assert:@"cachePolicy should be a property" do:^{
        [req setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
        NSURLRequestCachePolicy expected = [req cachePolicy];
        return (BOOL)(expected == req.cachePolicy);
    }];
    
    [self assert:@"requestBody should be a property" do:^{
        [req setHTTPBody:[@"foobar" data]];
        return (BOOL)([req.body isEqualToString:@"foobar"]);
    }];
    
    [self assert:@"httpMethod should be a property" do:^{
        [req setHTTPMethod:@"POST"];
        return (BOOL)([req.httpMethod isEqualToString:@"POST"]);
    }];
    
    [self assert:@"shouldHandleCookies should be a property" do:^{
        [req setHTTPShouldHandleCookies:NO];
        return (BOOL)(!req.shouldHandleCookies);
    }];
    
    [self assert:@"url should be a property" do:^{
        NSString *expected = [[NSURL URLWithString:@"http://google.com"] absoluteString];
        NSString *actual = [req.url absoluteString];
        return (BOOL)([expected isEqualToString:actual]);
    }];
    
    [self assert:@"timeoutInterval should be a property" do:^{
        int expected = [req timeoutInterval];
        int actual = req.timeoutInterval;
        return (BOOL)(expected == actual);
    }];    
}

@end
