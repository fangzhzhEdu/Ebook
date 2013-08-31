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
+ (NSInteger) getYear ;                             //2013
+ (NSInteger) getMonth ;
+ (NSInteger) getDay ;
+ (NSInteger) getDateYMD: (NSInteger) type;
+ (NSString*) getYearMonth;                         // 201309
+ (NSString*) getYearMonth :(NSDate *)mydate;       // 201305
+ (NSString*) getMonthCN :(NSDate *)mydate ;

@end
