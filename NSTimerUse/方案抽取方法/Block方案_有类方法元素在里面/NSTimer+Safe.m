//
//  NSTimer+Safe.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "NSTimer+Safe.h"

@implementation NSTimer (Safe)

+ (NSTimer *)jk_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(NSTimer*))block {
    NSTimer *timer = [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(timerAction:) userInfo:[block copy] repeats:yesOrNo];
    return timer;
}


+ (void)timerAction:(NSTimer *)timer {
    NSLog(@"⚠️勿忘在dealloc中调用invalidate");
    void (^block)(NSTimer *) =  timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
