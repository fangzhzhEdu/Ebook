//
//  MainViewController.m
//  Ebook
//
//  Created by ydf on 13-7-17.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "MainViewController.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"
#import "PhotoBox.h"
#import "config.h"
#import "AboutViewController.h"
#import "IssueViewController.h"
#import "MZDayPicker.h"
#import "MGButton.h"
@interface MainViewController ()

@end
@implementation UINavigationBar (CustomImage)

//定义navigation背景图片
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed: @"backgroud.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end


@implementation MainViewController

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
    
//    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn-info"]
//                                            style:UIBarButtonItemStyleBordered                    target:self action:@selector(showAbout)];
//    
//    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn-read"]
//                                                                            style:UIBarButtonItemStylePlain                    target:self action:@selector(showIssues)];
//    
//    
    
    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                            target:self action:@selector(showAbout)];
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"阅读杂志"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(showIssues)];
    
    
    
    
   UIImageView *logo = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"logo-100x44"]];
    logo.contentMode =UIViewContentModeScaleToFill ; 
    logo.frame = CGRectMake(0, 0, 100, 44);
    
    self.navigationItem.titleView =logo ;
    
    UIImage *bg = [UIImage imageNamed:@"backgroundbar.png"];

    [self.navigationController.navigationBar setBackgroundImage:bg  forBarMetrics:0];
    
//    UIImage *bg = [[UIImage imageNamed:@"background"] stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    
     self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    
//    self.navigationController.navigationBar.barStyle =UIBarStyleBlack;
    
    
    
    
//    [self addHeadBar];
    [self addHeadBarButton];
 
    [self addBox];
    

}
-(void) addHeadBar
{
    MGTableBoxStyled *headbar = MGTableBoxStyled.box;
    [self.topbarView  addSubview:headbar];
    
    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"btn-info"] right:[UIImage imageNamed :@"btn-read"] size: (CGSize){320, 50}]; //sharebutton
    [headbar.topLines addObject:head1];
    head1.middleItems = (id) [UIImage imageNamed:@"logo-100x44"];
    head1.font = HEADER_FONT;
    head1.borderStyle = MGBorderNone ;
    [headbar  layoutWithSpeed:0.3 completion:nil];
    
    headbar.onTap = ^{
       
        [self showIssues];
   };
    
   
    
}
-(void) addHeadBarButton
{
    MGTableBoxStyled *headbar = [MGTableBoxStyled boxWithSize:(CGSize){320,44 }];
    [self.topbarView  addSubview:headbar];
    
    // header
//    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"btn-info"] right:[UIImage imageNamed :@"btn-read"] size: (CGSize){320, 50}]; //sharebutton
//    
    MGButton *b1 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0,24, 24)];
    [b1 setBackgroundImage:[UIImage imageNamed :@"btn-info"]   forState: UIControlStateNormal ];
   
   [b1 addTarget:self action:@selector(showAbout) forControlEvents:UIControlEventTouchUpInside];
    
    MGButton *b2 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [b2 setBackgroundImage:[UIImage imageNamed :@"logo-100x44"]   forState: UIControlStateNormal ];
    
    MGButton *b3 = [[MGButton alloc] initWithFrame:CGRectMake(0, 0, 68, 24)];
    [b3 setBackgroundImage:[UIImage imageNamed :@"btn-read"]   forState: UIControlStateNormal ];
//    b3.onTap =^{
//        [self showIssues];
//    };
//
    [b3 addTarget:self action:@selector(showIssues) forControlEvents:UIControlEventTouchUpInside];
    
    
    MGLineStyled *head1= [MGLineStyled lineWithSize: (CGSize){320, 50}];
    head1.leftItems =(id) b1;
    head1.middleItems =(id) b2;
    head1.rightItems = (id)b3;
    [headbar.topLines addObject:head1];
   
    [headbar  layoutWithSpeed:0.3 completion:nil];
    
   
    
    
}


-(void) addBox
{
    CGSize scrollerSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height-65);
    
    
    
    
    MGScrollView *scroller = [MGScrollView scrollerWithSize:scrollerSize];
    [self.pageContainer addSubview:scroller];
    
    //    MGBox *boxpicker = [MGBox boxWithSize:(CGSize){360, 50}];
    //    boxpicker.leftMargin = boxpicker.topMargin = 10;
    //    //    addView.bounds = CGRectMake(0, 0, 100,100);
    //
    //    MZDayPicker *daypicker  = [[MZDayPicker alloc] initWithFrame:CGRectMake(0, 0, 360, 100)];
    //
    //    [daypicker setStartDate:[NSDate dateFromDay:28 month:9 year:2012] endDate:[NSDate dateFromDay:5 month:10 year:2013]];
    //
    //    [daypicker setCurrentDate:[NSDate dateFromDay:3 month:10 year:2013] animated:YES];
    //
    //
    //    [boxpicker addSubview:daypicker];
    //
    //    [scroller.boxes addObject: boxpicker];
    
    
    
    
    UIImage *add = [UIImage imageNamed:@"p1-cover"];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    
    
    
    MGBox *box = [MGBox boxWithSize:(CGSize){320, 180}];
    box.leftMargin = box.topMargin = 0;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 320, 180);
    
    
    [box addSubview:addView];
    
    [scroller.boxes addObject: box];
    
    
    
    // the subsections table
    MGBox *table2 = MGBox.box;
    [scroller.boxes addObject:table2];
    table2.sizingMode = MGResizingShrinkWrap;
    
    // empty table2 out
    [table2.boxes removeAllObjects];
    
    // make the section
    MGTableBoxStyled *section = MGTableBoxStyled.box;
    [table2.boxes addObject:section];
    
    
