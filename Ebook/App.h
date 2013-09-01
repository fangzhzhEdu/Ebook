//
//  App.h
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetDataPost.h"
#import "EUser.h"

#define  appInstance [App sharedInstance]


@interface App : NSObject

@property (nonatomic, assign) BOOL isHideHeadBar;

@property (nonatomic, strong) NSArray *theRecommendPages;// 日历对应推荐页面

@property (strong, nonatomic) NetDataPost *netDataPost ;
@property (strong, nonatomic) NSString *requestKey ;
@property (strong ,nonatomic) NSDictionary *returnJsonData;
@property (strong ,nonatomic) EUser *user ;
@property(strong,nonatomic) NSString *updateUrl;
@property (strong ,nonatomic) NSDate *lastCheckUpdateDT;


+ (App *) sharedInstance;


@end
