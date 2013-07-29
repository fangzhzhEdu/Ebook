//
//  AboutViewController.m
//  Ebook
//
//  Created by ydf on 13-7-17.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "AboutViewController.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"
#import "PhotoBox.h"
#import "config.h"
#import "MGButton.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

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
  
//    UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"backgroudtexture"]];
    //                        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    //                        [myView setBackGroundColor:bgColor];
//    [ self.view setBackgroundColor:bgColor];
    
    
    CGSize scrollerSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height-HEADBAR_HEIGHT);
    
    
    MGScrollView *scroller = [MGScrollView scrollerWithSize:scrollerSize];
    scroller.frame = CGRectMake(0,HEADBAR_HEIGHT+8 , 320,self.view.size.height - HEADBAR_HEIGHT);
    [self.view  addSubview:scroller];
    
//    [scroller setBackgroundColor: bgColor];
    
    
//    
//    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,480)];
//    [bgImgView setImage:[UIImage imageNamed:@"backgroundtexture"]];
//    [self.view  addSubview:bgImgView];
//    [self.view sendSubviewToBack:bgImgView];
    
 
    UIImage *add = [UIImage imageNamed:@"p-about"];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
    addView.contentMode = UIViewContentModeScaleToFill ;
    
    MGBox *box = [MGBox boxWithSize:(CGSize){310, 560}];
    box.leftMargin = box.topMargin =0.1;
    //    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 310, 460);
    
    
    [box addSubview:addView];
    
    [scroller.boxes addObject: box];
 
    [box  layoutWithSpeed:0.3 completion:nil];
    [scroller layoutWithSpeed:0.3 completion:nil];
    
    // scroll

     [scroller scrollToView:box withMargin:8];
    
}

-(void) leftButtonClick {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
