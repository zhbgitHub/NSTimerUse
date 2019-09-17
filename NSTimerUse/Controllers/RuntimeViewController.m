//
//  RuntimeViewController.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>

@interface RuntimeViewController ()
@property (nonatomic, strong) NSTimer *timer;
//@property (nonatomic, weak) NSTimer *timer;
@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)clickedStartButton:(UIButton *)sender {
    if (self.timer == nil) {
        NSObject *target = [[NSObject alloc] init];
        class_addMethod([target class], @selector(timerAction:), class_getMethodImplementation([self class], @selector(timerAction:)), "v24@0:8@16");
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:target selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}

- (void)timerAction:(NSTimer *)timer {
    NSLog(@"🌹🌹🌹Runtime.timer==%@--self=%@🌹🌹🌹", timer, self);
}

- (void)setup {
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 44)];
    startBtn.backgroundColor = UIColor.redColor;
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickedStartButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:startBtn];
}

//注意Runtime这种方式,必须调用废弃方法,因为:timer的target变为NSObject的一个临时实例,虽然避免self与timer的相互引用,但timer依然在runloop中,timer.target(即NSObject的临时实例),这个实例具有timerAction:方法,二者均未必释放掉.
//避免资源占用,浪费
- (void)dealloc {
    NSString *valid = self.timer.isValid ? @"可用" : @"废弃";
    NSLog(@"👌👌%@--%@👌👌", self.timer, valid);
    [self.timer invalidate];//请求runloop移除timer,timer被移除,timer所占用资源才被释放
    self.timer = nil;
    NSLog(@"👌👌👌Runtime.dealloc👌");
}

@end
