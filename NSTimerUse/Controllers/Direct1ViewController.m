//
//  Direct1ViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "Direct1ViewController.h"
#import "UIViewController+Pop.h"

@interface Direct1ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation Direct1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

// viewDidDisappear:做timer的销毁操作
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"viewDidDisappear: %@--%@ ", self.timer, valid);
    [self.timer invalidate];
    self.timer = nil;
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Direct1.timer🌹🌹🌹");
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
    NSLog(@"👌👌👌Direct1.dealloc👌");
}

@end
