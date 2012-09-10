//
//  NSDate+Utility.m
//  CustomSplitView
//
//  Created by UlhasM on 20/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Utility.h"

#define PREVIOUS_DAY -1
#define NEXT_DAY 1
#define WEEKLY_OFFSET -7
#define MONTHLY_OFFSET -1
#define OPTIONS 0

#define API_DATE_FORMAT @"MM/dd/yyyy HH:mm:ss"
#define SHORT_MID_DATE_FORMAT @"MMM dd"
#define DATE_FORMAT @"MM/dd/yyyy"

@implementation NSDate (Utility)

#pragma mark - Misc

- (BOOL)isCurrentDate
{
    NSDate *_date = [NSDate date];
    
    if ([self.stringValue isEqualToString:_date.stringValue])
        return YES;
    
    return NO;
}

#pragma mark - Next & Previous Day

- (NSDate *)previousDay
{
    NSCalendar *_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *_previousDayComponents = [[NSDateComponents alloc] init];
    [_previousDayComponents setDay:PREVIOUS_DAY];
    
    NSDate *_previousDay = [_calendar dateByAddingComponents:_previousDayComponents toDate:self options:OPTIONS];
    [_previousDayComponents release], _previousDayComponents = nil;
    
    return _previousDay;
}

- (NSDate *)nextDay
{
    NSCalendar *_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *_nextDayComponents = [[NSDateComponents alloc] init];
    [_nextDayComponents setDay:NEXT_DAY];
    
    NSDate *_nextDay = [_calendar dateByAddingComponents:_nextDayComponents toDate:self options:OPTIONS];
    [_nextDayComponents release], _nextDayComponents = nil;
    
    return _nextDay;
}

#pragma mark - Seven Days and A Month Prior Dates

- (NSDate *)sevenDaysPriorDate
{
    NSCalendar *_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *_sevenDaysPriorDateComponents = [[NSDateComponents alloc] init];
    [_sevenDaysPriorDateComponents setDay:WEEKLY_OFFSET];
    
    NSDate *_sevenDaysPriorDate = [_calendar dateByAddingComponents:_sevenDaysPriorDateComponents toDate:self options:OPTIONS];
    [_sevenDaysPriorDateComponents release], _sevenDaysPriorDateComponents = nil;
    
    return _sevenDaysPriorDate;
}

- (NSDate *)aMonthPriorDate
{
    NSCalendar *_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *_aMonthPriorDateComponents = [[NSDateComponents alloc] init];
    [_aMonthPriorDateComponents setMonth:MONTHLY_OFFSET];
    
    NSDate *_aMonthPriorDate = [_calendar dateByAddingComponents:_aMonthPriorDateComponents toDate:self options:OPTIONS];
    [_aMonthPriorDateComponents release], _aMonthPriorDateComponents = nil;
    
    return _aMonthPriorDate;
}

#pragma mark - String Value

- (NSString *)stringValue
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    
    NSString *_formattedDateString = [_dateFormatter stringFromDate:self];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _formattedDateString;
}

- (NSString *)shortTimeStringValue
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *_formattedDateString = [_dateFormatter stringFromDate:self];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _formattedDateString;
}

- (NSString *)longStringValue
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateStyle = NSDateFormatterLongStyle;
    
    NSString *_formattedDateString = [_dateFormatter stringFromDate:self];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _formattedDateString;
}

- (NSString *)shortMidStringValue
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = SHORT_MID_DATE_FORMAT;
    
    NSString *_formattedDateString = [_dateFormatter stringFromDate:self];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _formattedDateString;
}

- (NSString *)apiStringValue
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = API_DATE_FORMAT;
    
    NSString *_formattedDateString = [_dateFormatter stringFromDate:self];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _formattedDateString;
}

- (NSString *)modifiedStringValue
{
    NSDate *_todaysDate = [NSDate date];
    
    if ([_todaysDate.stringValue isEqualToString:self.stringValue])
        return TODAY;
    
    else if ([_todaysDate.nextDay.stringValue isEqualToString:self.stringValue])
        return TOMORROW;
    
    else
        return self.stringValue;
}

- (NSString *)shortDateStringValue
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = DATE_FORMAT;
    
    NSString *_formattedDateString = [_dateFormatter stringFromDate:self];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _formattedDateString;
}

#pragma mark - Date Methods

+ (NSDate *)dateFromString:(NSString *)dateString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:API_DATE_FORMAT];
    
    NSDate *_date = [_dateFormatter dateFromString:dateString];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _date;
}

+ (NSDate *)dateFromTimeString:(NSString *)timeString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.timeStyle = NSDateFormatterShortStyle;
    _dateFormatter.timeZone = [NSTimeZone localTimeZone];
    
    NSDate *_date = [_dateFormatter dateFromString:timeString];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _date;
}

+ (NSDate *)dateFromDate:(NSString *)dateString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:DATE_FORMAT];
    
    NSDate *_date = [_dateFormatter dateFromString:dateString];
    [_dateFormatter release], _dateFormatter = nil;
    
    return _date;
}

+ (NSDate *)dateWithCurrentTime
{
    NSDate *date = [NSDate date];
    NSString *dateString = date.shortTimeStringValue;
        
    return [NSDate dateFromTimeString:dateString];
}

@end
