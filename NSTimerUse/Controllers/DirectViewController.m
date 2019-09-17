//
//  DirectViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "DirectViewController.h"

@interface DirectViewController ()
@property (nonatomic, strong) NSTimer *timer;
//@property (nonatomic, weak) NSTimer *timer;
@end

@implementation DirectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf timerAction: timer];
        }];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Direct.timer🌹🌹🌹");
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

// iOS10之后API必须加上废止
- (void)dealloc {
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"👌👌%@--%@👌👌", self.timer, valid);
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"👌👌👌Direct.dealloc👌");
}

@end
