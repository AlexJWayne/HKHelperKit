//
//  TestUINavigationController.m
//  HelperKit
//
//  Created by Alex Wayne on 2/23/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "TestUINavigationController.h"


@implementation TestUINavigationController

- (void)tests {
    [self assert:@"property backViewController should be the second to last view controller on the stack" do:^{
        UIViewController *controller1 = [UIViewController controller];
        UIViewController *controller2 = [UIViewController controller];
        
        UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:controller1] autorelease];
        [navController pushViewController:controller2 animated:NO];
        
        return (BOOL)(navController.backViewController == controller1);
    }];
}

@end
