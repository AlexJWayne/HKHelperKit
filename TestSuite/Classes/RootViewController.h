//
//  RootViewController.h
//  HelperKit
//
//  Created by Alex Wayne on 2/16/10.
//  Copyright Beautiful Pixel 2010. All rights reserved.
//

@interface RootViewController : UITableViewController {
    NSDictionary *results;
    NSArray *sectionNames;
}

@property (nonatomic, retain) NSDictionary *results;
@property (nonatomic, retain) NSArray *sectionNames;

@end
