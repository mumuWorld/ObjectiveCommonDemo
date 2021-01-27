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
#include <mach/mach_time.h>
#include <sys/time.h>
#import "MMSimpleFuncModel.h"
#import "MMUIKitTool.h"

static NSHashTable *table = nil;

@implementation MMSimpleFuncTestTool

+ (void)initialize {
    table = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
}


+ (void)test {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"string" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSString *tStr = [jsonDict objectForKey:@"t"];
    NSString *sStr = [jsonDict objectForKey:@"s"];
    NSLog(@"dict=%@",jsonDict);
}

+ (void)htmlStr {
    NSString *source = @"<ol><li>仅限本人使用；</li><li>适用于总房费￥200元以内在线付中国大陆酒店，可对房费进行全额抵扣，房券不找零；</li><li>至少提前4天预定，如周一预定周五入住的酒店；</li><li>工作日、周六日可用，其他法定节假日均不可用；</li><li>预定时每天只能使用一张，一张订单只能使用一张房券；</li><li>房券自购买日的次日生效，有效期为90天，过期作废；</li><li>使用房券预定酒店后取消订单，根据酒店取消规则，可免费取消的房券退还用户账户；不可免费取消的，房券不退换。</li></ol><p><br></p>";
    NSDictionary* options = @{
        NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
    };
    
    NSMutableAttributedString* attrs = [[NSMutableAttributedString alloc] initWithData:[source dataUsingEncoding:NSUnicodeStringEncoding] options:options documentAttributes:nil error:nil];
    NSString *result = attrs.string;
    NSLog(@"result=%@",result);
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


+ (void)dateTest {
    //23700440873531
    uint64_t mach_time = mach_absolute_time();
    //23700.440875225002  将上面mach_absolute_time()的CPU tick数转化成秒数的结果
    CGFloat mediaTime = CACurrentMediaTime();
    // 23700.440875225002 == CACurrentMediaTime()
    NSTimeInterval systemUptime = [[NSProcessInfo processInfo] systemUptime];
    //623924625.32565904 以GMT为标准的，2001年一月一日00：00：00这一刻的时间绝对值
    CGFloat absoluteTime = CFAbsoluteTimeGetCurrent();
    
    struct timeval now;
    struct timezone tz;
//    (timeval) now = (tv_sec = 1602231152, tv_usec = 400892)
//    (timezone) tz = (tz_minuteswest = -480, tz_dsttime = 0)
    gettimeofday(&now, &tz);
    //2020-10-09 08:12:32 +0000
    NSDate* date = [NSDate date];
    //(CGFloat) date_time = 1602231152.400984  -> 1602646709.042289
    CGFloat date_time = [date timeIntervalSince1970];
    //(CGFloat) date_time_now = -0.0000069141387939453125
    CGFloat date_time_now = [date timeIntervalSinceNow];

    NSLog(@"test");
}

+ (void)interTest {
    NSInteger bitSwitch = 16;
    if (bitSwitch & 1) {
        NSLog(@"开1");
    }
    if ((bitSwitch & 2) == 2) {
        NSLog(@"开2");
    }
    
    NSInteger test = bitSwitch & 4;
    
    NSInteger test2 = bitSwitch & 2;
    
    NSLog(@"开3");
}


+ (void)crashTest {
    NSString *normalStr = @"test";
    
    normalStr = [NSString stringWithFormat:@"%@(%@)",nil,@""];
    
    NSRange rang = [normalStr rangeOfString:@""];
    normalStr = nil;
    NSRange rang_3 = [normalStr rangeOfString:@""];

    NSRange rang_2 = [normalStr rangeOfString:nil];
    
    NSLog(@"test");
}

+ (void)arraySortTest {
    NSArray *array = @[@(1),@(4),@(5),@(2),@(3)];
    
    NSArray *tmp = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] > [obj2 integerValue];
    }];
    
    NSLog(@"%@",tmp);
}

+ (void)sizeTest {
    NSObject *obj = [NSObject new];
    MMSimpleFuncModel *model = [MMSimpleFuncModel new];
    int a = 0;
    NSString *str = @"test";
    SEL sel = NSSelectorFromString(@"sizeTest");
    // 8
    int size_obj = sizeof(obj);
    // 4
    int size_a = sizeof(a);
    //8
    int size_model = sizeof(model);
    // 8
    int size_strl = sizeof(str);
    // 8
    int size_sel = sizeof(sel);

    NSLog(@"%d",size_strl);
}

+ (void)allTest {
    
    //    [MMGenerateObjTool generateJson:[MMSimpleFuncModel class]];
    //    [MMGenerateObjTool generateJson:[[MMSimpleFuncTestTool new] class]];

    //    NSDictionary *dict = @{@"key1": @"value1",
    //                           @"key2": @(3),
    //                           @"key3": @(true),
    //
    //    };
    //
    //    id isTrue = [dict objectForKey:@"ke1"];
    //    BOOL value = [isTrue boolValue];
    //    id key2 = [dict objectForKey:@"ke2"];
    //    NSInteger value2 = [key2 integerValue];
    //        NSLog(@"p->%@",isTrue);
    //
    //    [MMSimpleFuncTestTool addTargetVC:self];
        //0x7fe5e0524e40
    //    char a = 'a';
    //    char b = 'b';
    //    NSInteger tmp_1 = a - b;
    //    NSString *cloudStr = @"0123456"; //7
    //    cloudStr = [cloudStr substringToIndex:cloudStr.length - 1];
    //    NSInteger tmp = (NSInteger)[NSString stringWithFormat:@"%p",self];
    //    MMSimpleFuncModel *modle;
    //    NSDictionary *dict = @{@"key": @(modle.type)};
    //    NSLog(@"%@",tmp);
    ////    [MMGCDTestTool gcd_groupTest2];
    //    [MMSimpleFuncTestTool utfCode];
        
    //    NSDictionary *dict2 = [NSDictionary dictionaryWithDictionary:dict];
    //    id obj = [dict objectForKey:@"ke1"];
    //    NSInteger va1 = [obj integerValue];
    //    NSLog(@"val =%zd",va1);
    //
    //    [dict2 setValue:@"value_test" forKey:@"key2"];
        
    //    [self testFuncA];
    //    [self testEqualArray];
    //    [MMGCDTestTool test];
    //    NSString *str = @"test";
    //    [MMGCDTestTool testPoint:&str];
    //    [MMGCDTestTool testPoint:(NSString *__autoreleasing *)]
    //    [MMGCDTestTool threadTest];
    //    MMUIKitTool *kitTool = [[MMUIKitTool alloc] init];
    //    [kitTool viewAnimationTest];

    //    [self.funcModel resgister];
    //    [MMUIKitTool differentWindowScreen];
        
    //    self.timerName = [ELHotelDispatchTimer excuTimerTask:^(NSString * _Nonnull timer) {
    //        NSLog(@"timer=%@",timer);
    //    } andStart:3 interval:2 repeats:true async:NO];
}

+ (void)animationBlockTest {
        MMUIKitTool *kitTool = [[MMUIKitTool alloc] init];
        [kitTool viewAnimationTest];
}
@end
