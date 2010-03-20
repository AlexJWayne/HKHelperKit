//
//  RootViewController.m
//  HelperKit
//
//  Created by Alex Wayne on 2/16/10.
//  Copyright Beautiful Pixel 2010. All rights reserved.
//

#import "RootViewController.h"
#import "HKHelperKit.h"
#import "HelperKitAppDelegate.h"
#import "TestSuiteResult.h"

@implementation RootViewController

@synthesize results, sectionNames;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Test Results";
    
    HelperKitAppDelegate *appDelegate = (HelperKitAppDelegate*)[UIApplication sharedApplication].delegate;
    self.results = appDelegate.testResults;
    self.sectionNames = [[results allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [results count]+1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    
    NSString *sectionName = [sectionNames objectAtIndex:section-1];
    return [[results objectForKey:sectionName] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) return nil;
    return [sectionNames objectAtIndex:section-1];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.font = [UIFont boldSystemFontOfSize:11];
        cell.textLabel.numberOfLines = 2;
        
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:10];
        cell.detailTextLabel.numberOfLines = 2;
        cell.detailTextLabel.textColor = [UIColor whiteColor];
    }
    
    if (indexPath.section == 0) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil] autorelease];
        cell.detailTextLabel.text = nil;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        
        int pass, fail, error;
        pass = fail = error = 0;
        
        for (NSString *key in [results allKeys]) {
            for (TestSuiteResult *result in [results objectForKey:key]) {
                if (result.passed) {
                    pass++;
                } else if (result.error) {
                    error++;
                } else {
                    fail++;
                }
            }
        }
        
        if (fail > 0 || error > 0) {
            cell.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
        } else {
            cell.backgroundColor = [UIColor colorWithRed:0 green:0.75 blue:0 alpha:1.0];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%d successes\n%d failures, %d errors", pass, fail, error];
        
    } else {
        NSString *sectionName = [sectionNames objectAtIndex:indexPath.section-1];
        TestSuiteResult *result = [[results objectForKey:sectionName] objectAtIndex:indexPath.row];
        
        cell.textLabel.text = result.assertion;
        cell.detailTextLabel.text = result.error;
        
        if (result.passed) {
            cell.backgroundColor = [UIColor whiteColor];
        } else if (result.error) {
            cell.backgroundColor = [UIColor redColor];
        } else {
            cell.backgroundColor = [UIColor yellowColor];
        }
    }    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) return 60;
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    if ([cell.backgroundColor isEqual:[UIColor whiteColor]]) {
        return 40;
    } else {
        return 60;
    }
}

- (void)dealloc {
    self.results = nil;
    self.sectionNames = nil;
    [super dealloc];
}


@end

