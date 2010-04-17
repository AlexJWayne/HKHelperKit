//
//  NSMutableURLRequest+HelperKit.h
//  HelperKit
//
//  Created by Alex Wayne on 4/15/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableURLRequest (HelperKit)

@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, copy)   NSString *body;
@property (nonatomic, copy)   NSString *httpMethod;
@property (nonatomic, assign) BOOL shouldHandleCookies;
@property (nonatomic, copy)   NSURL *mainDocumentURL;
@property (nonatomic, copy)   NSURL *url;
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

@end
