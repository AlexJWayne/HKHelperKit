//
//  NSURL+HelperKit.h
//  HelperKit
//
//  Created by Alex Wayne on 3/4/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (HelperKit)

@property (nonatomic, readonly) NSDictionary *queryDictionary;
@property (nonatomic, readonly) NSString *host;
@property (nonatomic, readonly) NSString *scheme;
@property (nonatomic, readonly) NSString *fragment;
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) NSString *pathExtension;
@property (nonatomic, readonly) NSArray *pathComponents;
@property (nonatomic, readonly) NSString *lastPathComponent;
@property (nonatomic, readonly) NSNumber *port;
@property (nonatomic, readonly) NSString *query;

@end
