//
//  PageRead3ViewController.h
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MCPagerView.h"
@interface PageRead3ViewController :  BaseViewController <UIScrollViewDelegate, MCPagerViewDelegate> {
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet MCPagerView *pagerView;
}
+(id) instance ; 



@end
