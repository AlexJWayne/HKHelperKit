//
//  TestNSString.m
//  HelperKit
//
//  Created by Alex Wayne on 2/17/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSString.h"


@implementation TestNSString

- (void)tests {
    [self assert:@"should contain string" do:^{
        return (BOOL)[@"foobar" containsString:@"ooba"];
    }];
    
    [self assert:@"should not contain string" do:^{
        return (BOOL)![@"foobar" containsString:@"igloo"];
    }];
    
    [self assert:@"'abc' should start with 'a'" do:^{
        return (BOOL)[@"abc" startsWithString:@"a"];
    }];
    
    [self assert:@"'abc' should not start with 'c'" do:^{
        return (BOOL)![@"abc" startsWithString:@"c"];
    }];
    
    [self assert:@"'abc' should compare case insensitive as preceding 'ZYX'" do:^{
        return (BOOL)([@"abc" compareCaseInsensitive:@"ZYX"] == NSOrderedAscending);
    }];
    
    [self assert:@"nil should return NO for isPresent" do:^{
        NSString *nilString = nil;
        return (BOOL)![nilString isPresent];
    }];
    
    [self assert:@"empty string should return NO for isPresent" do:^{
        return (BOOL)![@"" isPresent];
    }];
    
    [self assert:@"content string should return YES for isPresent" do:^{
        return (BOOL)[@"yay for me" isPresent];
    }];
    
    [self assert:@"should create a NSData from string" do:^{
        NSData *data = [@"I want candy" data];
        return (BOOL)(data != nil && [data isKindOfClass:[NSData class]]);
    }];
    
    [self assert:@"should decode data into string" do:^{
        return (BOOL)[[NSString stringWithData:[@"foobar" data]] isEqualToString:@"foobar"];
    }];
    
    [self assert:@"should URL escape" do:^{
        return (BOOL)[[@"foo/?a=b" stringByEscapingURL] isEqualToString:@"foo%2F%3Fa%3Db"];
    }];
    
    [self assert:@"should percent escape specific characters" do:^{
        return (BOOL)[[@"foo/?a=b" stringByPercentEscapingCharacters:@"?"] isEqualToString:@"foo/%3Fa=b"];
    }];
    
    [self assert:@"should unescape percent encoded characters" do:^{
        return (BOOL)[[@"foo%2F%3Fa%3Db" stringByUnescapingURL] isEqualToString:@"foo/?a=b"];
    }];
    
//    [self assert:@"should escape HTML" do:^{
//        return (BOOL)[[@"<foo>bar</foo>" stringByEscapingHTML] isEqualToString:@"&lt;foo&gt;bar&lt;foo&gt;"];
//    }];
    
}

@end
