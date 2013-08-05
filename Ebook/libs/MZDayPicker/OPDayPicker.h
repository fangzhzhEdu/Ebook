//
//  OPDayPicker.h
//  MZDayPickerExample
//
//  Created by ydf on 13-8-3.
//  Copyright (c) 2013年 Michał Zaborowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDayPicker.h"

@interface OPDayPicker : UIView

@property (weak, nonatomic) IBOutlet MZDayPicker *dayPicker;
@property (weak, nonatomic) IBOutlet UILabel *lbMonth;
@property (weak, nonatomic) IBOutlet UIImageView *imgToday;

@property (weak, nonatomic) IBOutlet UIView *leftContainer;
@property (weak, nonatomic) IBOutlet UIView *centerContainer;
@property (weak, nonatomic) IBOutlet UIView *rightContainer;
-(void) test;
@end
