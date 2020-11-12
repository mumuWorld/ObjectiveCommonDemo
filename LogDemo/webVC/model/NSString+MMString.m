//
//  NSString+MMString.m
//  myLaya
//
//  Created by YangJie on 2017/8/31.
//  Copyright © 2017年 myLaya. All rights reserved.
//

#import "NSString+MMString.h"

@implementation NSString (MMString)

+ (NSString *)URLEncodedString:(NSString *)str
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)str,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}
+(NSString *)URLDecodedString:(NSString *)str
{
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}
- (NSString *(^)(id obj))appendObj {
    return ^NSString *(id obj){
        return [NSString stringWithFormat:@"%@%@",self,obj];
    };
}
//
- (NSString *(^)(va_list list))appendObjs2 {
    return ^NSString *(va_list list){
////        va_list args;
        NSMutableString *mutStr = [NSMutableString stringWithFormat:@"self"];
//        id tmpObj = nil;
//            va_start(list, tmpObj);
//            while ((tmpObj = va_arg(list, id))) {
//                [mutStr appendFormat:@"%@",tmpObj];
//            }
//            va_end(list);
//        }
        return [mutStr copy];
    };
}


- (NSString *(^)(id obj,...))appendObjs {
    return ^NSString *(id obj,...){
        va_list args;
        NSMutableString *mutStr = [NSMutableString stringWithFormat:@"%@%@",self,obj?:@""];
        if (obj) {
            va_start(args, obj);
            id tmpObj = nil;
            while ((tmpObj = va_arg(args, id))) {
                [mutStr appendFormat:@"%@",tmpObj];
            }
            va_end(args);
        }
        return [mutStr copy];
    };
}
@end
