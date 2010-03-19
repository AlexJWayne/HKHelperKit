//
//  TestSuiteResult.m
//  HelperKit
//
//  Created by Alex Wayne on 3/19/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestSuiteResult.h"


@implementation TestSuiteResult

@synthesize assertion, error, passed;

+ (id)resultWithMessage:(NSString*)message {
    TestSuiteResult *result = [[[self alloc] init] autorelease];
    result.assertion = message;
    return result;
}

- (id)init {
    if (self = [super init]) {
        self.assertion = nil;
        self.error = nil;
        self.passed = NO;
    }
    return self;
}

- (void)dealloc {
    self.assertion = nil;
    self.error = nil;
    [super dealloc];
}

@end