//    MGLineStyled *head11 = [MGLineStyled lineWithLeft:@"银联信用卡享四季酒店三重礼"  right:[UIImage imageNamed :@"btn-link"]  size: (CGSize){304, 44}];
//    head11.font = HEADER_FONT;
//    head11.borderStyle = MGBorderNone ;
//    
    
    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"listone"]  right:[UIImage imageNamed :@"btn-link"]  size: (CGSize){304, 44}];
    head1.font = HEADER_FONT;
    head1.middleItems = (id)@"银联信用卡享四季酒店三重礼";
    head1.middleTextColor =[UIColor blueColor];
    head1.borderStyle = MGBorderNone ;
    [section.topLines addObject:head1];
    
    
   

    
    
    
    id waffle1 = @"一、活动对象  \n　　工银银联信用卡（卡号以62开头,卡面有“银联”标识，下同）持卡人  \n二、活动时间  　　\n 2013年7月1日到2013年9月30日 \n三、 活动内容" ;
    
    // stuff
    MGLineStyled *waf1 = [MGLineStyled multilineWithText:waffle1 font:nil width:304
                                                 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    
    waf1.borderStyle = MGBorderNone;
    [section.topLines addObject:waf1];
    
    // header
    MGLineStyled *head2 = [MGLineStyled lineWithLeft:[UIImage imageNamed:@"DailyLinkIcon"] right:@"订购全年杂志 送Bayankala套装" size: (CGSize){304, 44}];
    [section.topLines addObject:head2];
    //    head2.font = HEADER_FONT;
    
    id waffle2 = @"詹姆斯·邦德的间谍风格如今已被运用到日常生活中了！日本玩具相机制造商Power Shovel推出了一款比手掌还小的超迷你相机，你可以握着它随时随地拍摄影像。在如此娇小的身型下，它竟然兼具了拍照和录影的双重功能，支持720×480大小的30FPS视频和1280 x 1024大小的照片摄录。具备ISO100感光度，3.2mm焦距，以及轻便相机少见的F2.8大光圈。另外，它还是一个具有充电功能的USB。只要插入microSD卡扩展存储，就能使它变成一个普通的USB存储驱动器，最高支持16GB容量。你拍下的照片和视频会直接写入USB闪存驱动器，通过机身上的USB插头连接电脑就能立即观看。如果所有产品的设计都能如此一体化，我们的生活将更加方便和快捷。";
    
    // stuff
    MGLineStyled *waf2 = [MGLineStyled multilineWithText:waffle2 font:nil width:304
                                                 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [section.topLines addObject:waf2];
    
    
    //    MGLineStyled *line4 = [MGLineStyled lineWithLeft:@"hello "   right:nil size: (CGSize){304, 1000}];
    //    MGLineStyled *line4 = [MGLineStyled lineWithLeft:[UIImage imageNamed:@"p2"]  right:nil size: (CGSize){304, 1000}];
    //
    //    [section.bottomLines addObject:line4];
    
    
//        scroller.frame  =CGRectMake(0,65 , 360, 880);
    
    
    
    // animate
    
    
    [table2 layoutWithSpeed:0.3 completion:nil];
    [scroller layoutWithSpeed:0.3 completion:nil];
    
    // scroll
    [scroller scrollToView:section withMargin:28];
}
-(void) showAbout{
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//    AboutViewController *v  = [storyboard instantiateInitialViewController];
    AboutViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
 
    
//    AboutViewController *v=[[AboutViewController alloc] init];
    [self.navigationController pushViewController:v animated:YES];
    
}
-(void) showIssues{
    IssueViewController  *v=[[IssueViewController alloc] init];
    [self.navigationController pushViewController:v animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//    self = [super initWithCenterViewController:[storyboard instantiateViewControllerWithIdentifier:@"CenterViewController"]
//                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"]
//                           rightViewController: nil ];
//    if (self) {
//        // Add any extra init code here
//    }
//    return self;
//}

- (void)viewDidUnload {
    [self setPageContainer:nil];
    [self setTopbarView:nil];
    [super viewDidUnload];
}
@end
