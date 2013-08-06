//
//  UIImageView+DispatchLoad.h
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageView (DispatchLoad)
- (void) setImageFromUrl:(NSString*)urlString;
- (void) setImageFromUrl:(NSString*)urlString
              completion:(void (^)(void))completion;
@end