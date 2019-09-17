//
//  ViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "ViewController.h"
#import "ReasonViewController.h"
#import "DirectViewController.h" //iOS10 出来的 timer.block构建方式
#import "Direct0ViewController.h" //自定义NavigationController,重写pop方法
#import "Direct1ViewController.h" //self:重写viewDidDisappear
#import "ClassViewController.h"
#import "ProxyViewController.h"
#import "BlockViewController.h"
#import "RuntimeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //0.原因
    UIButton *reasonBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    reasonBtn.backgroundColor = UIColor.redColor;
    [reasonBtn setTitle:@"Reason" forState:UIControlStateNormal];
    [reasonBtn addTarget:self action:@selector(clickedReasonButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:reasonBtn];
    
    //1.直接方法
    UIButton *directBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 160, 100, 44)];
    directBtn.backgroundColor = UIColor.redColor;
    [directBtn setTitle:@"Direct" forState:UIControlStateNormal];
    [directBtn addTarget:self action:@selector(clickedDirectButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:directBtn];
    
    
    //2.类方法
    UIButton *classBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 220, 100, 44)];
    classBtn.backgroundColor = UIColor.redColor;
    [classBtn setTitle:@"Class" forState:UIControlStateNormal];
    [classBtn addTarget:self action:@selector(clickedClassButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:classBtn];
    
    //3.Block
    UIButton *blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 280, 100, 44)];
    blockBtn.backgroundColor = UIColor.redColor;
    [blockBtn setTitle:@"Block" forState:UIControlStateNormal];
    [blockBtn addTarget:self action:@selector(clickedBlockButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:blockBtn];
    
    //4.Proxy
    UIButton *proxyBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 340, 100, 44)];
    proxyBtn.backgroundColor = UIColor.redColor;
    [proxyBtn setTitle:@"Proxy" forState:UIControlStateNormal];
    [proxyBtn addTarget:self action:@selector(clickedProxyButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:proxyBtn];
    
    //5.Proxy
    UIButton *runtimeBtn = [[UIButton alloc] initWithFrame:CGRectMake(70, 400, 100, 44)];
    runtimeBtn.backgroundColor = UIColor.redColor;
    [runtimeBtn setTitle:@"RunTime" forState:UIControlStateNormal];
    [runtimeBtn addTarget:self action:@selector(clickedRunTimeButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:runtimeBtn];
}

- (void)clickedDirectButton:(UIButton *)sender {
    //iOS10 出来的 timer.block构建方式
    DirectViewController *toVc = [[DirectViewController alloc] init];
    [self.navigationController pushViewController:toVc animated:YES];
    
    //自定义NavigationController,重写pop方法
    //    Direct0ViewController *toVc = [[Direct0ViewController alloc] init];
    //    [self.navigationController pushViewController:toVc animated:YES];
    
    //self:重写viewDidDisappear
    //    Direct1ViewController *toVc = [[Direct1ViewController alloc] init];
    //    [self.navigationController pushViewController:toVc animated:YES];
}

- (void)clickedReasonButton:(UIButton *)sender {
    ReasonViewController *toVc = [[ReasonViewController alloc] init];
    [self.navigationController pushViewController:toVc animated:YES];
}

- (void)clickedClassButton:(UIButton *)sender {
    ClassViewController *toVc = [[ClassViewController alloc] init];
    [self.navigationController pushViewController:toVc animated:YES];
}

- (void)clickedBlockButton:(UIButton *)sender {
    BlockViewController *toVc = [[BlockViewController alloc] init];
    [self.navigationController pushViewController:toVc animated:YES];
}

- (void)clickedProxyButton:(UIButton *)sender {
    ProxyViewController *toVc = [[ProxyViewController alloc] init];
    [self.navigationController pushViewController:toVc animated:YES];
}

- (void)clickedRunTimeButton:(UIButton *)sender {
    RuntimeViewController *toVc = [[RuntimeViewController alloc] init];
    [self.navigationController pushViewController:toVc animated:YES];
}

@end
