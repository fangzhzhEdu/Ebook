//
//  BaseViewController.h
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)addHeadBarButton :(NSString*) leftImage  centerButton:(NSString*) centerImage  rightButton:(NSString*)rightImage;
-(void)addHeadBarButton ;
-(void) leftButtonClick ;
-(void) centerButtonClick ;
-(void) rightButtonClick ;
@end
