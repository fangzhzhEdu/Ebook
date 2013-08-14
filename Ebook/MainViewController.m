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
#import "IIViewDeckController.h"
#import "OPDayPicker.h" 
#import "DateUtil.h"
#import "App.h"
#import "WebViewController.h" 
@interface MainViewController () <MZDayPickerDelegate, MZDayPickerDataSource, UITableViewDataSource, UITableViewDelegate>
{
    MGScrollView *boxScrollView ;
//    MGBox *boxImage ;
//    MGBox *boxContent ;
//    MGTableBoxStyled *section;
    
    
}
@property (nonatomic,strong) NSDateFormatter *dateFormatter;

@end
//@implementation UINavigationBar (CustomImage) // only work on 4.x
//
////定义navigation背景图片
//- (void)drawRect:(CGRect)rect {
//    UIImage *image = [UIImage imageNamed: @"backgroud.png"];
//    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//}
//@end


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
    
    [self initViewDeck];
    [self addMyCal] ;
    
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
    CGRect frame =self.navigationItem.titleView.frame ;
    self.navigationItem.titleView.frame =CGRectMake(50, frame.origin.y, frame.size.width, frame.size.height);
    
    UIImage *bg = [UIImage imageNamed:@"backgroundbar.png"];

    [self.navigationController.navigationBar setBackgroundImage:bg  forBarMetrics:0];
    
//    UIImage *bg = [[UIImage imageNamed:@"background"] stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    
     self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    
//    self.navigationController.navigationBar.barStyle =UIBarStyleBlack;
    
    
    
    
//    [self addHeadBar];
    [self addHeadBarButton];
 
    [self addBoxInit];
    

    [self test ] ;
}
-(void) initViewDeck
{
//    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//  
//    AboutViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
//    
    
    
    
    
}

-(void) addMyCal
{
//    UIImageView *calimage = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"calbar"]];
//    calimage.contentMode =UIViewContentModeScaleToFill ;
//    calimage.frame = CGRectMake(0, 0, 320, 44);
//    [self.daypickerContainer addSubview:calimage];
    
    
    //获得nib视图数组
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"OPDayPicker" owner:self options:nil];
    //得到第一个UIView
    OPDayPicker *tmpCustomView = [nib objectAtIndex:0];
    //获得屏幕的Frame
//    CGRect tmpFrame = [[UIScreen mainScreen] bounds];
    //设置自定义视图的中点为屏幕的中点
//    [tmpCustomView setCenter:CGPointMake(tmpFrame.size.width / 2, tmpFrame.size.height / 2)];
    //添加视图
    
//    
    CGRect frame = CGRectMake(0, 0, 320, 46);
    tmpCustomView.frame = frame ;
    
    self.dayPicker = tmpCustomView.dayPicker ;
    self.lbMonth   = tmpCustomView.lbMonth;
    //    [tmpCustomView.dayPicker  setActiveDaysFrom: -100  toDay:30];
    
    tmpCustomView.dayPicker.delegate =self ;
    
    tmpCustomView.dayPicker.dataSource = self ;
    
//    CGRect frame2 = CGRectMake(41, 0, 279, 46);
//    self.dayPicker.frame = frame2 ;
    self.dayPicker.dayNameLabelFontSize = 10.0f; //12.0f;
    self.dayPicker.dayLabelFontSize =12.0f ;// 18.0f;
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"EE"];
    [tmpCustomView.dayPicker   setStartDate:[NSDate dateFromDay:18 month:7 year:2013] endDate:[NSDate dateFromDay:12 month:8 year:2013]];
    tmpCustomView.dayPicker.year =2013;
    tmpCustomView.dayPicker.month = 8 ;
    
//    [tmpCustomView.dayPicker setActiveDaysFrom:1 toDay:30];
    
    
//  
//    
//    [tmpCustomView.dayPicker setCurrentDate:[NSDate date] animated:YES];
//    
//    [self.view addSubview:tmpCustomView];
    [self.daypickerContainer addSubview:tmpCustomView];
    
//    [tmpCustomView.centerContainer setHidden: YES ];
    
    [tmpCustomView test];
    
    UIImageView *imgview = tmpCustomView.imgToday;
    
    [imgview setUserInteractionEnabled:YES];
    [imgview setMultipleTouchEnabled: YES];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectToday:)];
    [imgview addGestureRecognizer:singleTap];
