//
//  UMAppDelegate.m
//  DateUtilityTest
//
//  Created by UlhasM on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UMAppDelegate.h"
#import "NSDate+Utility.h"

@interface UMAppDelegate ()

- (void)testDateUtility;

@end

@implementation UMAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self testDateUtility];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark - Misc Methods

- (void)testDateUtility
{
    NSDate *_date = [NSDate date];
    
    NSLog(@"Previous Date : %@", _date.previousDay);
    NSLog(@"Next Day : %@", _date.nextDay);
    NSLog(@"Month Prior : %@", _date.aMonthPriorDate);
    NSLog(@"Seven Days Prior Date : %@", _date.sevenDaysPriorDate);
    
    NSLog(@"String Value : %@", _date.stringValue);
    NSLog(@"API String Value : %@", _date.apiStringValue);
    NSLog(@"Long String Value : %@", _date.longStringValue);
    NSLog(@"Short Date String Value : %@", _date.shortDateStringValue);
    NSLog(@"Short Mid String Value : %@", _date.shortMidStringValue);
    NSLog(@"Short Time Value : %@", _date.shortTimeStringValue);
    
    NSLog(@"Is Current Day : %d", _date.currentDate);
    
    NSDate *_date2 = [NSDate dateFromDate:@"09/10/2012"];
    NSLog(@"String Value for Date2 : %@", _date2.stringValue);
    
    NSDate *_date3 = [NSDate dateFromString:@"09/10/2012 13:00:00"];
    NSLog(@"Long String Value for Date3 : %@", _date3.longStringValue);
    
    NSDate *_date4 = [NSDate dateFromTimeString:@"8:00 PM"];
    NSLog(@"Long string Value for Date4 : %@", _date4.longStringValue);
    
    NSDate *_date5 = [NSDate dateWithCurrentTime];
    NSLog(@"Long String Value for Date5: %@", _date5.longStringValue);
}

@end
