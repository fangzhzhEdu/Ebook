//
//  BaseViewController.m
//  Ebook
//
//  Created by ydf on 13-7-29.
//  Copyright (c) 2013年 openkava. All rights reserved.
//
#import "App.h"
#import "BaseViewController.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"
#import "PhotoBox.h"
#import "config.h"
#import "MGButton.h"
#import "IIViewDeckController.h"
#import "PageReadAllViewController.h" 
@interface BaseViewController ()


@end

@implementation BaseViewController


+(id)initWithStoryBoardID:(NSString*) storyBoardID ;
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:storyBoardID];
            
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.viewDeckController closeLeftView];

	
}
-(void) setHideHeadBar: (BOOL) isHide;
{
    
    if( self.pageReadAll!=nil)
    {
        [self.pageReadAll refreshHeadBar] ;
    }
}
-(void) addHeadBarButton
{
    [self addHeadBarButton :@"btn-back"  centerButton:@"logo-100x44" rightButton:@"btn-pagelist"  ];
}
-(void) addHeadBarButton :(NSString*) leftImage  centerButton:(NSString*) centerImage  rightButton:(NSString*)rightImage
{
    MGTableBoxStyled *headbar = [MGTableBoxStyled boxWithSize:(CGSize){320,44 }];
   
    
    MGLineStyled *head1= [MGLineStyled lineWithSize: (CGSize){320, 44}];
// header
    //    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"btn-info"] right:[UIImage imageNamed :@"btn-read"] size: (CGSize){320, 50}]; //sharebutton
    //
    if(leftImage!=nil)
    {
        MGButton *b1 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0,24, 24)];
        [b1 setBackgroundImage:[UIImage imageNamed :leftImage]   forState: UIControlStateNormal ];
        
        [b1 addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        head1.leftItems =(id) b1;
        
    }

    if(centerImage!=nil)
    {
        MGButton *b2 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        [b2 setBackgroundImage:[UIImage imageNamed :centerImage]   forState: UIControlStateNormal ];
        [b2 addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        head1.middleItems =(id) b2;
//        b2.leftMargin =40;
 
    }
   if(rightImage!=nil)
   {
       MGButton *b3 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
       [b3 setBackgroundImage:[UIImage imageNamed :rightImage ]   forState: UIControlStateNormal ];
       
       [b3 addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
       head1.rightItems = (id)b3; 
   }
       
   
    
         
   
    [headbar.topLines addObject:head1];
    
    [headbar  layoutWithSpeed:0.3 completion:nil];
    if([App sharedInstance].isHideHeadBar == NO)
    {
    [self.view  addSubview:headbar];
    [self.view bringSubviewToFront: headbar];
    }
    self.headBar = headbar ;
    
}
-(void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES]; 
}
-(void) centerButtonClick
{
    
}
-(void) rightButtonClick
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
