//
//  PageReadViewController.m
//  Ebook
//
//  Created by ydf on 13-7-19.
//  Copyright (c) 2013年 openkava. All rights reserved.
//
#import "ShareViewController.h"
#import "PageReadViewController.h"
#import <MGBox.h>
#import "MGScrollView.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"
#import <MGLine.h>
#import "config.h"
@interface PageReadViewController ()

@end

@implementation PageReadViewController
+(id) instance
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:@"PageReadViewController"];
    
}
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
    [super addHeadBarButton];
    
     
	
//    MGScrollView *scroller = [MGScrollView scrollerWithSize:self.view.bounds.size];
//    [self.view addSubview:scroller];
    
    CGSize scrollerSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height-HEADBAR_HEIGHT);
    
    
    MGScrollView *scroller = [MGScrollView scrollerWithSize:scrollerSize];
    scroller.frame = CGRectMake(0,HEADBAR_HEIGHT+10 , 320,self.view.size.height - HEADBAR_HEIGHT);
    [self.view  addSubview:scroller];
    self.view.backgroundColor = [UIColor grayColor];
    
    MGBox *grid = [MGBox boxWithSize:self.view.bounds.size];
    grid.contentLayoutMode = MGLayoutGridStyle;
    [scroller.boxes addObject:grid];
    
    
    UIImage *add = [UIImage imageNamed:@"page-1"];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    
   
    
    addView.frame = CGRectMake(0,0 ,300,460);
    
    MGBox *box = [MGBox boxWithSize:(CGSize){300, 460}];
    box.leftMargin = box.topMargin = 10;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    [box addSubview:addView];
    
    [grid.boxes addObject: box];
    
    
    /***********
     
    // the subsections table
    
    MGBox *table2 = MGBox.box;
    [grid.boxes addObject:table2];
    table2.sizingMode = MGResizingShrinkWrap;
    
    // empty table2 out
    [table2.boxes removeAllObjects];
    
    // make the section
    MGTableBoxStyled *section = MGTableBoxStyled.box;
    [table2.boxes addObject:section];
    
    // header
    MGLineStyled *head1 = [MGLineStyled lineWithLeft:@"今夏会遇到什么关卡" right:[UIImage imageNamed :@"sharebutton"] size: (CGSize){304, 44}];
    [section.topLines addObject:head1];
    //head1.font = HEADER_FONT;
    head1.borderStyle = MGBorderNone ;
    head1.onTap = ^{
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
       ShareViewController *v  = [storyboard instantiateViewControllerWithIdentifier:@"ShareViewController"];
        
        
        //    DownloadViewController  *v=[[DownloadViewController alloc] init];
        [self.navigationController pushViewController:v animated:YES];
        
    } ;
    
       id waffle1 = @"五月刊 蔬食大专题 \n\n如果要画一只鸟和一个人的话，你会如何构图？ （1）一个人正看着笼中的鸟 个人正追着飞走的鸟 停留在一个人的肩上或手上（4）一个人正向飞远的鸟招手 人和鸟之间似乎没什么衔接点，这表示你对幸福似乎没什么特别的感觉。现在的你相当的淡然，或许你的幸福，只有你自己知道。; " ;
    
    
    // stuff
    MGLineStyled *waf1 = [MGLineStyled multilineWithText:waffle1 font:nil width:304
                                                 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [section.topLines addObject:waf1];
    
    // header
    MGLineStyled *head2 = [MGLineStyled lineWithLeft:[UIImage imageNamed:@"DailyLinkIcon"] right:@"订购全年杂志 送Bayankala套装" size: (CGSize){304, 44}];
    [section.topLines addObject:head2];
    
     id waffle2 = @"詹姆斯·邦德的间谍风格如今已被运用到日常生活中了！日本玩具相机制造商Power Shovel推出了一款比手掌还小的超迷你相机，你可以握着它随时随地拍摄影像。在如此娇小的身型下，它竟然兼具了拍照和录影的双重功能，支持720×480大小的30FPS视频和1280 x 1024大小的照片摄录。具备ISO100感光度，3.2mm焦距，以及轻便相机少见的F2.8大光圈。另外，它还是一个具有充电功能的USB。只要插入microSD卡扩展存储，就能使它变成一个普通的USB存储驱动器，最高支持16GB容量。你拍下的照片和视频会直接写入USB闪存驱动器，通过机身上的USB插头连接电脑就能立即观看。如果所有产品的设计都能如此一体化，我们的生活将更加方便和快捷。";
    
    // stuff
    MGLineStyled *waf2 = [MGLineStyled multilineWithText:waffle2 font:nil width:304
                                                 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
    [section.topLines addObject:waf2];
    
     [table2 layoutWithSpeed:0.3 completion:nil];
 

     *****/
    
    
    
//    [grid.boxes addObject:[self createBox:@"page-2"]] ;
    
    
    
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
    
    MGBox *box = [MGBox boxWithSize:(CGSize){300, 460}];
    box.leftMargin = box.topMargin = 10;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 300, 460);
    
    
    [box addSubview:addView];
    
    return box ;
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
