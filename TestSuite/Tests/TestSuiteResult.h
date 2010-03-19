//
//  TestSuiteResult.h
//  HelperKit
//
//  Created by Alex Wayne on 3/19/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestSuiteResult : NSObject {
    NSString *assertion;
    NSString *error;
    BOOL passed;
}

@property (nonatomic, copy) NSString *assertion;
@property (nonatomic, copy) NSString *error;
@property (nonatomic, assign) BOOL passed;

+ (id)resultWithMessage:(NSString*)message;

@end
