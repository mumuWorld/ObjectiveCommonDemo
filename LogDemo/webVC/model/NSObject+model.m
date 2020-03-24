//
//  NSObject+model.m
//  myLaya
//
//  Created by YangJie on 2017/7/25.
//  Copyright © 2017年 myLaya. All rights reserved.
//

#import "NSObject+model.h"
#import <objc/message.h>

@implementation NSObject (model)

/**
 将传过来的字典转成模型

 @param dict
 @return model
 */
+ (instancetype)L3gamef_modelWithDict:(NSDictionary *)dict
{
    id objc = [[self alloc] init];
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        NSString *key = [ivarName substringFromIndex:1];
        
        id value = dict[key];
        
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
