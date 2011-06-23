//
//  UIViewController+HelperKit.m
//  HelperKit
//
//  Created by Alex Wayne on 2/23/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import "UIViewController+HelperKit.h"
#import "UIDevice+HelperKit.h"


@implementation UIViewController (HelperKit)

#pragma mark Initializers

+ (id)controller {
    return [self controllerWithNibName:nil bundle:nil];
}

+ (id)controllerWithNibName:(NSString*)nibNameOrNil {
    return [self controllerWithNibName:nibNameOrNil bundle:nil];
}

+ (id)controllerWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)bundle {
    return [[[self alloc] initWithNibName:nibNameOrNil bundle:bundle] autorelease];
}

- (id)initWithNibName:(NSString *)name {
    return [self initWithNibName:name bundle:nil];
}

#pragma mark Animation Helpers

- (void)slideUp {
    self.view.hidden = NO;
    [self animateWithType:kCATransitionMoveIn direction:kCATransitionFromTop];
}

- (void)slideDown {
    [self animateWithType:kCATransitionReveal direction:kCATransitionFromBottom];
    self.view.hidden = YES;
}

- (void)slideIn {
    self.view.hidden = NO;
    [self animateWithType:kCATransitionPush direction:kCATransitionFromRight];
}

- (void)slideOut {
    [self animateWithType:kCATransitionPush direction:kCATransitionFromLeft];
    self.view.hidden = YES;
}

- (void)animateWithType:(NSString*)transition direction:(NSString*)direction {
    CATransition* animation = [CATransition animation];
	animation.type = transition;
	animation.subtype = direction;
	animation.duration = 0.5f;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
	[[self.view layer] addAnimation:animation forKey:nil];
}

@end
