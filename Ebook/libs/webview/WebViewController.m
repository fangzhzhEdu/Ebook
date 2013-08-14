//
//  WebViewController.m
//  galaxy
//
//  Created by yangdengfeng on 13-1-23.
//  Copyright (c) 2013年 itoc. All rights reserved.
//

#import "WebViewController.h"
//#import "MyUtil.h"
@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"";
         
    }
    return self;
}

 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
     
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (nil == self.webView) {
        
        float webview_height=0;
        float y = 0 ;
        if( self.isHideButtomNavBar ==NO)
        {
            [self.navigationController.navigationBar setHidden: NO];
             webview_height=self.view.frame.size.height - 44.0f ;
        }
        else
        {
            [self.navigationController.navigationBar setHidden: YES];
            webview_height=self.view.frame.size.height  ; 
        }
        if( self.isHideNavBar ==NO)
        {
            webview_height = webview_height-44.0f ;
           // y = 44.0f ;
        }
       
        
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f, y, self.view.frame.size.width, webview_height)];
        self.webView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
        self.webView.multipleTouchEnabled = NO;
        self.webView.scalesPageToFit = YES;
        self.webView.delegate = self;
        self.webView.autoresizesSubviews = YES;
        
        [self.view addSubview:self.webView];
    }
    
    self.localHtml = @"<!DOCTYPE html>  <html><head><meta charset=\"utf-8\"></head><body> <img src=\"data:image/png;base64,%@\"  /> </body></html>";
    if( self.isHideButtomNavBar ==NO)
    {
        [self initToolBar];
    }
	[self loadRequest];
    
    
}

- (void)loadRequest {
 
    if( self.isLocal ==YES)
    {
        self.localHtml = [NSString stringWithFormat:self.localHtml , self.localImage ];
        [self loadLocal];
    }
    else
    {
        if( self.url ==nil || [[NSNull null] isEqual:self.url] )
        {
            
        }
         
         NSMutableURLRequest *requestObj = [NSMutableURLRequest requestWithURL:self.url];
        
        [self.webView loadRequest:requestObj];
    }
    
}
-(void)loadLocal
{
    self.webView.scalesPageToFit = NO;

    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
   // NSString  *htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:self.localHtml ofType:@"html"]  encoding:NSUTF8StringEncoding error:nil];
    NSString *htmlString =self.localHtml;
    
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
}
#pragma mark - toolBar

- (void)initToolBar {
//    NSLog(@" view.y:%f view.height: %f" , self.view.frame.origin.y,self.view.frame.size.height);
//    NSLog(@" webview.y:%f view.height: %f" , self.webView.frame.origin.y,self.webView.frame.size.height);
  
    float y = self.webView.frame.origin.y +self.webView.frame.size.height ;
    //self.view.frame.origin.y + self.view.frame.size.height - 43.0f
	if (nil == self.toolBar) {
		self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f,  y , 320.0f, 44.0f)];
		self.toolBar.tintColor = [UIColor blackColor]; //[UIColor darkGrayColor];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"goBackItem.png"]
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(goBack)];
        UIBarButtonItem *fowardItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"goForwardItem.png"]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(goForward)];
        UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                     target:self
                                                                                     action:@selector(refresh)];
        UIBarButtonItem *stopItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                  target:self
                                                                                  action:@selector(stop)];
        backItem.enabled = NO;
        fowardItem.enabled = NO;
        refreshItem.enabled = NO;
        stopItem.enabled = NO;
 

        
        [self.toolBar setItems:[NSArray arrayWithObjects:
                                backItem,
                                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                                fowardItem,
                                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                                refreshItem,
                                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                                stopItem,
                                nil
                                ]];
        
        [self.view addSubview:self.toolBar];
    }
}

- (void)reloadToolBar {
	if (self.webView.canGoBack) {
		[[[self.toolBar items] objectAtIndex:0] setEnabled:YES];
	}
	else {
		[[[self.toolBar items] objectAtIndex:0] setEnabled:NO];
	}
	
	if (self.webView.canGoForward) {
		[[[self.toolBar items] objectAtIndex:2] setEnabled:YES];
	}
	else {
		[[[self.toolBar items] objectAtIndex:2] setEnabled:NO];
	}
    
	if (self.webView.loading) {
		[[[self.toolBar items] objectAtIndex:6] setEnabled:YES];
		[[[self.toolBar items] objectAtIndex:4] setEnabled:NO];
	}
	else {
		[[[self.toolBar items] objectAtIndex:6] setEnabled:YES];
		[[[self.toolBar items] objectAtIndex:4] setEnabled:YES];
	}
}

#pragma mark - action

- (void)goBack {
	[self.webView goBack];
}

- (void)goForward {
	[self.webView goForward];
}

- (void)refresh {
	[self.webView reload];
}

- (void)stop {
    if (self.webView.loading) {
        [self.webView stopLoading];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - default method
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if( self.isHideNavBar ==NO)
    {
         [self.navigationController setNavigationBarHidden:NO animated:animated];
        self.navigationController.navigationBar.backgroundColor = [UIColor grayColor] ;

    }
    else
    {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
//        [self.navigationController.navigationBar setHidden: YES];
        self.navigationController.navigationBar.backgroundColor = [UIColor grayColor] ;
    }
    
    NSLog(@"bar height: %f" , self.navigationController.navigationBar.frame.size.height);
 
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
   
}
- (void)viewDidUnload {
    
    self.webView = nil;
    self.toolBar = nil ;
    self.localHtml = nil ;
    self.localImage = nil ;
    
    [super viewDidUnload];
}
#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self reloadToolBar];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self reloadToolBar];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self reloadToolBar];
}
@end
