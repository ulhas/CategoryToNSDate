//
//  NSDate+Utility.h
//  CustomSplitView
//
//  Created by UlhasM on 20/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TODAY @"Today"
#define TOMORROW @"Tomorrow"

@interface NSDate (Utility)

@property (nonatomic, readonly) NSString *stringValue; // eg: Jan 12, 1952"
@property (nonatomic, readonly) NSString *shortMidStringValue; //eg: JAN 20
@property (nonatomic, readonly) NSString *longStringValue; //eg: January 12, 1952
@property (nonatomic, readonly) NSString *shortTimeStringValue; //eg: 07:00 PM
@property (nonatomic, readonly) NSString *apiStringValue; //eg : 12/21/2012 20:10:55
@property (nonatomic, readonly) NSString *shortDateStringValue; // eg: 12/21/2012

@property (nonatomic, readonly) NSString *modifiedStringValue; // same as string value but shows today and tomm

@property (nonatomic, readonly) NSDate *previousDay;
@property (nonatomic, readonly) NSDate *nextDay;
@property (nonatomic, readonly) NSDate *sevenDaysPriorDate;
@property (nonatomic, readonly) NSDate *aMonthPriorDate;

@property (nonatomic, readonly, getter = isCurrentDate) BOOL currentDate;

+ (NSDate *)dateFromString:(NSString *)dateString; //eg : 12/21/2012 20:10:55
+ (NSDate *)dateFromTimeString:(NSString *)timeString; //eg: 07:00 PM
+ (NSDate *)dateFromDate:(NSString *)dateString; // eg: 12/21/2012
+ (NSDate *)dateWithCurrentTime;

@end
