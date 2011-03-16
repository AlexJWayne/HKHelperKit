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
    [self assert:@"containsString: should return YES for a found string" do:^{
        return (BOOL)[@"foobar" containsString:@"ooba"];
    }];
    
    [self assert:@"containsString: should return NO for an unfound string" do:^{
        return (BOOL)![@"foobar" containsString:@"igloo"];
    }];
    
    [self assert:@"compareCaseInsensitive: should compare case insensitive as preceding 'abc' to 'ZYX'" do:^{
        return (BOOL)([@"abc" compareCaseInsensitive:@"ZYX"] == NSOrderedAscending);
    }];
    
    [self assert:@"isPresent should return NO for nil string" do:^{
        NSString *nilString = nil;
        return (BOOL)![nilString isPresent];
    }];
    
    [self assert:@"isPresent should return NO for empty string" do:^{
        return (BOOL)![@"" isPresent];
    }];
    
    [self assert:@"content string should return YES for isPresent" do:^{
        return (BOOL)[@"yay for me" isPresent];
    }];
    
    [self assert:@"data should create a NSData from a string" do:^{
        NSData *data = [@"I want candy" data];
        return (BOOL)(data != nil && [data isKindOfClass:[NSData class]]);
    }];
    
    [self assert:@"stringWithData: should decode data into a new string" do:^{
        return (BOOL)[[NSString stringWithData:[@"foobar" data]] isEqualToString:@"foobar"];
    }];
    
    [self assert:@"stringByEscapingURL should URL escape a string" do:^{
        return (BOOL)[[@"foo/?a=b" stringByEscapingURL] isEqualToString:@"foo%2F%3Fa%3Db"];
    }];
    
    [self assert:@"stringByPercentEscapingCharacters: should percent escape specific characters" do:^{
        return (BOOL)[[@"foo/?a=b" stringByPercentEscapingCharacters:@"?"] isEqualToString:@"foo/%3Fa=b"];
    }];
    
    [self assert:@"stringByUnescapingURL should unescape percent encoded characters in a string" do:^{
        return (BOOL)[[@"foo%2F%3Fa%3Db" stringByUnescapingURL] isEqualToString:@"foo/?a=b"];
    }];
    
    [self assert:@"dateWithFormat: should parse a string into a date" do:^{
        return (BOOL)[[@"1970 Dec, 31" dateWithFormat:@"yyyy MMM, d"] laterDate:[NSDate dateWithTimeIntervalSince1970:0]];
    }];
    
    [self assert:@"dateWithFormats: should parse a string into a date" do:^{
        NSArray *formats = [NSArray arrayWithObjects:@"yy M, d", @"hh:mm", @"yyyy MMM, d", nil];
        return (BOOL)[[@"1970 Dec, 31" dateWithFormats:formats] laterDate:[NSDate dateWithTimeIntervalSince1970:0]];
    }];
    
    
}

@end
