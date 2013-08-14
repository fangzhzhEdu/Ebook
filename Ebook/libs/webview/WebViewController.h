//
//  WebViewController.h
//  galaxy
//
//  Created by yangdengfeng on 13-1-23.
//  Copyright (c) 2013年 itoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) UIWebView                 *webView;
@property (strong, nonatomic) UIToolbar                 *toolBar;

@property (strong, nonatomic) NSURL                         *url; 

@property (strong, nonatomic) NSDictionary                  *params;
@property (strong, nonatomic) NSDictionary                  *query;
@property ( nonatomic) BOOL                               isLocal;  //用于加载本地的html文件
@property (strong, nonatomic) NSString                    *localHtml;
@property (strong, nonatomic) NSString                    *localImage;

@property ( nonatomic) BOOL                               isHideButtomNavBar;  //
@property ( nonatomic) BOOL                               isHideNavBar;  //

- (void)loadRequest;
- (void)reloadToolBar;


@end
