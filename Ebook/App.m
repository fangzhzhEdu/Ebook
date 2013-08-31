//
//  App.m
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava@gmail.com. All rights reserved.
//

#import "App.h"
#import "JsonUtil.h"
static  App *sharedObj = nil; //第一步：静态实例，并初始化。

@implementation App
+ (App *) sharedInstance  //第二步：实例构造检查静态实例是否为nil
{
    @synchronized (self)
    {
        if (sharedObj == nil)
        {
            sharedObj=  [[self alloc] init];
            sharedObj.isHideHeadBar =NO ;
            
            [sharedObj loadRecommendPages];
            
//            sharedObj.netDataPost = [[NetDataPost alloc] initWithHostName:SERVER customHeaderFields:nil];
//            [sharedObj.netDataPost useCache];
//            
            
            
        }
    }
    return sharedObj;
}

+ (id) allocWithZone:(NSZone *)zone //第三步：重写allocWithZone方法
{
    @synchronized (self) {
        if (sharedObj == nil) {
            sharedObj = [super allocWithZone:zone];
            return sharedObj;
        }
    }
    return nil;
}

- (id) copyWithZone:(NSZone *)zone //第四步
{
    return self;
}

-(void) loadRecommendPages
{
    
    
    id  dic = [JsonUtil getFromJson:@"list1" ] ;
    
    self.theRecommendPages  =dic[@"pages"];
    
    
    
    NSLog(@"the recommend pages is :%i " , self.theRecommendPages.count  ) ;
    
}



@end
