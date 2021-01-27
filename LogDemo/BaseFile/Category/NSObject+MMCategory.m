//
//  NSObject+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "NSObject+MMCategory.h"

#import <objc/runtime.h>


@implementation NSObject (MMCategory)
+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
    
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSEL,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
/*
@brief 交换不同类中两个  对象方法    友好提示:自定义的方法可以写在任何的自定义类中 ）
@param originalCls 被交换的类
@param swizzledCls 用来交换的类
@param originalSelector 被交换的方法
@param swizzledSelector 用来交换的方法
  */
void mm_swizzleDifferentClassInstanceMethod(Class originalCls,Class swizzledCls,SEL originalSelector, SEL swizzledSelector) {
    if (!originalCls || !swizzledCls) {
        NSLog(@"交换方法失败--请保证交换的类名不为空");
        return;
    }
    
    if (!originalSelector || !swizzledSelector) {
        NSLog(@"交换方法失败--请保证交换的方法名不为空");
        return;
    }
    
    Method originalMethod = class_getInstanceMethod(originalCls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledCls, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(originalCls,
                                        swizzledSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) { //交换方法实现。
        method_exchangeImplementations(originalMethod, class_getInstanceMethod(originalCls, swizzledSelector));
    } else {
        NSLog(@"交换方法失败--添加方法失败");
    }
}
/*  交换类方法
 OBJC_EXPORT Method _Nullable
 class_getInstanceMethod(Class _Nullable cls, SEL _Nonnull name)
 OBJC_EXPORT Method _Nullable
 class_getClassMethod(Class _Nullable cls, SEL _Nonnull name)
 */
void mm_exchangeClassMethod(Class originalCls,Class swizzledCls,SEL originalSelector, SEL swizzledSelector) {
    
    Method originalMethod = class_getClassMethod(originalCls, originalSelector);
    Method swizzledMethod = class_getClassMethod(swizzledCls, swizzledSelector);
    
    //获取元类对象
    object_getClass([originalCls class]);
    class_getClassMethod(originalCls, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(originalCls,
                                        swizzledSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        method_exchangeImplementations(originalMethod, class_getInstanceMethod(originalCls, swizzledSelector));
    } else {
        
    }

}
@end
