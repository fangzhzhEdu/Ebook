//
//  OPDayPicker.m
//  MZDayPickerExample
//
//  Created by ydf on 13-8-3.
//  Copyright (c) 2013年 Michał Zaborowski. All rights reserved.
//

#import "OPDayPicker.h"

@implementation OPDayPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"OPDayPicket initWithFrame") ;
    }
    return self;
}
-(void) test
{

    [self.centerContainer setHidden: NO  ];
//
//    CGRect frame = CGRectMake(41, 0, 238, 460);
//    self.centerContainer.frame = frame ;
    [ self printframe : self.leftContainer.frame ];
    [ self printframe : self.centerContainer.frame ];
    [ self printframe : self.rightContainer.frame ];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
//    [super drawRect:rect ] ;
}

*/
-(void)printframe :( CGRect)  frame
{
    NSLog(@"origin: %f %f   size : %f %f  " ,frame.origin.x ,frame.origin.y,frame.size.width ,frame.size.height);
    
    
}
@end
