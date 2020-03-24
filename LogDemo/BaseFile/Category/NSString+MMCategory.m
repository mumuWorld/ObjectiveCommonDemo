//
//  NSString+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/1/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "NSString+MMCategory.h"

@implementation NSString (MMCategory)

- (NSArray *)matchStringWithRegularRule:(NSString *)regularStr {
    if (self.length == 0) {
        return nil;
    }
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    if (!matches) {
        return nil;
    }
    //match: 所有匹配到的字符
    NSMutableArray *array = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        if ([match numberOfRanges] > 0) { //匹配第一个
            NSString *component = [self substringWithRange:[match rangeAtIndex:0]];
            [array addObject:component];
        }
    }
    return [array copy];
}

@end
