//
//  MMSimpleFuncTestTool.m
//  LogDemo
//
//  Created by World on 2020/7/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncTestTool.h"
#import <CommonCrypto/CommonDigest.h>
#import "MMGCDTestTool.h"

static NSHashTable *table = nil;

@implementation MMSimpleFuncTestTool

+ (void)initialize {
    table = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
}


+ (void)test {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"detail" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"dict=%@",dict);
}

+ (BOOL)testPoint:(NSString **)str {
//    NSString *strTMp;
    @autoreleasepool {
//        strTMp = [[NSMutableString alloc] initWithString:@"change"];
//        NSMutableString *mStr = [[NSMutableString alloc] initWithString:@"change"];
//        *str = mStr;
//        *str = [[NSMutableString alloc] initWithString:@"change"];
        *str = @"change";
    }
    NSLog(@"p2->%@",*str);
//    NSLog(@"p2->%@,%@",*str,strTMp);
    return true;
}

+ (void)dictTest {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"test"] = nil;
}

+ (void)addTargetVC:(UIViewController *)target {
    [table addObject:target];
}

+ (void)printTable {
    NSLog(@"table =%@",table);
}

+ (void)invokeGCDTest {
    MMGCDTestTool *tool = [[MMGCDTestTool alloc] init];
    [tool testInvoke:^(int type, NSString * _Nonnull msg) {
        NSLog(@"收到回调-%@",msg);
    }];
    NSLog(@"发送消息");
}

+ (void)utfCode {
    NSString *str = @"文若";
    NSString *urlCode = @"&#x6587;&#x82E5;";
    NSString *XunYou = @"公达"; //&#x516C;&#x8FBE;
    NSString *JiaXu = @"文和"; //&#x6587;&#x548C;
    NSString *hString = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSString *XunYouUft = [XunYou stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *JiaXuUft = [JiaXu stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

//    NSString *hString = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *str5 = [hString stringByRemovingPercentEncoding];
    NSString *result_2 = [urlCode stringByRemovingPercentEncoding];
    NSLog(@"UTF-8编码:%@  解码：%@",hString,str5);
    NSLog(@"uft=%s",[str UTF8String]);
    
    NSMutableArray *arra = [NSMutableArray array];

//    [arra addObject:urlCode];
    [arra addObject:@"c86ee7bbbdba2cc2879728b800d13568"];
//    [arra addObject:XunYouUft];
//    [arra addObject:JiaXuUft];
//    [arra addObject:str];
//    [arra addObject:XunYou];
//    [arra addObject:JiaXu];
    NSString *str4 = [self md5HashToLower32Bit:@"文和"];
    NSString *str4_1 = [self md5HashToUpper32Bit:@"文和"];
    NSLog(@"111");
//    for (NSString *source in arra) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            NSLog(@"%@-Start",source);
//            [self loopMd5:source];
//            NSLog(@"%@-End",source);
//        });
//    }
}

+ (void)loopMd5:(NSString *)sender {
    NSLog(@"sender=%@",sender);
    NSString *result_f = sender;
//    NSInteger value = 100000000;
    NSInteger value = 20000000;
    for (int i = 0; i < value; i++) {
        result_f = [self md5HashToLower32Bit:result_f];
    }
    //e2062f7e4c8ad1925d8a89bb695b069a
    NSLog(@"1——result_f=%@",result_f);
//    for (int i = 0; i < value; i++) {
//        result_f = [self md5HashToLower32Bit:result_f];
//    }
//    //c86ee7bbbdba2cc2879728b800d13568
//    NSLog(@"2——result_f=%@",result_f);
//    for (int i = 0; i < value; i++) {
//        result_f = [self md5HashToLower32Bit:result_f];
//    }
//    NSLog(@"3——result_f=%@",result_f);
//    for (int i = 0; i < value; i++) {
//        result_f = [self md5HashToLower32Bit:result_f];
//    }
//    NSLog(@"4——result_f=%@",result_f);
//    for (int i = 0; i < value; i++) {
//        result_f = [self md5HashToLower32Bit:result_f];
//    }
//    NSLog(@"5——result_f=%@",result_f);
}

+ (NSString *)md5HashToLower32Bit:(NSString *)source {
    const char *input = [source UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

+ (NSString *)md5HashToUpper32Bit:(NSString *)source {
    const char *input = [source UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}
//16wei 小写
+ (NSString *)md5HashToLower16Bit:(NSString *)source {
    NSString *md5Str = [self md5HashToLower32Bit:source];

NSString *string = @"";
if (md5Str.length == 32) {
    string = [md5Str substringWithRange:NSMakeRange(8, 16)];;
}

return string;
}
//16位大写
+ (NSString *)md5HashToUpper16Bit:(NSString *)source {
    NSString *md5Str = [self md5HashToUpper32Bit:source];

NSString *string;
if (md5Str.length == 32) {
    string=[md5Str substringWithRange:NSMakeRange(8, 16)];
}

return string;
}
@end
