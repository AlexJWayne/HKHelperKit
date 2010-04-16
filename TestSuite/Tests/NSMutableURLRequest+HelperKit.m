//
//  NSMutableURLRequest+HelperKit.m
//  HelperKit
//
//  Created by Alex Wayne on 4/15/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "NSMutableURLRequest+HelperKit.h"

#import "NSString+HelperKit.h"

@implementation NSMutableURLRequest (HelperKit)

@dynamic cachePolicy, mainDocumentURL, timeoutInterval;
@dynamic body, httpMethod, shouldHandleCookies, url;


- (void)setBody:(NSString*)newBody {
    [self setHTTPBody:[newBody data]];
}

- (void)setHttpMethod:(NSString*)newMethod {
    [self setHTTPMethod:newMethod];
}

- (void)setShouldHandleCookies:(BOOL)newValue {
    return [self setHTTPShouldHandleCookies:newValue];
}

- (void)setUrl:(NSURL*)newURL {
    [self setURL:newURL];
}

@end
