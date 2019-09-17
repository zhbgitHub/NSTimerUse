//
//  BlockViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "BlockViewController.h"
#import "NSTimer+Safe.h"

@interface BlockViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer jk_scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer *timer) {
            [weakSelf timerAction:timer];
        }];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Block.timer=%@🌹🌹🌹",timer);
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

// block方法简洁利用了类方法原理,将timer.target变为NSTimer,timer/self打破循环引用,当self析构后,必须废止timer,将timer从runloop中移除,避免资源浪费
- (void)dealloc {
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"👌👌%@--%@👌👌", self.timer, valid);
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"👌👌👌Block.dealloc👌");
}

@end
