
//
//  ClassViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "ClassViewController.h"
#import "NSTimerHandle.h"

@interface ClassViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        self.timer = [NSTimerHandle scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Class.timer🌹🌹🌹");
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

// 类方法,将timer.target变为NSTimerHandle,handle实例弱引用timer,self/timer打破循环引用,当self析构后,这时handle.target == nil, timer再次调用循环方法,判断handle.target是否为nil, 为nil:handle废止timer, timer从runloop中移除,并释放占用资源target(handle).
// 故此不需要额外的废止,无非就是消息多走了一次
- (void)dealloc {
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"👌👌%@--%@👌👌", self.timer, valid);
//    [self.timer invalidate];
//    self.timer = nil;
    NSLog(@"👌👌👌Class.dealloc👌");
}

@end
