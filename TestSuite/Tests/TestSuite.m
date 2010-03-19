//
//  TestSuite.m
//  HelperKit
//
//  Created by Alex Wayne on 2/17/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestSuite.h"
#import "HelperKitAppDelegate.h"

@implementation TestSuite

- (NSString*)context {
    NSString *className = [NSString stringWithCString:object_getClassName([self class])];
    return [className stringByReplacingOccurrencesOfString:@"Test" withString:@""];
}

+ (void)run {
    TestSuite *suite = [[[self alloc] init] autorelease];
    HelperKitAppDelegate* appDelegate = (HelperKitAppDelegate*)[UIApplication sharedApplication].delegate;
    NSMutableDictionary *testResults = appDelegate.testResults;
    
    if (![testResults objectForKey:[suite context]]) {
        [testResults setObject:[NSMutableArray array]
                        forKey:[suite context]];
    }
    
    [suite tests];
}

- (void)assert:(NSString*)message do:(BOOL(^)())block {
    HelperKitAppDelegate* appDelegate = (HelperKitAppDelegate*)[UIApplication sharedApplication].delegate;
    NSMutableDictionary *testResults = appDelegate.testResults;
    NSMutableArray *resultArray = [testResults objectForKey:[self context]];
    TestSuiteResult *result = [TestSuiteResult resultWithMessage:message];
    [resultArray addObject:result];
    
    @try {
        result.passed = block();
    }
    @catch (NSException *exception) {
        result.passed = NO;
        result.error = [exception description];
    }
}

- (void)tests {
    [NSException raise:@"Not implemented" format:@"Must be overridden"]; 
}

@end
