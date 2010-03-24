//
//  HelperKitAppDelegate.m
//  HelperKit
//
//  Created by Alex Wayne on 2/16/10.
//  Copyright Beautiful Pixel 2010. All rights reserved.
//

#import "HelperKitAppDelegate.h"
#import "RootViewController.h"

#import "HKHelperKit.h"

#import "TestNSBundle.h"
#import "TestNSString.h"
#import "TestNSURL.h"
#import "TestNSURLRequest.h"
#import "TestUIImage.h"
#import "TestUINavigationController.h"
#import "TestUIView.h"


@implementation HelperKitAppDelegate

@synthesize window, navigationController;
@synthesize testResults;



- (void)applicationDidFinishLaunching:(UIApplication *)application {        
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
    
    [self performTests];
}

- (void)dealloc {
	self.navigationController = nil;
	self.window = nil;
    self.testResults = nil;
	[super dealloc];
}


#pragma mark -

- (void)performTests {
    self.testResults = [NSMutableDictionary dictionary];
    
    [TestNSBundle run];
    [TestNSString run];
    [TestNSURL run];
    [TestNSURLRequest run];
    [TestUIImage run];
    [TestUINavigationController run];
    [TestUIView run];
}

@end

