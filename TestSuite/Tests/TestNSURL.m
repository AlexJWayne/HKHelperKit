//
//  TestNSURL.m
//  HelperKit
//
//  Created by Alex Wayne on 3/4/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSURL.h"


@implementation TestNSURL

- (void)tests {
    NSURL *url = [NSURL URLWithString:@"http://foobar.com/path?foo=bar&word=some%20thing"];
    
    [self assert:@"should return a dictionary from the query string" do:^{
        NSDictionary *dictionary = [url queryDictionary];
        
        BOOL correctAmount = ([dictionary count] == 2);
        BOOL correctValue1 = [[dictionary objectForKey:@"foo"] isEqualToString:@"bar"];
        BOOL correctValue2 = [[dictionary objectForKey:@"word"] isEqualToString:@"some thing"];
        
        return (BOOL)(correctAmount && correctValue1 && correctValue2);
    }];    
}

@end
