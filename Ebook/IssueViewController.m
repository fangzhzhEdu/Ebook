//
//  IssueViewController.m
//  对应杂志期刊，以grid排列
//
//  Created by ydf on 13-7-20.
//  Copyright (c) 2013年 openkava. All rights reserved.
//
#import "DownloadViewController.h"
#import "IssueViewController.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"
#import "PhotoBox.h"
#import "config.h"
#import "MGButton.h"
#import "PageReadViewController.h"

#import "PageRead2ViewController.h"
#import "PageRead3ViewController.h"
@interface IssueViewController ()

@end

@implementation IssueViewController

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
    
    
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"离线下载"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(showDownload)];
    
    
  [self addHeadBarButton];
    CGSize scrollerSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height-50);
    
 
    MGScrollView *scroller = [MGScrollView scrollerWithSize:scrollerSize];
    
    scroller.frame = CGRectMake(0,50,320,480-50);
    scroller.backgroundColor =[UIColor grayColor];
    [self.view addSubview:scroller];
    
    
    // the photos grid
    MGBox *photosGrid = [MGBox boxWithSize:(CGSize){320, 0}];
    photosGrid.contentLayoutMode = MGLayoutGridStyle;
    [scroller.boxes addObject:photosGrid];
    
    
    // add photo boxes to the grid
    int initialImages = 24 ;
    for (int i = 1; i <= initialImages; i++) {
        
        MGBox *box = [self createBox:@"issue"];
     //  box.sizingMode = MGResizingShrinkWrap;
        [photosGrid.boxes addObject:box] ;
        box.tag = i ;
        __weak MGBox *_box =box ;
        box.onTap = ^{
            
            
//            NSLog(@"you tapped my box!");
//            [self performSegueWithIdentifier:@"pagedetail" sender:self];
            if (_box.tag == 1) {
                NSLog(@"you tapped my box: 1 !");
                PageReadViewController *v=[[PageReadViewController alloc] init];
                [self.navigationController pushViewController:v animated:YES];
                
                
                
                
            }
            if (_box.tag == 2) {
                NSLog(@"you tapped my box: 2 !");
                
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
                PageRead2ViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"PageRead2ViewController"];
                
                [self.navigationController pushViewController:v animated:YES];

                
                
            }
            if (_box.tag == 3) {
                NSLog(@"you tapped my box: 3");
                
                
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
                PageRead3ViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"PageRead3ViewController"];
                
                [self.navigationController pushViewController:v animated:YES];
                
                
                
                
                
            }
            
        };
       
        
        
        
          }
    
  
    [photosGrid layoutWithSpeed:0.3 completion:nil];
   [scroller layoutWithSpeed:0.3 completion:nil];
    
    
    
}
-(MGBox*) createBox:(NSString*) imageName
{
    
    UIImage *add = [UIImage imageNamed:imageName];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    
    MGBox *box = [MGBox boxWithSize:(CGSize){90, 128}];
    box.leftMargin = box.topMargin = 10;
//    box.rightMargin =10;
//    box.bottomMargin =10 ;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 90, 128);
    
        
    [box addSubview:addView];
    
         
    
    return box ;
}

-(MGBox*) createBox2:(NSString*) imageName
{
    
    UIImage *add = [UIImage imageNamed:imageName];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    
    MGBox *box = [MGBox boxWithSize:(CGSize){90, 188}];
    box.leftMargin = box.topMargin = 1;
    //    box.rightMargin =10;
    //    box.bottomMargin =10 ;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 80, 108);
    
     CGSize rowSize1 = (CGSize){90, 128};
     CGSize rowSize2 = (CGSize){90, 15};
    
//    [box addSubview:addView];
    
     MGTableBoxStyled *section = [MGTableBoxStyled boxWithSize:(CGSize){90, 188}];
    
     MGLineStyled *head0 = [MGLineStyled lineWithLeft: nil   right:nil size:rowSize1];
    head0.middleItems = (id) add  ;
    [section.topLines addObject:head0];
 
    
     MGLineStyled *head1 = [MGLineStyled lineWithLeft:nil  right:nil size:rowSize2];
    head1.font = HEADER_FONT;
    head1.middleItems = (id)@"碧海蓝天 夏日倾城\n   2013/第二期";
    head1.middleTextColor =[UIColor blueColor];
    head1.borderStyle = MGBorderNone ;
    [section.topLines addObject:head1];
    
    //[box.boxes addObject:section];
    
    
    return section ;
}


-(void) addHeadBarButton
{
    MGTableBoxStyled *headbar = [MGTableBoxStyled boxWithSize:(CGSize){320,44 }];
    [self.view  addSubview:headbar];
    
    // header
    //    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"btn-info"] right:[UIImage imageNamed :@"btn-read"] size: (CGSize){320, 50}]; //sharebutton
    //
    MGButton *b1 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0,24, 24)];
    [b1 setBackgroundImage:[UIImage imageNamed :@"btn-info"]   forState: UIControlStateNormal ];
    
    [b1 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    MGButton *b2 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [b2 setBackgroundImage:[UIImage imageNamed :@"logo-100x44"]   forState: UIControlStateNormal ];
    
    MGButton *b3 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0, 68, 24)];
    [b3 setBackgroundImage:[UIImage imageNamed :@"btn-read"]   forState: UIControlStateNormal ];
    //    b3.onTap =^{
    //        [self showIssues];
    //    };
    //
    [b3 addTarget:self action:@selector(showDownload) forControlEvents:UIControlEventTouchUpInside];
    
    
    MGLineStyled *head1= [MGLineStyled lineWithSize: (CGSize){320, 50}];
    head1.leftItems =(id) b1;
    head1.middleItems =(id) b2;
    head1.rightItems = (id)b3;
    [headbar.topLines addObject:head1];
    
    [headbar  layoutWithSpeed:0.3 completion:nil];
    
    
    
    
}


-(void) addHead
{
    MGTableBoxStyled *headbar = MGTableBoxStyled.box;
    
    headbar.frame =CGRectMake(0,0,320 ,50);
    
    
    [self.view addSubview:headbar];
    
    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"infobutton"] right:[UIImage imageNamed :@"sharebutton"] size: (CGSize){304, 44}];
    [headbar.topLines addObject:head1];
    head1.font = HEADER_FONT;
    head1.borderStyle = MGBorderNone ;
    
    [headbar  layoutWithSpeed:0.3 completion:nil];
}

-(void) showDownload{
//    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//    DownloadViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"DownloadViewController"];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    PageRead3ViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"PageRead3ViewController"];
    
//    DownloadViewController  *v=[[DownloadViewController alloc] init];
    [self.navigationController pushViewController:v animated:YES];
    
}
-(void) back{
  
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
