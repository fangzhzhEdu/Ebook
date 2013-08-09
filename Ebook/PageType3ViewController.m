//
//  PageType2ViewController.m
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageType3ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Tint.h"
#import "PopoverView.h" 
#import "App.h"
@interface PageType3ViewController ()

@end

@implementation PageType3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initPage] ;
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [self setHideHeadBar:YES];

     NSLog(@"page type3   will appear");
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [self setHideHeadBar:YES];
    NSLog(@"page type3 did  appear");
}
-(void)initPage
{
  
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width ,self.view.frame.size.height-100);
    pagerView.frame = CGRectMake(10, self.view.frame.size.height - 80, 320, 60);
    
    for (int i=0; i<4; i++) {
        CGRect frame = CGRectMake(scrollView.frame.size.width * i,
                                  0,
                                  scrollView.frame.size.width,
                                  scrollView.frame.size.height);
        UIImageView *imgview = [[UIImageView  alloc] initWithFrame:frame];
//      [imgview setImage:[UIImage imageNamed: @"a01"]];
        [imgview setImage:[UIImage imageNamed: [NSString stringWithFormat:@"a0%i" ,i+1]]];
        
        //        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        //        label.textAlignment = UITextAlignmentCenter;
        //        label.font = [UIFont systemFontOfSize:144.0];
        //        label.text = [NSString stringWithFormat:@"%d", i];
        
        [scrollView addSubview:imgview];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 4, scrollView.frame.size.height);
    
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;//使用翻页属性
    scrollView.scrollEnabled = YES; 
    scrollView.bounces = NO;
 
    scrollView.delegate = self;
    scrollView.backgroundColor =[UIColor clearColor] ;
    scrollView.layer.cornerRadius =10;
    scrollView.layer.masksToBounds =YES ;
    scrollView.layer.borderWidth = 2.0 ;
    scrollView.layer.borderColor = [UIColor whiteColor].CGColor ;
    // Pager
    [pagerView setImage:[UIImage imageNamed:@"pager1"]
       highlightedImage:[UIImage imageNamed:@"pager1-red"]
                 forKey:@"a"];
    [pagerView setImage:[UIImage imageNamed:@"pager2"]
       highlightedImage:[UIImage imageNamed:@"pager2-red"]
                 forKey:@"b"];
    [pagerView setImage:[UIImage imageNamed:@"pager3"]
       highlightedImage:[UIImage imageNamed:@"pager3-red"]
                 forKey:@"c"];
    [pagerView setImage:[UIImage imageNamed:@"pager4"]
       highlightedImage:[UIImage imageNamed:@"pager4-red"]
                 forKey:@"d"];
    
    [pagerView setPattern:@"abcd"];
    pagerView.delegate = self;
    pagerView.backgroundColor = [UIColor clearColor] ;
    
    
    [self.view bringSubviewToFront: pagerView];
    self.view.backgroundColor = [UIColor clearColor] ;
//    self.view.layer.cornerRadius= 10;
//    self.view.layer.masksToBounds = YES;
//    self.view.layer.borderWidth =2.0;
//    self.view.layer.borderColor = [UIColor whiteColor].CGColor;
}
- (void)updatePager
{
    pagerView.page = floorf(scrollView.contentOffset.x / scrollView.frame.size.width);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updatePager];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self updatePager];
    }
}

- (void)pageView:(MCPagerView *)pageView didUpdateToPage:(NSInteger)newPage
{
    CGPoint offset = CGPointMake(scrollView.frame.size.width * pagerView.page, 0);
    [scrollView setContentOffset:offset animated:YES];
    
    
//    CGPoint point = CGPointMake(300, 350);
//    CGRect frame = CGRectMake(0, 0, 280, 200);
//    UIImageView *imageview;
    
//    if(pagerView.page ==0)
//    {
//        
//        imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a01"]];
//        
//    }
//    if(pagerView.page ==1)
//    {
//        imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a02"]];
//    }
//    if(pagerView.page ==2)
//    {
//        imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a03"]];
//    }
//    if(pagerView.page ==3)
//    {
//        imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a04"]];
//    }
//    imageview.frame = frame ;
//    [PopoverView showPopoverAtPoint:point inView:self.view  withContentView:imageview delegate:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

