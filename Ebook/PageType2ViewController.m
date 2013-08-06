//
//  PageType2ViewController.m
//  Ebook
//
//  Created by ydf on 13-8-6.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageType2ViewController.h"
#import <QuartzCore/QuartzCore.h> 

@interface PageType2ViewController ()

@end

@implementation PageType2ViewController

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
 
    
}
-(void)initPage
{
    // Scroll view
    for (int i=0; i<3; i++) {
        CGRect frame = CGRectMake(scrollView.frame.size.width * i,
                                  0,
                                  scrollView.frame.size.width,
                                  scrollView.frame.size.height);
        UIImageView *imgview = [[UIImageView  alloc] initWithFrame:frame];
        
        [imgview setImage:[UIImage imageNamed: [NSString stringWithFormat:@"b%i" ,i+1]]];
        
        //        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        //        label.textAlignment = UITextAlignmentCenter;
        //        label.font = [UIFont systemFontOfSize:144.0];
        //        label.text = [NSString stringWithFormat:@"%d", i];
        
        [scrollView addSubview:imgview];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 3, scrollView.frame.size.height);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.scrollEnabled = YES;
    
    scrollView.pagingEnabled = YES;//使用翻页属性
    
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor grayColor];
    
    // Pager
    [pagerView setImage:[UIImage imageNamed:@"pager-12"]
       highlightedImage:[UIImage imageNamed:@"pager-red12"]
                 forKey:@"a"];
    [pagerView setImage:[UIImage imageNamed:@"pager-12"]
       highlightedImage:[UIImage imageNamed:@"pager-red12"]
                 forKey:@"b"];
    [pagerView setImage:[UIImage imageNamed:@"pager-12"]
       highlightedImage:[UIImage imageNamed:@"pager-red12"]
                 forKey:@"c"];
    
    [pagerView setPattern:@"abc"];
    
    pagerView.delegate = self;
    
    pagerView.frame = CGRectMake(self.view.frame.size.width/2-10, self.view.frame.size.height - 50, 100, 50);
    
    [self.view bringSubviewToFront: pagerView];
    self.view.layer.cornerRadius= 10;
    
    self.view.layer.masksToBounds = YES;
    self.view.layer.borderWidth =2.0;
    self.view.layer.borderColor = [UIColor whiteColor].CGColor;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
