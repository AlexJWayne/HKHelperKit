//
//  TestNSDictionary.m
//  HelperKit
//
//  Created by Alex Wayne on 3/24/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSDictionary.h"


@implementation TestNSDictionary

- (void)tests {
    [self assert:@"boolForKey: should return a BOOL" do:^{
        NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:@"BOOL"];
        return (BOOL)([dict boolForKey:@"BOOL"] == YES);
    }];
    
    [self assert:@"integerForKey: should return an int" do:^{
        NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:321] forKey:@"int"];
        return (BOOL)([dict integerForKey:@"int"] == 321);
    }];
    
    [self assert:@"floatForKey: should return a float" do:^{
        NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:3.21] forKey:@"float"];
        return (BOOL)([dict floatForKey:@"float"] == [[NSNumber numberWithFloat:3.21] floatValue]);
    }];
}

@end
