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
#import "LogDemo-Swift.h"
#import "AppDelegate.h"

static NSHashTable *table = nil;

static MMSimpleFuncTestTool *_share = nil;

@interface MMSimpleFuncTestTool()

@property (nonatomic, copy) dispatch_block_t transBlock;

@property (nonatomic, strong) SwiftClass *sc;

@end

@implementation MMSimpleFuncTestTool

+ (void)initialize {
    table = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
}

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _share = [[MMSimpleFuncTestTool alloc] init];
    });
    return _share;
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

- (void)kvoRegister {
    [self.simpleModel addObserver:self forKeyPath:@"readStr" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)kvoTest {
//    self.simpleModel.readStr = @"test";
//    [self.simpleModel setValue:@"kvoSet" forKeyPath:@"readStr"];
    //未实现
    SEL sel = NSSelectorFromString(@"setReadStr:");
    NSLog(@"%d",[self.simpleModel respondsToSelector:sel]);
}

- (void)kvoSet {
    [self.simpleModel testSetReadStr];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"key=%@,obj=%@, change=%@, context=%@",keyPath,object,change,context);
}

//外部调动
- (void)taskTest {
    [MMSimpleFuncTestTool requestStart];
    
    [MMSimpleFuncTestTool addRequest:^(void * _Nonnull notify) {
        sleep(1);
        notifyFinish();
    }];
    [MMSimpleFuncTestTool addRequest:^(void * _Nonnull notify) {
        sleep(3);
        notifyFinish();
    }];
    [MMSimpleFuncTestTool addRequest:^(void * _Nonnull notify) {
        sleep(2);
        notifyFinish();
    }];
    [MMSimpleFuncTestTool requestEnd:^{
        //刷新view
    }];
}

- (void)blockCancel {
    self.transBlock = dispatch_block_create(0, ^{
        NSLog(@"执行block");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 *NSEC_PER_SEC), dispatch_get_global_queue(0, 0), ^{
            NSLog(@"三秒后");
        });
//        sleep(4);
//        NSLog(@"四秒后");
    });
//    block();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 *NSEC_PER_SEC), dispatch_get_main_queue(), self.transBlock);
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_block_cancel(self.transBlock);
//    });
    NSLog(@"结束取消");
}

//内部处理
static dispatch_queue_t reqQueue = nil;
static dispatch_group_t reqGroup = nil;

void notifyFinish() {
    NSLog(@"notify");
    dispatch_group_leave(reqGroup);
}

+ (void)requestStart {
    reqGroup = dispatch_group_create();
    reqQueue = dispatch_queue_create("hotel_request_concurrent", DISPATCH_QUEUE_CONCURRENT);
}

+ (void)addRequest:(void(^)(void *notify))finish {
    dispatch_group_enter(reqGroup);
    dispatch_async(reqQueue, ^{
        finish(notifyFinish);
    });
}


+ (void)requestEnd:(dispatch_block_t)finish {
    NSLog(@"通知完成-%@",[NSThread currentThread]);
    dispatch_group_notify(reqGroup, reqQueue, ^{
       //刷新
        NSLog(@"刷新view");
        finish();
    });
    NSLog(@"执行后续-%@",[NSThread currentThread]);
}


- (void)createPlist {
//    [self combine];
//    return;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main_lang" ofType:@"plist"];
//    NSString *code_path = [[NSBundle mainBundle] pathForResource:@"LanguageCodeExtraForSimultaneous" ofType:@"plist"];
//    NSString *path = @"/Users/mumu/Desktop/二维码/test/SimultaneousLeft.plist";
//    NSString *right_path = @"/Users/mumu/Desktop/二维码/test/Simultaneousrgith.plist";
//    NSArray *names = [NSArray arrayWithContentsOfFile:path];
//    NSArray *codes = [NSArray arrayWithContentsOfFile:code_path];
    NSDictionary *left_dict = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSDictionary *camera = [MMSimpleFuncTestTool transDirectionDic];
//    NSDictionary *right_dict = [NSDictionary dictionaryWithContentsOfFile:right_path];

    NSMutableDictionary *new = [NSMutableDictionary dictionary];
//    [right_dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSDictionary * left = left_dict[key];
//        NSInteger support = 2;
//        if (left) {
//            support = 0;
//        }
//        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:obj];
//        dict[@"supportType"] = @(support);
////        NSDictionary *dic = @{@"name":key, @"code": obj};
//        new[key] = dict;
//    }];
    NSArray *toUser = @[@"中文", @"英文", @"日文", @"韩文", @"俄文"];
    [left_dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSDictionary * right = right_dict[key];
        NSInteger historyDefault = 0;
        NSString *name = obj[@"name"];
        if ([toUser containsObject:name]) {
            historyDefault = [toUser indexOfObject:name];
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:obj];
            dict[@"historyDefault"] = @(historyDefault + 1);
    //        NSDictionary *dic = @{@"name":key, @"code": obj};
            new[key] = dict;
        }
    }];
    
    [new writeToFile:@"/Users/mumu/Desktop/二维码/test/web_lang.plist" atomically:YES];
}

