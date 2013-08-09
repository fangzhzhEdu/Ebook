//
//  App.h
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property (nonatomic, assign) BOOL isHideHeadBar;

@property (nonatomic, strong) NSArray *theRecommendPages;// 日历对应推荐页面



+ (App *) sharedInstance;


@end
