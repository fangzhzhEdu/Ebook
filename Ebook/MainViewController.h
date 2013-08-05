//
//  MainViewController.h
//  Ebook
//
//  Created by ydf on 13-7-17.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IIViewDeckController.h>
#import "MZDayPicker.h"
@interface MainViewController : UIViewController //IIViewDeckController
@property (weak, nonatomic) IBOutlet UIView *pageContainer;
@property (weak, nonatomic) IBOutlet UIView *topbarView;
@property (weak, nonatomic) IBOutlet UIView *daypickerContainer;


@property (weak, nonatomic)  MZDayPicker *dayPicker;
@property (weak, nonatomic)  UILabel    *lbMonth ;



@end
