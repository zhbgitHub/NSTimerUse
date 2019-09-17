//
//  BGNavigationController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//
//  有无UIViewController+Pop.h无所谓,之所以抽为category,只是方便沟通,更好的解释ViewController多了个viewControllerWillPopByNavigationController方法

#import "JKNavigationController.h"
#import "UIViewController+Pop.h"

@interface JKNavigationController ()

@end

@implementation JKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self jk_popAction];
    return [super popViewControllerAnimated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self jk_popAction];
    return [super popToViewController:viewController animated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self jk_popAction];
    return [super popToRootViewControllerAnimated:animated];
}

- (void)jk_popAction
{
    UIViewController *vc = self.topViewController;
    if ([vc respondsToSelector:@selector(viewControllerWillPopByNavigationController)]) {
        [vc performSelector:@selector(viewControllerWillPopByNavigationController)];
    }
}

@end
