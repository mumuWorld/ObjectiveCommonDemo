//
//  ELHotelDispatchTimer.h
//  eLongHotel
//
//  Created by mumu on 2020/6/4.
//  Copyright © 2020 elong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
///定时器回调block
typedef void(^ELHotelTimerTask)(NSString *timer);

@interface ELHotelDispatchTimer : NSObject

///  构造定时器 
/// @param task block 任务
/// @param startT 多少秒后执行
/// @param interval 重复时间
/// @param isRepeat 是否重复
/// @param isAsync 是否异步
/// @return 对应的timer的key 取消定时器使用
+ (NSString *)excuTimerTask:(ELHotelTimerTask)task andStart:(NSTimeInterval)startT interval:(NSTimeInterval)interval repeats:(BOOL)isRepeat async:(BOOL)isAsync;

///   sel定时器
/// @param task SEL
/// @param target target
/// @param startT 多少秒后执行
/// @param interval 重复时间
/// @param isRepeat 是否重复
/// @param isAsync 是否异步
/// @return 对应的timer的key 取消定时器使用
+ (NSString *)excuTimerSelector:(SEL)task target:(id)target andStart:(NSTimeInterval)startT interval:(NSTimeInterval)interval repeats:(BOOL)isRepeat async:(BOOL)isAsync;

/// 取消定时器
/// @param name key
+ (void)cancelTimerTask:(NSString *)timerName;

@end

NS_ASSUME_NONNULL_END
