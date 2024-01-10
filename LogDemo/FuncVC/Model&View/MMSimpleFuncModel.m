//
//  MMSimpleFuncModel.m
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncModel.h"

@implementation MMSimpleFuncModel

@synthesize onDebugInfo, testKey;

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[MMSimpleFuncModel class]]) {
        return false;
    }
    MMSimpleFuncModel *model = object;
    return [self.keyType isEqual:model.keyType];
}

//- (id)copy {
//    MMSimpleFuncModel *model = [MMSimpleFuncModel new];
//    model.keyType = _keyType;
//    model.type = _type;
//    model.content = _content;
//    return model;
//}

- (id)copyWithZone:(NSZone *)zone {
    MMSimpleFuncModel *model = [MMSimpleFuncModel new];
    model.keyType = _keyType;
    model.type = _type;
    model.content = _content;
    return model;
}

- (void)resgister {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receviewNofitfy:) name:@"test" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receviewNofitfy:) name:@"test" object:@{@"send_key":@"send_value"}];

}
- (void)postNotify {
    NSLog(@"发送");
    NSNotification *notify = [[NSNotification alloc] initWithName:@"test" object:@{@"key1":@"value1"} userInfo:@{@"user_key1":@"user_value1"}];
    [[NSNotificationCenter defaultCenter] postNotification:notify];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"发送1");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:@{@"key2":@"value2"}];
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                NSLog(@"发送2");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:@{@"key3":@"value3"} userInfo:@{@"user_key3":@"user_value3"}];

            });
//        });
        
    });
    
    

}
- (void)receviewNofitfy:(id)sender {
    NSLog(@"接收-%@",[NSThread currentThread]);
    NSLog(@"%@",sender);
    
}

- (void)testSetReadStr {
    _readStr = @"test";
}

+ (NSDictionary *)transNameDirectionDic
{
    return @{
             @"auto":@"自动检测语言",
             @"en":@"英文",
             @"ja":@"日文",
             @"ko":@"韩文",
             @"fr":@"法文",
             @"ru":@"俄文",
             @"es":@"西班牙文",
             @"da":@"丹麦文",
             @"nl":@"荷兰文",
             @"de":@"德文",
             @"el":@"希腊文",
             @"hu":@"匈牙利文",
             @"it":@"意大利文",
             @"pt":@"葡萄牙文",
             @"zh-CHS":@"中文(简体)",
             @"zh-CHT":@"中文(繁体)",
             @"cs":@"捷克文",
             @"fi":@"芬兰文",
             @"no":@"挪威文",
             @"pl":@"波兰文",
             @"sv":@"瑞典文",
             @"tr":@"土耳其文",
             
             @"vi" : @"越南文",
             @"id" : @"印度尼西亚文",
             @"hi" : @"印地文",
             @"ta" : @"泰米尔文",
             @"bn" : @"孟加拉文",
             @"mr" : @"马拉地文",
             @"ur" : @"乌尔都文",
             @"tl" : @"菲律宾文",
             @"ne" : @"尼泊尔文"
             };
}
- (void)sayHello:(void(^)())callback {
    self.helloBlock = callback;
    NSLog(@"hello");
}

- (void)dealloc {
    NSLog(@"%@",[NSThread currentThread]);
}


@end
