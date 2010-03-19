//
//  TestSuite.h
//  HelperKit
//
//  Created by Alex Wayne on 2/17/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKHelperKit.h"
#import "TestSuiteResult.h"

@interface TestSuite : NSObject {

}

+ (void)run;

- (NSString*)context;
- (void)assert:(NSString*)message do:(BOOL(^)())block;

- (void)tests;


@end
