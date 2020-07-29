//
//  MMGenerateObjTool.m
//  LogDemo
//
//  Created by mumu on 2020/7/29.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMGenerateObjTool.h"
#import <objc/runtime.h>

@implementation MMGenerateObjTool
+ (void)generateJson:(Class)class {
    
    unsigned int ivarCount = 0;
    Ivar *ivarList = class_copyIvarList(class, &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
        Ivar ivar = ivarList[i];
        
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarName = [ivarName substringFromIndex:1];
        if ([ivarType hasSuffix:@"Array"] && [ivarType hasPrefix:@"NS"]) {
            Class modelClass = NSClassFromString(ivarType);
            [self generateJson:modelClass];
        } else if ([ivarType hasSuffix:@"Dictionary"] && [ivarType hasPrefix:@"NS"]) {
            Class modelClass = NSClassFromString(ivarType);
            [self generateJson:modelClass];
        }
        NSLog(@"name=%@,type=%@",ivarName,ivarType);
    }
    free(ivarList);
}
@end
