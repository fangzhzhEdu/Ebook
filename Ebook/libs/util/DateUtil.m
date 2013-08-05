//
//  DateUtil.m
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil 


+(void)showMessage :(NSString*) msg title: (NSString*) title
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"确认", @"")
                                          otherButtonTitles:nil];
    [alert show];
}

+(NSString*) numberFormatString:(NSString*) input
{
    int i= input.intValue;
    
    return  [NSNumberFormatter localizedStringFromNumber:@(i)
                                             numberStyle:NSNumberFormatterDecimalStyle];
    
}
+(NSString*) numberFormatNumber:(NSNumber*) input
{
    return  [NSNumberFormatter localizedStringFromNumber: input
                                             numberStyle:NSNumberFormatterDecimalStyle];
}

+(NSInteger) getYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger thisyear = [comps year];
    return thisyear;
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

+ (float)  floatFormatString:(NSString*) input
{
    float  i= input.floatValue;
    return i;
}
+ (void) openWeb: (NSString *) url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
}
+(NSString*) getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    return app_Version;
}
+ (NSString*) getDeviceInfo
{
    NSString *content=[[NSString alloc]
                       initWithFormat:
                       @"%@:%@",
                       [[UIDevice currentDevice] systemName],
                       [[UIDevice currentDevice] systemVersion]];
    
    
    NSLog(@"%@",content);
    return content;
}
+ (BOOL) setPreference:(NSString*) key  value:(NSString*) value
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    BOOL r = [defaults synchronize];
    defaults = nil;
    return r;
}
+ (NSString*) getPreference:(NSString*) key
{
    NSString *s;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    @try {
        s= [defaults objectForKey:key];//根据键值取出name
    }
    @catch (NSException *exception) {
        NSLog(@"Error read saved data: %@",key);
        s =@"";
    }
    @finally {
        defaults = nil;
        return s;
    }
    
}
+ (BOOL)    sendOALogin
{
   
    return YES;
}
+ (BOOL) isEmpty: (id) obj
{
    if( obj ==nil || [[NSNull null] isEqual:obj])
        return YES;
    else
        return NO ;
}
+ (BOOL) isStringEmpty: (NSString*) obj
{
    if( obj ==nil || [[NSNull null] isEqual:obj] || [@"" isEqualToString:obj])
        return YES;
    else
        return NO ;
}
+ (void)checkNewVersion:(id) alertDelegate showHint:(BOOL) isShow
{

    
}
+ (UIImage*) loadWebImage:(NSString*) strUrl
{
    UIImage* image=nil;
    
    NSURL* url = [NSURL URLWithString:[strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];//网络图片url
    NSData* data = [NSData dataWithContentsOfURL:url];//获取网咯图片数据
    if(data!=nil){
        
        image = [[UIImage alloc] initWithData:data];//根据图片数据流构造image
        
        return image;
        
    }
    else
        return nil;
    
}

+(void) showChart:(UIViewController*) v :(NSDictionary*) dic
{
    //    NSString *img =  dic[@"Chart"][0][@"Image"];
    //    ImageViewController *v1 = [[ImageViewController alloc] init];
    //    [v1 setImageByBase64String:img];
    //    [v.navigationController pushViewController:v1 animated:YES];
}

@end

