//
//  ProxyViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "ProxyViewController.h"
#import "JKProxy.h"


@interface ProxyViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        JKProxy *proxy = [[JKProxy alloc] initWithTarget:self];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:proxy selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Proxy.timer🌹🌹🌹");
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

// Proxy利用 消息转发机制,即:timer的target=proxy,去proxy里找sel,没有找到,通过消息转发引导self
// 注意必须在析构方法里废止timer,否则selfdealloc后,存在crash
- (void)dealloc {
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"👌👌%@--%@👌👌", self.timer, valid);
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"👌👌👌Proxy.dealloc👌");
}

@end
