//
//  TestNSDate.m
//  HelperKit
//
//  Created by Alex Wayne on 3/15/11.
//  Copyright 2011 Beautiful Pixel. All rights reserved.
//

#import "TestNSDate.h"


@implementation TestNSDate

- (void)tests {
    [self assert:@"stringByFormat: should convert the date to a NSString accoding to the date format" do:^{
        NSString *actual = [[NSDate dateWithTimeIntervalSince1970:0] stringByFormat:@"yyyy MMM, d"];
        return (BOOL)([@"1969 Dec, 31" isEqualToString:actual]);
    }];
}


@end
