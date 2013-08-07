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
#import "PageReadAllViewController.h" 


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
    int initialImages = 1 ;
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
//                PageReadViewController *v=[[PageReadViewController alloc] init];
//                [self.navigationController pushViewController:v animated:YES];
                
                //                PageReadAllViewController *v=[[PageReadAllViewController alloc] init];
                //                [self.navigationController pushViewController:v animated:YES];
                
                
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
                PageReadAllViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"PageReadAllViewController"];
                
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
                
//                
//                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//                PageRead3ViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"PageRead3ViewController"];
                
                PageRead3ViewController *v = [PageRead3ViewController initWithStoryBoardID:@"PageRead3ViewController"  ];
                
                [self.navigationController pushViewController:v animated:YES];
                
                
               
                
                
            }
            if (_box.tag == 4) {
                NSLog(@"you tapped my box: 3");
                
                                
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
    
    MGBox *boxImage = [MGBox boxWithSize:(CGSize){90, 128}];
    boxImage.leftMargin = boxImage.topMargin = 0;
//    box.rightMargin =10;
//    box.bottomMargin =10 ;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 90, 128);
    
        
    [boxImage addSubview:addView];
        
    
    
    // make the section
//    MGTableBoxStyled *section = MGTableBoxStyled.box;
    
    
    
    MGLineStyled *head11 = [MGLineStyled lineWithLeft:@"碧海蓝天 夏日倾城"  right:nil   size: (CGSize){90, 16}];
    head11.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10];
    head11.borderStyle = MGBorderNone ;
    head11.leftPadding = head11.rightPadding =2 ;
//    [section.topLines addObject:head11];
    
    MGLineStyled *head12 = [MGLineStyled lineWithLeft:@"2013/第二期"    right:nil   size: (CGSize){90,16}];
    head12.font = [UIFont fontWithName:@"HelveticaNeue" size:8];
    head12.borderStyle = MGBorderNone ;
    head11.leftPadding = head11.rightPadding =1 ;
    
    MGLineStyled *head13 =[MGLineStyled lineWithSize:(CGSize){90, 22}];
    head13.font =[UIFont fontWithName:@"HelveticaNeue" size:8];
    head13.multilineLeft = (id) @"碧海蓝天夏日倾城\n2013/第二期" ;
    head13.itemPadding = 0 ;
    head13.leftMargin = 0 ;
    head13.rightMargin =0 ;
    head13.leftPadding =0 ;
    head13.borderStyle = MGBorderNone ;
//    [section.topLines addObject:head12];
    // header
//    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"listone"]  right:nil  size: (CGSize){304, 44}];
//    head1.font = HEADER_FONT;
//    head1.middleItems = (id)@"银联信用卡享四季酒店三重礼";
//    head1.middleTextColor =[UIColor blueColor];
//    head1.borderStyle = MGBorderNone ;
//    [section.topLines addObject:head11];
//    [section.topLines addObject:boxImage];
    
    MGBox *boxContainer = [MGBox boxWithSize:(CGSize){90, 316}];
    boxContainer.leftMargin =boxContainer.topMargin =10;
    boxContainer.backgroundColor =[UIColor grayColor];
//    boxContainer.sizingMode = MGResizingShrinkWrap;
    [boxContainer.boxes removeAllObjects];
    [boxContainer.boxes addObject:boxImage];
    [boxContainer.boxes addObject:head11];
    [boxContainer.boxes addObject:head12 ];
//    [boxContainer layoutWithSpeed:0.3 completion:nil]; 
    
    return  boxContainer;
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
    [b1 setBackgroundImage:[UIImage imageNamed :@"backbutton"]   forState: UIControlStateNormal ];
    
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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
@end
