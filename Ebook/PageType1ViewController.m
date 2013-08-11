//
//  PageType1ViewController.m
//  Ebook
//
//  Created by ydf on 13-8-5.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageType1ViewController.h"
#import "PageType2ViewController.h"
#import "PageType3ViewController.h"
#include "PageRead2ViewController.h"
#include "PageRead3ViewController.h"
#include "PageReadViewController.h"
#include "UIImageView+DispatchLoad.h"
#import "MGTableBoxStyled.h"
#import "PageReadAllViewController.h"
#import "App.h"
@interface PageType1ViewController ()


@end

@implementation PageType1ViewController


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
    
    
    
    [self initi ] ;
//    [self addHeadBarButton ];
    [self addPageNumber];
    
}
-(void) addPageNumber
{
    UILabel *lbPage = [[UILabel alloc ] initWithFrame: CGRectMake(290, 50, 25, 20)];
    lbPage.text = [NSString stringWithFormat:@"%02d" ,self.pageNumber+1] ;
    lbPage.backgroundColor =[UIColor blackColor] ;
    lbPage.textColor  = [UIColor whiteColor];
    lbPage.font  = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    lbPage.textAlignment = NSTextAlignmentCenter ;
    
    [self.view addSubview:lbPage];
}
-(void) initi
{
           
    UIImageView *imgview = [[UIImageView  alloc] initWithFrame:self.view.frame];
    NSString *fileURL = self.thePage[@"image2x"] ;
//    [imgview setImageFromUrl:fileURL];
    
//    NSLog(@"file url is : %@" ,fileURL ) ;
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
//    
//    UIImage *image  = [UIImage imageWithData:data];
    
//    [imgview setImage:image];
    
    [imgview setImage:[UIImage imageNamed:fileURL]];
    
    
    
    
    [self.view addSubview:imgview ];
    NSNumber *pageType = (NSNumber *) self.thePage[@"order"] ;
    NSLog(@"page type is  : %i" ,pageType.intValue);
    int pageTypeint= pageType.intValue ;
    NSArray *zone =(NSArray*)  self.thePage[@"zones"]; 
    if(pageTypeint ==4)
    {
       
        [self initPageType2:zone ];
          
    }
    else if ( pageTypeint ==5)
    {
        [self initPageType3:zone ];
    }
    [imgview setUserInteractionEnabled:YES];
    [imgview setMultipleTouchEnabled: YES];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [imgview addGestureRecognizer:singleTap];
    
    
}
-(void) initPageType2 :(NSArray*) zone
{
    
    PageType2ViewController * p3 = [[PageType2ViewController alloc] init];
    
    CGRect frame = CGRectMake(10, 80, 300, 300);
    p3.view.frame = frame ;
    [self addChildViewController:p3];
    [self.view addSubview: p3.view ] ;
}

-(void) initPageType3 :(NSArray*) zone
{
        
    PageType3ViewController * p3 = [[PageType3ViewController alloc] init];
    
    CGRect frame = CGRectMake(10, 80, 300, 300);
    p3.view.frame = frame ;
    [self addChildViewController:p3];
    [self.view addSubview: p3.view ] ;
    
}


- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
//    CGPoint touchPoint=[gesture locationInView:scrollView];
    App *app =[App sharedInstance] ;
    app.isHideHeadBar =!app.isHideHeadBar;
    [self.pageReadAll refreshHeadBar ] ;
    
   
    NSLog(@"PageType1 tap here: headbar or not : %i " ,app.isHideHeadBar);
 
}
//- (void)tapped:(UITapGestureRecognizer *)recognizer
//{
//    [self.headBar removeFromSuperview];
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self setHideHeadBar:YES];
     NSLog(@"page type1 will   appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [self setHideHeadBar:YES];
     NSLog(@"page type1 did  appear");
}
@end

/*
 http://www.cnblogs.com/aipingguodeli/archive/2012/05/08/2489917.html
 
 self.view.backgroundColor = [UIColorcolorWithPatternImage:[UIImageimageNamed:@"bg_blank.png"]];
 
 //  self.view.backgroundColor = [UIColor clearColor];
 
 
 
 ／／定义UIScrollView
 
 scrollview = [[UIScrollViewalloc] init];
 
 scrollview.frame = CGRectMake(10, 0, 300, 108);
 
 scrollview.contentSize = CGSizeMake(600, 108);  ／／scrollview的滚动范围
 
 scrollview.showsVerticalScrollIndicator = NO;
 
 scrollview.showsHorizontalScrollIndicator = NO;
 
 //myScrollView.clipsToBounds = YES;
 
 scrollview.delegate = self;
 
 scrollview.scrollEnabled = YES;
 
 scrollview.pagingEnabled = YES; ／／使用翻页属性
 
 scrollview.bounces = NO;
 
 */
