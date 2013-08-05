//
//  PageType1ViewController.m
//  Ebook
//
//  Created by ydf on 13-8-5.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "PageType1ViewController.h"

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
    [self.navigationController.navigationBar setHidden: YES ];
    [self initi ] ;
    
}
-(void) initi
{
           
        UIImageView *imgview = [[UIImageView  alloc] initWithFrame:self.view.frame];
        NSString *fileURL = self.thePage[@"image2x"] ;
        NSLog(@"file url is : %@" ,fileURL ) ;
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
        
        UIImage *image  = [UIImage imageWithData:data];
        
        [imgview setImage:image];
    
        [self.view addSubview:imgview ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
