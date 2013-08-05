//
//  JsonUtil.h
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonUtil : NSObject


+ (NSString *) jsonFromDic: (NSDictionary *) dic;

+ (id) getFromJson : (NSString *) fileName ;



@end
