//
//  PageRead3ViewController.m
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageRead3ViewController.h"
//#import "UIImage+Tint.h"
#import "PopoverView.h"
@interface PageRead3ViewController ()
{
    

}

@end

@implementation PageRead3ViewController

+(id) instance 
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:@"PageRead3ViewController"];
    
}
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
       [imgview setImage:[UIImage imageNamed: @"page-5"]]; 
//       [imgview setImage:[UIImage imageNamed: [NSString stringWithFormat:@"page-3%i" ,i+1]]];
        
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
//    CGPoint offset = CGPointMake(scrollView.frame.size.width * pagerView.page, 0);
//    [scrollView setContentOffset:offset animated:YES];
   
    CGPoint point = CGPointMake(300, 350);
    CGRect frame = CGRectMake(0, 0, 280, 200);
    UIImageView *imageview;
    
    if(pagerView.page ==0)
    {
    
    imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a01"]];
        
        }
    if(pagerView.page ==1)
    {
       imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a02"]];
    }
    if(pagerView.page ==2)
    {
        imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a03"]];
    }
    if(pagerView.page ==3)
    {
       imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a04"]];
    }
    imageview.frame = frame ;
    [PopoverView showPopoverAtPoint:point inView:self.view  withContentView:imageview delegate:nil];
 
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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
