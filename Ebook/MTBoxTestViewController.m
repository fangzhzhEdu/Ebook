//
//  MTBoxTestViewController.m
//  Ebook
//
//  Created by ydf on 13-7-19.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "MTBoxTestViewController.h"
#import <MGBox.h>
#import "MGScrollView.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"
#import "config.h"
@interface MTBoxTestViewController ()

@end



@implementation MTBoxTestViewController
{
    MGBox *photosGrid, *tablesGrid, *table1, *table2;
    UIImage *arrow;

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
	
//    MGScrollView *scroller = [MGScrollView scrollerWithSize:self.view.bounds.size];
//    [self.view addSubview:scroller];
    
//    // the subsections table
//    table2 = MGBox.box;
//    [self.scroller.boxes addObject:table2];
//    table2.sizingMode = MGResizingShrinkWrap;
//    
//    // empty table2 out
//    [table2.boxes removeAllObjects];
//    
//    // make the section
//    MGTableBoxStyled *section = MGTableBoxStyled.box;
//    [table2.boxes addObject:section];
//    
//    // header
//    MGLineStyled *head1 = [MGLineStyled lineWithLeft:@"Tables" right:nil size:ROW_SIZE];
//    [section.topLines addObject:head1];
//    head1.font = HEADER_FONT;
//    
//    id waffle1 = @"Similar to **UITableView**, but without the awkward "
//    "design patterns.\n\n"
//    "Create a table section, add some rows to it, and you're done.\n\n"
//    "Add or remove rows or sections simply by adding/removing them from their "
//    "containing box.|mush";
//    
//    // stuff
//    MGLineStyled *waf1 = [MGLineStyled multilineWithText:waffle1 font:nil width:304
//                                                 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
//    [section.topLines addObject:waf1];
//    
//    // header
//    MGLineStyled
//    *head2 = [MGLineStyled lineWithLeft:@"Table Rows" right:nil size:ROW_SIZE];
//    [section.topLines addObject:head2];
//    head2.font = HEADER_FONT;
//    
//    id waffle2 = @"**MGLine** provides a quick, no nonsense interface for building "
//    "table rows with left, middle, and right content, as "
//    "well as rows with multiline text.\n\n"
//    "**NSString** and **UIImage** objects can be added directly to an **MGLine** "
//    "and will be automatically wrapped in a **UILabel** or **UIImageView**.|mush";
//    
//    // stuff
//    MGLineStyled *waf2 = [MGLineStyled multilineWithText:waffle2 font:nil width:304
//                                                 padding:UIEdgeInsetsMake(16, 16, 16, 16)];
//    [section.topLines addObject:waf2];
//    
//    // animate
//    [table2 layoutWithSpeed:0.3 completion:nil];
//    [self.scroller layoutWithSpeed:0.3 completion:nil];
//    
//    // scroll
//    [self.scroller scrollToView:section withMargin:8];
//    
    [self test2];
    
}
-(void) test1
{
    MGTableBoxStyled *section = MGTableBoxStyled.box;
    [self.scroller.boxes addObject:section];
    // a default row size
    CGSize rowSize = (CGSize){304, 40};
    
    // a header row
    MGLineStyled *header = [MGLineStyled lineWithLeft:@"My First Table" right:nil size:rowSize];
    header.leftPadding = header.rightPadding = 16;
    [section.topLines addObject:header];
    
    // a string on the left and a horse on the right
    MGLineStyled *row1 = [MGLineStyled lineWithLeft:@"Left text"
                                              right:[UIImage imageNamed:@"horse.png"] size:rowSize];
    [section.topLines addObject:row1];
    
    // a string with Mush markup
    MGLineStyled *row2 = MGLineStyled.line;
    row2.multilineLeft = @"This row has **bold** text, //italics// text, __underlined__ text, "
    "and some `monospaced` text. The text will span more than one line, and the row will "
    "automatically adjust its height to fit.|mush";
    row2.minHeight = 40;
    [section.topLines addObject:row2];
    [self.scroller layoutWithSpeed:0.3 completion:nil];
}

-(void) test2
{
    MGScrollView *scroller = self.scroller;
    MGBox *grid = [MGBox boxWithSize:self.view.bounds.size];
    grid.contentLayoutMode = MGLayoutGridStyle;
    [scroller.boxes addObject:grid];
    
    
    
    
    
    UIImage *add = [UIImage imageNamed:@"p1"];
    UIImageView *addView = [[UIImageView alloc] initWithImage:add];
    addView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin;
   addView.contentMode = UIViewContentModeScaleToFill ; 
    
    MGBox *box = [MGBox boxWithSize:(CGSize){340, 460}];
    box.leftMargin = box.topMargin = 10;
//    addView.bounds = CGRectMake(0, 0, 100,100);
    
    addView.frame = CGRectMake(0,0 , 340, 460);
    
    
    [box addSubview:addView];
    [grid.boxes addObject:box];
    
    
    
    
    
    // add ten 100x100 boxes, with 10pt top and left margins
    for (int i = 0; i < 10; i++) {
//        MGBox *box = [MGBox boxWithSize:(CGSize){340, 460}];
        MGTableBoxStyled *box = MGTableBoxStyled.box;
        box.leftMargin = box.topMargin = 10;
        [grid.boxes addObject:box];
        
        box.borderColors = UIColor.redColor;
        
        // individual colours (order is top, left, bottom, right)
        box.borderColors = @[
                             UIColor.redColor, UIColor.greenColor,
                             UIColor.blueColor, UIColor.blackColor
                             ];
        MGLine *line1 = [MGLine lineWithMultilineLeft:@"a long string on the left"
                                                right:[UIImage imageNamed:@"iweekly"] width:320 minHeight:40];
        [box.topLines addObject: line1];
    }
    
    // add the add image
    
  
    
    
    [grid layoutWithSpeed:0.3 completion:nil];
    [scroller layoutWithSpeed:0.3 completion:nil];
    [scroller scrollToView:grid withMargin:10];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
