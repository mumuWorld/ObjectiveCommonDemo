//
//  MMSimpleFuncModel.m
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncModel.h"

@implementation MMSimpleFuncModel
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
@end
