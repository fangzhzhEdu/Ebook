//
//  PageRead2ViewController.h
//  Ebook
//
//  Created by ydf on 13-7-30.
//  Copyright (c) 2013年 openkava. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MCPagerView.h"
@interface PageRead2ViewController :  BaseViewController <UIScrollViewDelegate, MCPagerViewDelegate> {
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet MCPagerView *pagerView;
}

@end