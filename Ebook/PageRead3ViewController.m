//
//  PageRead3ViewController.m
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageRead3ViewController.h"
#import "UIImage+Tint.h"
@interface PageRead3ViewController ()

@end

@implementation PageRead3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [super addHeadBarButton];
 
    // Scroll view
    for (int i=0; i<4; i++) {
        CGRect frame = CGRectMake(scrollView.frame.size.width * i,
                                  0,
                                  scrollView.frame.size.width,
                                  scrollView.frame.size.height);
        UIImageView *imgview = [[UIImageView  alloc] initWithFrame:frame];
        
       [imgview setImage:[UIImage imageNamed: [NSString stringWithFormat:@"a0%i" ,i+1]]];
        
//        UILabel *label = [[UILabel alloc] initWithFrame:frame];
//        label.textAlignment = UITextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:144.0];
//        label.text = [NSString stringWithFormat:@"%d", i];
        
        [scrollView addSubview:imgview];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 4, scrollView.frame.size.height);
    
    scrollView.delegate = self;
    
//    UIColor *grayColor=  [UIColor grayColor];
    // Pager
    [pagerView setImage:[UIImage imageNamed:@"a1"]
       highlightedImage:[UIImage imageNamed:@"a1"]  
                 forKey:@"a"];
    [pagerView setImage:[UIImage imageNamed:@"a2"]
       highlightedImage:[UIImage imageNamed:@"a2"]  
                 forKey:@"b"];
    [pagerView setImage:[UIImage imageNamed:@"a3"]
       highlightedImage:[UIImage imageNamed:@"a3"] 
                 forKey:@"c"];
    [pagerView setImage:[UIImage imageNamed:@"a4"]
       highlightedImage:[UIImage imageNamed:@"a4"]  
                 forKey:@"d"];
    
    [pagerView setPattern:@"abcd"];
    
    pagerView.delegate = self;
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

- (void)viewDidUnload
{
    pagerView = nil;
    scrollView = nil;
    [super viewDidUnload];
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
