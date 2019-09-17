
//
//  Direct0ViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//
//  不引用"UIViewController+Pop.h" 也可以, 只需要覆盖即可

#import "Direct0ViewController.h"

@interface Direct0ViewController ()
//@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation Direct0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

// 监听navigation的pop
- (void)viewControllerWillPopByNavigationController
{
    NSLog(@"%s", __func__);
    [self.timer invalidate];
    self.timer = nil;
}

// 开启timer,
- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Direct0.timer🌹🌹🌹");
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

// 在dealloc之前就已废止
- (void)dealloc {
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"👌👌%@--%@👌👌", self.timer, valid);
//    [self.timer invalidate];
//    self.timer = nil;
    NSLog(@"👌👌👌Direct0.dealloc👌");
}


@end
