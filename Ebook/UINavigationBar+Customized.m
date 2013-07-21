//
//  UINavigationBar+Customized.m
//  Ebook
//
//  Created by ydf on 13-7-21.
//  Copyright (c) 2013年 openkava. All rights reserved.
//
#import "UINavigationBar+Customized.h"


@implementation UINavigationBar (Customized)

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"backgroudbar.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
