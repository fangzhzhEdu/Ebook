//
//  UIImage+Scale.h
//  galaxy
//
//  Created by yangdengfeng on 13-2-5.
//  Copyright (c) 2013年 itoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)
-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;
@end
 
 