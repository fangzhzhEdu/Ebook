//
//  BaseViewController.h
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
     }

@property (nonatomic, assign)  NSInteger pageNumber; //当前是第x页
@property (nonatomic, strong)  NSDictionary *thePage;// 当前第x页的内容
@property (nonatomic, strong)  NSString  *storyboardID ;


+(id) initWithStoryBoardID :(NSString*) storyBoardID ;

-(void)addHeadBarButton :(NSString*) leftImage  centerButton:(NSString*) centerImage  rightButton:(NSString*)rightImage;
-(void)addHeadBarButton ;
-(void) leftButtonClick ;
-(void) centerButtonClick ;
-(void) rightButtonClick ;
@end
