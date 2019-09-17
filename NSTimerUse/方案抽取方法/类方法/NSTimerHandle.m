//
//  NSTimerHandle.m
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import "NSTimerHandle.h"

@implementation NSTimerHandle

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo
{
    NSTimerHandle *handle = [[NSTimerHandle alloc] init];
    handle.timer = [NSTimer timerWithTimeInterval:ti target:handle selector:@selector(timerSelector:) userInfo:userInfo repeats:yesOrNo];
    handle.target = aTarget;
    handle.selector = aSelector;
    return handle.timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo
{
    NSTimerHandle *handle = [[NSTimerHandle alloc] init];
    handle.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:handle selector:@selector(timerSelector:) userInfo:userInfo repeats:yesOrNo];
    handle.target = aTarget;
    handle.selector = aSelector;
    return handle.timer;
}


- (void)timerSelector:(NSTimer *)tempTimer {
    if (self.target && [self.target respondsToSelector:self.selector]) {
        IMP imp = [self.target methodForSelector:self.selector];
        void (*func)(id, SEL) = (void *)imp;
        func(self.target, self.selector);
    }else {
        [self.timer invalidate];
    }
}
@end
