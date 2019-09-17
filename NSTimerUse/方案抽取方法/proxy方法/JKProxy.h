//
//  BGProxy.h
//  NSTimerUse
//
//  Created by zhbb on 2018/5/18.
//  Copyright © 2018 zhbb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKProxy : NSProxy
@property (nonatomic, weak, readonly) id weakTarget;

+ (instancetype)proxyWithTarget:(id)target;
- (instancetype)initWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
