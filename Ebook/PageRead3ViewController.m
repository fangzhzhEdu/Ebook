//
//  PageRead3ViewController.m
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageRead3ViewController.h"

@interface PageRead3ViewController ()

@end

@implementation PageRead3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [super addHeadBarButton];
 
    // Scroll view
    for (int i=0; i<3; i++) {
        CGRect frame = CGRectMake(scrollView.frame.size.width * i,
                                  0,
                                  scrollView.frame.size.width,
                                  scrollView.frame.size.height);
        UIImageView *imgview = [[UIImageView  alloc] initWithFrame:frame];
        
       [imgview setImage:[UIImage imageNamed: [NSString stringWithFormat:@"p%i" ,i+1]]];
        
//        UILabel *label = [[UILabel alloc] initWithFrame:frame];
//        label.textAlignment = UITextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:144.0];
//        label.text = [NSString stringWithFormat:@"%d", i];
        
        [scrollView addSubview:imgview];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 6, scrollView.frame.size.height);
    
    scrollView.delegate = self;
    
    // Pager
    [pagerView setImage:[UIImage imageNamed:@"a"]
       highlightedImage:[UIImage imageNamed:@"a-h"]
                 forKey:@"a"];
    [pagerView setImage:[UIImage imageNamed:@"b"]
       highlightedImage:[UIImage imageNamed:@"b-h"]
                 forKey:@"b"];
    [pagerView setImage:[UIImage imageNamed:@"c"]
       highlightedImage:[UIImage imageNamed:@"c-h"]
                 forKey:@"c"];
    
    [pagerView setPattern:@"abc"];
    
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
