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
//    
//    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"infobutton"]
//                                            style:UIBarButtonItemStyleBordered                    target:self action:@selector(showAbout)];
    
    
    
    
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
    //    [self addHead];
    
    [self addBox];
    

}
-(void) addHead
{
    MGTableBoxStyled *headbar = MGTableBoxStyled.box;
    [self.view addSubview:headbar];
    
    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:@"关于" right:[UIImage imageNamed :@"sharebutton"] size: (CGSize){304, 44}];
    [headbar.topLines addObject:head1];
    head1.font = HEADER_FONT;
    head1.borderStyle = MGBorderNone ;

    
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
    
    
    
    
    UIImage *add = [UIImage imageNamed:@"p1"];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    
    MGBox *box = [MGBox boxWithSize:(CGSize){320, 460}];
    box.leftMargin = box.topMargin = 0;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 320, 460);
    
    
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
    
    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:@"今夏会遇到什么关卡" right:[UIImage imageNamed :@"sharebutton"] size: (CGSize){304, 44}];
    [section.topLines addObject:head1];
     head1.font = HEADER_FONT;
    head1.borderStyle = MGBorderNone ;
    
    id waffle1 = @"五月刊 蔬食大专题 \n\n如果要画一只鸟和一个人的话，你会如何构图？ （1）一个人正看着笼中的鸟 个人正追着飞走的鸟 停留在一个人的肩上或手上（4）一个人正向飞远的鸟招手 人和鸟之间似乎没什么衔接点，这表示你对幸福似乎没什么特别的感觉。现在的你相当的淡然，或许你的幸福，只有你自己知道。; " ;
    
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
    [super viewDidUnload];
}
@end
