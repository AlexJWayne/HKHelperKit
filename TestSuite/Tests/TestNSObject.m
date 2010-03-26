//
//  TestNSObject.m
//  HelperKit
//
//  Created by Alex Wayne on 3/25/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestNSObject.h"


@implementation TestNSObject

- (void)tests {
    [self assert:@"isEqualToAnyOf: should find equality to any of the passed in objects" do:^{
        NSString *string = [NSString stringWithFormat:@"f%@", @"oo"];
        return (BOOL)([string isEqualToAnyOf:@"bar", @"baz", @"foo", @"asdf", nil]);
    }];
    
    [self assert:@"isEqualToAnyOf: should not find equality to any of the passed in objects" do:^{
        NSString *string = @"foo";
        return (BOOL)(![string isEqualToAnyOf:@"bar", @"baz", @"foobar", @"asdf", nil]);
    }];
}

@end
