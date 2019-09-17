
//
//  ReasonViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "ReasonViewController.h"

@interface ReasonViewController ()
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation ReasonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Reason.timer🌹🌹🌹");
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

- (void)dealloc {
    NSLog(@"👌👌👌Reason.dealloc👌");
    [self.timer invalidate];
    self.timer = nil;
}

@end
