//
//  PageType2ViewController.h
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "BaseViewController.h"
#import "MCPagerView.h"
@interface PageType2ViewController : BaseViewController <UIScrollViewDelegate, MCPagerViewDelegate>
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet MCPagerView *pagerView;
}


@end
