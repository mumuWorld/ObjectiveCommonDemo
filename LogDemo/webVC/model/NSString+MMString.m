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
@end
