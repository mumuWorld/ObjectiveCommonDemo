//
//  MMSimpleFuncModel+MMExtension.m
//  LogDemo
//
//  Created by mumu on 2020/11/30.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncModel+MMExtension.h"
#import <objc/runtime.h>

static const void *DisasterCityKey = &DisasterCityKey;

@implementation MMSimpleFuncModel (MMExtension)

- (void)setDisasterCity:(BOOL)disasterCity {
    objc_setAssociatedObject(self, DisasterCityKey, @(disasterCity), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)disasterCity {
    id obj = objc_getAssociatedObject(self, DisasterCityKey);
    return  obj ? [obj boolValue] : NO;
}
@end
