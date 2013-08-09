//
//  PageReadAllViewController.m
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageReadAllViewController.h"
#include "JsonUtil.h"
#include "PageRead2ViewController.h"
#include "PageRead3ViewController.h"
#include "PageReadViewController.h" 
#include "PageType1ViewController.h"
@interface PageReadAllViewController ()
{

    NSArray *pages  ;
    NSDictionary *book ;
    
    
}
@end

@implementation PageReadAllViewController

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
    
    [self.navigationController.navigationBar setHidden: YES ] ;
     
    
    [self loadBookData];
    
    [self initScrollView];
    
//    [self initi];
    
}
-(void) loadBookData
{
    
    
    id  dic = [JsonUtil getFromJson:@"book1" ] ;
    book  = dic[0];
    pages =book[@"pages"];
    
    self.bookpages =pages ;
    NSLog(@"book11 is :%@ " , self.bookpages) ;

    
  
    
    
    NSLog(@"book is :%i " ,book.allKeys.count ) ;
    NSLog(@"pages is :%i " , pages.count  ) ;
 
}
-(void) initScrollView
{
    
    NSUInteger numberPages = self.bookpages.count  ;
    
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < numberPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    
    // a page is the width of the scroll view
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize =
    CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numberPages, CGRectGetHeight(self.scrollView.frame));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    
//    self.pageControl.numberOfPages = numberPages;
//    self.pageControl.currentPage = 0;
    
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];

}
-(void) initi
{
    UIScrollView *scrollView = self.scrollView ;
    for (int i=0; i<6; i++) {
        CGRect frame = CGRectMake(scrollView.frame.size.width * i,
                                  0,
                                  scrollView.frame.size.width,
                                  scrollView.frame.size.height);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:144.0];
        label.text = [NSString stringWithFormat:@"%d", i];
        
        UIImageView *imgview = [[UIImageView  alloc] initWithFrame:frame];
        NSString *fileURL = pages[i][@"image2x"] ;
        NSLog(@"file url is : %@" ,fileURL ) ;
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
        
        UIImage *image  = [UIImage imageWithData:data];
        
        [imgview setImage:image];
        
        [scrollView addSubview:imgview];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 6, scrollView.frame.size.height);
    
    scrollView.delegate = self;

}
#pragma mark - mcpager delegate 
- (void)updatePager
{
    self.mcPager.page = floorf(self.scrollView.contentOffset.x / self.scrollView.frame.size.width);
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollViewa
//{
//    [self updatePager];
//    scrollViewa.scrollEnabled = NO;
//    [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(scrollViewDidStop) userInfo:nil repeats:NO];
//    //    在scrollViewDidStop设置scrollView.scrollEnabled = YES;
//}
//-(void) scrollViewDidStop
//{
//    self.scrollView.scrollEnabled = YES;
//    NSLog(@"stop here and start ");
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    if (!decelerate) {
//        [self updatePager];
//    }
//}

- (void)pageView:(MCPagerView *)pageView didUpdateToPage:(NSInteger)newPage
{
    CGPoint offset = CGPointMake(self.scrollView.frame.size.width * self.mcPager.page, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
#pragma mark - scrollview relate  
- (void)loadScrollViewWithPage:(NSUInteger)page
{
    if (page >= self.bookpages.count)
        return;
    
    // replace the placeholder if necessary
      PageType1ViewController  *controller = [self.viewControllers objectAtIndex:page];
    
    
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[PageType1ViewController alloc] initWithNibName:nil bundle:nil];
        controller.pageNumber = page ;
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
        controller.thePage   =[self.bookpages  objectAtIndex:page];
    
    }
    
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [controller.navigationController.navigationBar setHidden:YES];
        [self addChildViewController:controller];
        [self.scrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
        
        NSDictionary *thePage = [self.bookpages  objectAtIndex:page];
        controller.thePage   = thePage ;
    }
    
    [controller setHideHeadBar:YES ];
}

// at the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // a possible optimization would be to unload the views+controllers which are no longer visible
}

- (void)gotoPage:(BOOL)animated
{
    NSInteger page = self.pageControl.currentPage;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.scrollView scrollRectToVisible:bounds animated:animated];
}

- (IBAction)changePage:(id)sender
{
    [self gotoPage:YES];    // YES = animate
}

#pragma mark - ViewController method 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setMcPager:nil];
    [self setPageControl:nil];
    [super viewDidUnload];
}
@end
