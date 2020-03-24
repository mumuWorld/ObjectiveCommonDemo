//
//  MMPredicateTest.m
//  LogDemo
//
//  Created by mumu on 2020/1/2.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMPredicateTest.h"

@implementation MMPredicateTest

- (void)compareTest {
    NSNumber *testNumber = @123;
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BETWEEN {100, 200}"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF <> 123"];

        if ([predicate evaluateWithObject:testNumber]) {
            NSLog(@"testString:%@", testNumber);
        } else {
            NSLog(@"不符合条件");
        }
}

- (void)emailCheckTest:(NSString *)emailStr {
//    NSString *emailStr = @"439857940@qq..com";
//    NSPredicate *rule = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ];
//    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *emailRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    
//    NSString *emailRegex = @"\\b([a-zA-Z0-9%_.+\\-]+)@\\w+([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b";
    NSPredicate *rule = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];

    BOOL isNormal = [rule evaluateWithObject:emailStr];
    
    BOOL isNormal2 = [self specialEmailCheckRight:emailStr];
    NSLog(@"checkEmail=%@ \n isNormal=%d,isNormal2=%d",emailStr,isNormal,isNormal2);
}

/// 特殊邮箱校验 962
/// @param emailStr string
- (BOOL)specialEmailCheckRight:(NSString *)emailStr {
    NSArray *arr = [emailStr componentsSeparatedByString:@"."];
    NSString *suffixStr = @"";
    if (arr.count < 2) { //格式不正确
        return false;
    } else if (arr.count > 2) { // xxx@163.com.cn
        NSMutableString *mutStr = [NSMutableString new];
        for (int i = 1; i < arr.count; i++ ) {
            if (i != 1) {
                [mutStr appendString:@"."];
            }
            NSString *subContent = arr[i];
            [mutStr appendString:subContent.length == 0 ? @"." : subContent];
        }
        suffixStr = [mutStr copy];
    } else {
        suffixStr = arr.lastObject;
    }
    NSLog(@"pre=%@,sufix=%@",suffixStr,emailStr);
    if ([emailStr containsString:@"@qq"] || [emailStr containsString:@"@gmail"] || [emailStr containsString:@"@139"]) {
        return [suffixStr isEqualToString:@"com"];
    } else if ([emailStr containsString:@"@163"]) {
        return [suffixStr isEqualToString:@"com"] || [suffixStr isEqualToString:@"net"] || [suffixStr isEqualToString:@"com.cn"] || [suffixStr isEqualToString:@"vip.com"];
    } else if ([emailStr containsString:@"@126"]) {
        return [suffixStr isEqualToString:@"com"] || [suffixStr isEqualToString:@"com.cn"];
    } else if ([emailStr containsString:@"@hotmail"]) {
        return [suffixStr isEqualToString:@"com"] || [suffixStr isEqualToString:@"co.uk"] || [suffixStr isEqualToString:@"fr"] || [suffixStr isEqualToString:@"de"];
    } else if ([emailStr containsString:@"@sina"]) {
        return [suffixStr isEqualToString:@"com"] || [suffixStr isEqualToString:@"cn"] || [suffixStr isEqualToString:@"com.cn"];
    }
    return true;
}

- (void)findMatchString {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"未使用图片" ofType:@"txt"];
    NSString *textString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSString *regexStr = @"/Users/liyu/elongtravel/Pods/eLongResource/InterHotel.xcassets/[\\w\\s]+.imageset";
    NSString *regexStr2 = @"/[\\w\\s]+[.]imageset";

    NSArray *regArr = [self matchString:textString toRegexString:regexStr];
    
    NSLog(@"~~~~~~~~~~regArr:%ld",regArr.count);
    for (int i=0; i<regArr.count; i++) {
        NSString *str = regArr[i];
        NSArray *regArr2 = [self matchString:str toRegexString:regexStr2];
//        NSLog(@"分割之后的正则表达式的内容为：%@~~~~~~~~字数：%lu",regArr[i],(unsigned long)str.length);
        NSLog(@"最终字符串----->%@",regArr2.firstObject);
    }
    NSLog(@"arr=%@",regArr);
    NSLog(@"arr=%@",regArr);
}

- (NSArray *)matchString:(NSString *)string toRegexString:(NSString *)regexStr {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    //match: 所有匹配到的字符,根据() 包含级
    NSMutableArray *array = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        for (int i = 0; i < [match numberOfRanges]; i++) {
            //以正则中的(),划分成不同的匹配部分  这里会莫名其妙的遍历两次，导致输出两个
//            相同的数据，我们可以像下面这样只取第一个值，也可以不进行遍历，直接取出来第一
//            个值。
            NSLog(@"~~~~~~~~~~~~[match numberOfRanges]:%lu",(unsigned long)[match numberOfRanges]);
            if (i == 0) {
                NSString *component = [string substringWithRange:[match rangeAtIndex:i]];
                
                [array addObject:component];
                break;
            }

        }
    }
    
    return array;
}
@end
