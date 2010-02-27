//
//  UIViewController+HelperKit.h
//  HelperKit
//
//  Created by Alex Wayne on 2/23/10.
//  Copyright 2010 Beautiful Pixel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (HelperKit)

#pragma mark Initializers

+ (id)controller;
+ (id)controllerWithNib; // Creates controller with a nib named same as the class: "FooController" would load "FooController.xib"
+ (id)controllerWithNibName:(NSString*)nibName;
+ (id)controllerWithNibName:(NSString*)nibName bundle:(NSBundle*)bundle;

- (id)initWithNibName:(NSString *)nibName;
- (id)initWithNib; // Instance version of the controllerWithNib method

@end