//    [self.dayPicker setCurrentDate:[NSDate new] animated:YES];
    [tmpCustomView.dayPicker setCurrentDay:11 animated:YES] ;
    [tmpCustomView.dayPicker setCurrentDay:12 animated:YES] ;
    DLog(@"now date is : %@" ,[NSDate date]  );
    
}
-(void) test
{
 
       
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
-(void) addHeadBarButton2
{
    
    
    
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
//    b2.frame  = CGRectMake(150, 0, 100, 44);
   b2.leftMargin =40 ;  
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


-(void) addBoxInit
{
    CGSize scrollerSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height-96);
    MGScrollView *scroller = [MGScrollView scrollerWithSize:scrollerSize];
    boxScrollView = scroller ;
    scroller.backgroundColor = [UIColor whiteColor];
    [self.pageContainer addSubview:scroller];
    scroller.showsHorizontalScrollIndicator  =   NO ;
    scroller.showsVerticalScrollIndicator   =   NO ;
    NSDictionary *thePage = [App sharedInstance].theRecommendPages[0];
    
    [self addBoxContent: thePage   ];
    
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
    
    
    
    /*
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
    
    box.onTap = ^ {
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://wallet.95516.net/"]];
    };
    
    [box addSubview:addView];
    
    [scroller.boxes addObject: box];
    */
    
    /*
    // the subsections table
    MGBox *table2 = MGBox.box;
    boxContent =table2 ;
    [scroller.boxes addObject:table2];
    table2.sizingMode = MGResizingShrinkWrap;
    
    // empty table2 out
    [table2.boxes removeAllObjects];
    
    // make the section
    section = MGTableBoxStyled.box;
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
//    [scroller scrollToView:section withMargin:8];
     
     */
    
    
}
- (void)openWebView : (NSString*) linkurl
{
    //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkurl]];
    
    WebViewController *v = [[WebViewController alloc] init];
    
    
    // v.url = [NSURL URLWithString: @"http://www.weibo.com"];
    v.url = [NSURL URLWithString: linkurl];
    // v.isLocal =YES;
    //v.localHtml =@"image";
//    v.isHideButtomNavBar =NO;
    v.isHideNavBar  =YES ;
    [self.navigationController pushViewController:v animated:YES];
}

-(void) addBoxContent: (NSDictionary*) thePage 
{
    NSString *imageName = thePage[@"pic"];
    NSString *linkurl = thePage[@"pageURL"];
    NSLog(@"add image content %@",imageName);
   
    // 图片内容 box
    
    UIImage *add = [UIImage imageNamed:imageName];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    float  x = add.size.width ;
    float  y = add.size.height ;
    float y1 = 320* y / x ; 
    
    MGBox *boxImage = [MGBox boxWithSize:(CGSize){320, y1}];
    boxImage.leftMargin = boxImage.topMargin = 0;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 320, y1);
    
    boxImage.onTap = ^ {
        [self openWebView:linkurl];
    };
    
    [boxImage addSubview:addView];
    
    
    // 文字内容box 
    MGBox *contentBox = MGBox.box;
   contentBox.sizingMode = MGResizingShrinkWrap;
    contentBox.backgroundColor =[UIColor clearColor] ;
    contentBox.borderStyle =MGBorderNone ;
    
    MGTableBoxStyled *lineBox = MGTableBoxStyled.box;
    [contentBox.boxes addObject:lineBox];
    lineBox.backgroundColor = [UIColor whiteColor] ;
    lineBox.borderStyle =MGBorderNone ;
//    lineBox.margin = UIEdgeInsetsZero ;

    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:[UIImage imageNamed :@"listone"]  right:[UIImage imageNamed :@"btn-link"]  size: (CGSize){304, 44}];
    head1.font = HEADER_FONT;
    head1.middleItems = (id)thePage[@"title"];
    head1.middleTextColor =[UIColor blueColor];
    head1.borderStyle = MGBorderNone ;
    head1.backgroundColor =[UIColor whiteColor] ;
    [lineBox.topLines addObject:head1];

    
    MGLineStyled *line1 = [MGLineStyled multilineWithText:(NSString*)thePage[@"line1"] font:nil width:304 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [lineBox.topLines addObject:line1];
    MGLineStyled *line2 = [MGLineStyled multilineWithText:(NSString*)thePage[@"line2"] font:nil width:304 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [lineBox.topLines addObject:line2];
    MGLineStyled *line3 = [MGLineStyled multilineWithText:(NSString*)thePage[@"line3"] font:nil width:304 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [lineBox.topLines addObject:line3];
    MGLineStyled *line4 = [MGLineStyled multilineWithText:(NSString*)thePage[@"content"] font:nil width:304 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [lineBox.topLines addObject:line4];
    
   line1.onTap = ^ { [self openWebView:(NSString*)thePage[@"line1_url"]]; };
   line2.onTap = ^ { [self openWebView:(NSString*)thePage[@"line2_url"]]; };
   line3.onTap = ^ { [self openWebView:(NSString*)thePage[@"line3_url"]]; };    
    
    line1.borderStyle = MGBorderNone ;
    line2.borderStyle = MGBorderNone ;
    line3.borderStyle = MGBorderNone ;
    line4.borderStyle = MGBorderNone ;
    
    line1.backgroundColor =[UIColor whiteColor] ;
    line2.backgroundColor =[UIColor whiteColor] ;
    line3.backgroundColor =[UIColor whiteColor] ;
    line4.backgroundColor =[UIColor whiteColor] ;
    
    NSLog(@"add  line1 content %@",thePage[@"line1"]);
    NSLog(@"add line2  content %@",thePage[@"line2"]);
    NSLog(@"add line3 content %@",thePage[@"line3"]);
    NSLog(@"add content content %@",thePage[@"content"]);    
    
   [boxScrollView.boxes removeAllObjects ]; 
   [boxScrollView.boxes addObject: boxImage]; 
   //[boxScrollView.boxes addObject:contentBox];
    
   [boxScrollView.boxes addObject:head1];
   [boxScrollView.boxes addObject:line1];
   [boxScrollView.boxes addObject:line2];
   [boxScrollView.boxes addObject:line3];
   [boxScrollView.boxes addObject:line4];
    
    
//    boxScrollView.contentSize = (CGSize){320, 180};
    //[lineBox layoutWithSpeed:0.3 completion:nil];
    //[boxImage layoutWithSpeed:0.3 completion:nil];
//    [contentBox layoutWithSpeed:0.3 completion:nil];
    //[boxScrollView  layoutWithSpeed:0.3 completion:nil];
  
    [boxScrollView layout ];
    
    
}
-(void) showAbout{
    
//    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//    AboutViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
// 
//    [self.navigationController pushViewController:v animated:YES];
//    
    
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
    
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
#pragma mark - default method
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidUnload {
    [self setPageContainer:nil];
    [self setTopbarView:nil];
    [self setDaypickerContainer:nil];
    [super viewDidUnload];
}
#pragma mark - MZDayPicker  delegate
- (NSString *)dayPicker:(MZDayPicker *)dayPicker titleForCellDayNameLabelInDay:(MZDay *)day
{
    return [self.dateFormatter stringFromDate:day.date];
}


- (void)dayPicker:(MZDayPicker *)dayPicker didSelectDay:(MZDay *)day
{
    NSLog(@"Did select day %@",day.day);
    self.lbMonth.text = [NSString stringWithFormat:@"%@" ,day.day ];
    self.lbMonth.text  = [DateUtil getMonthCN: day.date];
    int i = day.day.intValue % 7;
    @try {
        NSDictionary *thePage = [App sharedInstance].theRecommendPages[i];
        [self addBoxContent: thePage ] ;
    }
    @catch (NSException *exception) {
       NSLog(@"Did select day error  %@",exception);
    }
    @finally {
        
    }
    
    
    
//    
//    if (i==0)
//    [self addBoxContent:@"page-1" content:@"夏天的荷花" ];
//    if (i==1)
//        [self addBoxContent:@"page-5" content:@"最高支持16GB容量。你拍下的照片和视频会直接写入USB闪存驱动器，通过机身上的USB插头连接电脑就能立即观看。如果所有产品的设计都能如此一体化，我们的生活将更加方便和快捷。" ];
//    if (i==2)
//        [self addBoxContent:@"page-6" content:@"日本玩具相机制造商Power Shovel推出了一款比手掌还小的超迷你相机" ];
//    
    
}

- (void)dayPicker:(MZDayPicker *)dayPicker willSelectDay:(MZDay *)day
{
    NSLog(@"Will select day %@",day.day);
}
- (void)selectToday: (UITapGestureRecognizer *)gesture{
    [self.dayPicker setCurrentDate:[NSDate date] animated:YES];
    
    int i =1 ;
    @try {
        NSDictionary *thePage = [App sharedInstance].theRecommendPages[i-1];
        [self addBoxContent: thePage ] ;
    }
    @catch (NSException *exception) {
        NSLog(@"Did select day error  %@",exception);
    }
    @finally {
        
    }

}
@end
