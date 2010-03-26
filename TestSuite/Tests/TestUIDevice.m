//
//  TestUIDevice.m
//  HelperKit
//
//  Created by Alex Wayne on 3/25/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestUIDevice.h"


@implementation TestUIDevice

- (void)tests {
    [self assert:@"property screenTypeString should return iPhone or iPad" do:^{
        NSString *actual = [UIDevice currentDevice].screenTypeString;
        return (BOOL)([@"iPhone" isEqualToString:actual] || [@"iPad" isEqualToString:actual]);
    }];
}

@end
