//
//  NSDate+HelperKit.m
//  HelperKit
//
//  Created by Alex Wayne on 3/15/11.
//  Copyright 2011 Beautiful Pixel. All rights reserved.
//

#import "NSDate+HelperKit.h"


@implementation NSDate (HelperKit)

- (NSString *)stringByFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:self];
}

@end
