//
//  PageReadAllViewController.h
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPagerView.h"
@interface PageReadAllViewController : UIViewController <UIScrollViewDelegate, MCPagerViewDelegate> 
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet MCPagerView *mcPager; // 不用 
@property (nonatomic, strong) NSArray *bookpages; 

@property (nonatomic, strong) NSMutableArray *viewControllers;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;  // 不用 ;
@property (nonatomic, assign) BOOL isHideHeadBar;
@property (nonatomic, strong) UIView *headBar ;

-(void) refreshHeadBar ;

@end
