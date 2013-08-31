//
//  DateUtil.m
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil 





+(NSInteger) getYear
{
    return [DateUtil getDateYMD: 3];
}
+(NSInteger) getMonth
{
   return [DateUtil getDateYMD: 2];}
+(NSInteger) getDay
{
    
    return [DateUtil getDateYMD: 1];
}

+(NSInteger) getDateYMD: (NSInteger) type
{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSInteger r = 0 ;
    comps = [calendar components:unitFlags fromDate:now];
    switch (type) {
        case 1:
            r = [comps day] ;
            break;
        case 2:
            r = [comps month] ;
            break;
        case 3:
            r=  [comps year ] ;
            break;
        default:
            break;
    }
    return r ;
    
}
+(NSString*) getMonthCN :(NSDate *)mydate
{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:mydate];
    
    int month =[comps month];
    NSString *r ;
    switch (month) {
        case 1 :   r = @"一" ; break;
        case 2 :   r = @"二" ; break;
        case 3 :   r = @"三" ; break;
        case 4 :   r = @"四" ; break;
        case 5 :   r = @"五" ; break;
        case 6 :   r = @"六" ; break;
        case 7 :   r = @"七" ; break;
        case 8:   r = @"八" ; break;
        case 9 :   r = @"九" ; break;
        case 10 :   r = @"十" ; break;
        case 11:   r = @"十一" ; break;
        case 12:   r = @"十二" ; break;
        default:
            r=@"" ;
            break;
    }
   
    
    
    return r ; // @"201212" ;
    
}

+(NSString*) getYearMonth
{
    NSDate *now = [[NSDate date] dateByAddingTimeInterval: MONTH_SECONDS];
    return  [ DateUtil getYearMonth:  now ];
    
}
+(NSString*) getYearMonth :(NSDate *)mydate
{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:mydate];
    
    int month =[comps month];
    NSString *strMonth;
    if( month <10)
        strMonth = [NSString stringWithFormat:@"0%d" ,month];
    else
        strMonth = [NSString stringWithFormat:@"%d" ,month];
    
    
    NSString *r = [NSString stringWithFormat:@"%d%@" ,[comps year] ,strMonth];
    
    
    return r ; // @"201212" ;
    
}

@end