- (void)combine {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main_lang" ofType:@"plist"];
    NSMutableDictionary *codeMap = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSString *SimuPath = [[NSBundle mainBundle] pathForResource:@"Simultaneous" ofType:@"plist"];
    NSDictionary *SimuMap = [NSDictionary dictionaryWithContentsOfFile:SimuPath];
    
    [codeMap addEntriesFromDictionary:SimuMap];
    
    NSLog(@"codeMap");
    [codeMap writeToFile:@"/Users/mumu/Desktop/二维码/test/SimultaneousPlus.plist" atomically:YES];

}

- (void)modifyPlist {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ocr_lang" ofType:@"plist"];
    NSMutableDictionary *codeMap = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//    toUser = ["中文", "英文", "日文", "韩文", "俄文"]
    //        } else {
//    NSArray *toUser = @[@"中文", @"英文", @"日文", @"韩文", @"法文"];
    [codeMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSString *name = obj[@"name"];
//        if ([toUser containsObject:name]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:obj];
            dict[@"supportType"] = @(1);
            codeMap[key]= dict;
//        }
    }];
    [codeMap writeToFile:@"/Users/mumu/Desktop/二维码/test/new_ocr_lang.plist" atomically:YES];
}

- (void)callSwift {
//    @weakify(self)
//    [self.sc sayHelloWithCallBack:^{
//        @strongify(self)
//        NSLog(@"print->%@", self);
////        @weakify(self)
//        [self.simpleModel sayHello:^{
//            @strongify(self)
//            NSLog(@"print->%@", self);
//        }];
//    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        self.sc._callback();
//    });
//    [self.simpleModel sayHello:^{
//        @strongify(self)
//        NSLog(@"print->%@", self);
//    }];
    
    [self.sc callOC];
}

+ (NSDictionary *)transDirectionDic
{
    return @{
             @"自动检测语言":@"auto",
             @"英文":@"en",
             @"日文":@"ja",
             @"韩文":@"ko",
             @"法文":@"fr",
             @"俄文":@"ru",
             @"西班牙文":@"es",
             @"丹麦文":@"da",
             @"荷兰文":@"nl",
             @"德文":@"de",
             @"希腊文":@"el",
             @"匈牙利文":@"hu",
             @"意大利文":@"it",
             @"葡萄牙文":@"pt",
             @"中文(简体)":@"zh-CHS",
             @"中文(繁体)":@"zh-CHT",
             @"捷克文":@"cs",
             @"芬兰文":@"fi",
             @"挪威文":@"no",
             @"波兰文":@"pl",
             @"瑞典文":@"sv",
             @"土耳其文":@"tr",
             
             @"越南文" : @"vi",
             @"印度尼西亚文" : @"id",
             @"印地文" : @"hi",
             @"泰米尔文" : @"ta",
             @"孟加拉文" : @"bn",
             @"马拉地文" : @"mr",
             @"乌尔都文" : @"ur",
             @"菲律宾文" : @"tl",
             @"尼泊尔文" : @"ne"
             };
}

- (void)doSomethingBack:(dispatch_block_t)back {
    NSLog(@"调用方法");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"三秒结束");
        back();
    });
}

- (void)dealloc {
    NSLog(@"消失");
}

- (SwiftClass *)sc {
    if (!_sc) {
        _sc = [[SwiftClass alloc] init];
    }
    return _sc;
}

- (MMSimpleFuncModel *)simpleModel {
    if(!_simpleModel) {
        _simpleModel = [MMSimpleFuncModel new];
    }
    return _simpleModel;
}
@end
