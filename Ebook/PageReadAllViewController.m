//
//  PageReadAllViewController.m
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//
#import "App.h"
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
    
    UIScrollView *listScrollView ;
    
    
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
     
    [self addHeadBarButton2] ;
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
-(void) addHeadBarButton2
{
    self.view.backgroundColor = [UIColor grayColor];
    UIView *headbar= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
//        headbar.backgroundColor = [UIColor grayColor] ;
    //  headbar.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"Backgroundbar"] ];
    
    
    //    UIImage *image =[UIImage imageNamed:@"Backgroundbar"];
    //method1 ok
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:headbar.bounds];
    imageView.image = [[UIImage imageNamed:@"Backgroundbar"] stretchableImageWithLeftCapWidth:0   topCapHeight:0];
    [headbar addSubview:imageView];
    
    
    
    //method2 not work
    //    headbar.layer.contents = (id) image.CIImage ;
    //    headbar.layer.backgroundColor =[UIColor clearColor].CGColor ;
    
    [self.view addSubview: headbar ] ;
    
    
    UIButton *b1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 10,24, 24)];
    [b1 setBackgroundImage:[UIImage imageNamed :@"btn-back"]   forState: UIControlStateNormal ];
    
    [b1 addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *b2 = [[UIButton alloc] initWithFrame:CGRectMake(110, 0, 100, 40)];
    [b2 setBackgroundImage:[UIImage imageNamed :@"logo-100x44"]   forState: UIControlStateNormal ];
    //    b2.leftMargin =10 ;
    UIButton *b3 = [[UIButton alloc] initWithFrame:CGRectMake(280, 10, 24, 24)];
    [b3 setBackgroundImage:[UIImage imageNamed :@"btn-pagelist"]   forState: UIControlStateNormal ];
    [b3 addTarget:self action:@selector(addBookIndexList) forControlEvents:UIControlEventTouchUpInside];

    
    [headbar addSubview:b1];
    [headbar addSubview:b2];
    [headbar addSubview:b3];
    
    self.headBar  = headbar ; 
    
}
-(void) addBookIndexList // 动态创建背景透明的杂志索引
{
//    for (UIView * v  in listScrollView.subviews) {
//        [v removeFromSuperview];
//        
//    }
    if (listScrollView != nil )
    {
      
       [listScrollView setHidden: !listScrollView.isHidden ];
        return ;
    }
    
    CGRect frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44);
    listScrollView = [[UIScrollView alloc] initWithFrame: frame];
    listScrollView.showsHorizontalScrollIndicator = false ;
    listScrollView.backgroundColor = [UIColor blackColor];
    listScrollView.alpha =0.8;
    int total = 3;
    for (int i=0;i<total ; i++) {
        
        UIView *listi = [[UIView alloc] initWithFrame: CGRectMake(0, i*44, 320, 50)];
        NSString *imageName = [NSString stringWithFormat:@"listicon%i" , i+1];
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        icon.frame = CGRectMake(10, 5 , 40,40);
        [listi addSubview: icon ] ;
        UILabel *lbTitle = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 250, 48)];
        lbTitle.text =  [NSString stringWithFormat:@"杂志第 %i 页" , i+1 ];
        lbTitle.backgroundColor =[UIColor clearColor] ;
        lbTitle.textColor  = [UIColor whiteColor] ;
        lbTitle.font  = [UIFont fontWithName:@"HelveticaNeue" size:18];
        lbTitle.textAlignment = NSTextAlignmentLeft ;
        
        [listi addSubview: lbTitle];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
        [listi addGestureRecognizer:singleTap ];
        
        [listScrollView addSubview: listi ] ;
        
    }
    listScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 44*total );
  
    
    [self.view addSubview: listScrollView ] ;
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
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
        [scrollView addGestureRecognizer:singleTap];

    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 6, scrollView.frame.size.height);
    
    scrollView.delegate = self;

}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
     CGPoint touchPoint=[gesture locationInView:listScrollView];
    int page = touchPoint.y /50 ;
    
//   App *app =[App sharedInstance] ;
    //    BOOL isHideHeadBar = app.isHideHeadBar ;
    //    if (isHideHeadBar) {
    //        [self.view addSubview:self.headBar];
    //     }
    //    else{
    //
    //    [self.headBar removeFromSuperview];
    //
    //    }
    
       NSLog(@"PageReadAll tap here: select page %i  in  %f ,%f " ,page ,touchPoint.x,touchPoint.y);
    self.pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    [listScrollView setHidden: YES ] ;
    [self gotoPage:YES ];
 
}

-(void) refreshHeadBar {
    
    App *app =[App sharedInstance] ;
    BOOL isHideHeadBar = app.isHideHeadBar ;
    if (isHideHeadBar) {
        [self.headBar setHidden:YES ];
    }
    else{
        
        [self.headBar setHidden:NO ] ;
        
    }
    
    
    
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
    controller.pageReadAll = self ;
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
-(void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
