/*
 * ----------------------------------------------------------------------------
 * "THE BOOZE-WARE LICENSE"
 * Simon Rice wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me an alcoholic beverage in return.
 *
 * Simon Rice
 * ----------------------------------------------------------------------------
 */

#import "InitialViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController



- (id)initWithCoder:(NSCoder *)aDecoder
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *centerController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    centerController = [[UINavigationController alloc] initWithRootViewController:centerController];
    centerController.navigationController.navigationBarHidden = YES ;

    self = [super initWithCenterViewController:centerController
                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"]];
    if (self) {
        // Add any extra init code here
        self.leftSize =   50;
    }
    return self;
}


@end
