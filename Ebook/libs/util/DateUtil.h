//
//  DateUtil.h
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MONTH_SECONDS -1* 30 *24*60.0 *60.0 
@interface DateUtil :NSObject
+ (void)showMessage :(NSString*) msg title: (NSString*) title  ;
+ (NSInteger) getYear ;                             //2013
+ (NSString*) numberFormatString:(NSString*) input; // 123,32.2335
+ (NSString*) numberFormatNumber:(NSNumber*) input; // 123,32.2335
+ (NSString*) getYearMonth;                         // 201309
+ (NSString*) getYearMonth :(NSDate *)mydate;       // 201305
+ (NSString*) getMonthCN :(NSDate *)mydate ;
+ (void) openWeb: (NSString *) url;
+ (NSString*) getAppVersion;         // 返回当前版本号
+ (NSString*) getDeviceInfo;
+ (BOOL) setPreference:(NSString*) key  value:(NSString*) value;
+ (NSString*) getPreference:(NSString*) key ;

+ (BOOL)    sendOALogin;
+ (BOOL) isEmpty: (id) obj;
+ (BOOL) isStringEmpty: (NSString*) obj;
+ (void)checkNewVersion: (id) alertDelegate showHint:(BOOL) isShow;
+ (UIImage*) loadWebImage:(NSString*) strUrl;
+(void) showChart:(UIViewController*) v :(NSDictionary*) dic;
@end
