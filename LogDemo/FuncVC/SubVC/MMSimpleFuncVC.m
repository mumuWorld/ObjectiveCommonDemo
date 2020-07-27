//
//  MMSimpleFuncVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC.h"
#import "MMPresentTestVC.h"
#import "MMSimpleFuncModel.h"
#import "MMGCDTestTool.h"
#import "MMSimpleFuncTestTool.h"

@interface MMSimpleFuncVC ()
@property (nonatomic, strong) NSArray *strongArray;
@property (nonatomic, copy) NSArray *cpArray;

@property (nonatomic, strong) NSMutableArray *strongMutableArray;
@property (nonatomic, strong) NSMutableArray *cpMutableArray;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MMSimpleFuncVC
- (void)dealloc {
    NSLog(@"dealloc->%@",self.timer);
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
    
}

- (void)testBLock {
        int x = 0;
       // ARC 下定义 normalBlock 后再打印其所在的内存地址
    void(^normalBlock)(void) = ^{
        NSLog(@"%d", x);
    };
    NSLog(@"normalBlock: %@", normalBlock);

    // 直接打印某个 block 的内存地址
    NSLog(@"block: %@", ^{
        NSLog(@"%d", x);
    });
}

- (void)testFuncA {
    NSLog(@"a");
}

- (void)testEqualArray {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    MMSimpleFuncModel *model_3 = [[MMSimpleFuncModel alloc] init];
    model_3.keyType = @"multibed";
    model_3.content = @"c2";
    MMSimpleFuncModel *model_4 = [model_1 copy];
    NSArray *array_1 = @[model_1,model_2];
    NSArray *array_2 = @[model_1,model_2];
    NSArray *array_3 = @[model_1,model_3];
    NSArray *array_4 = [array_1 copy];
    NSArray *array_5 = array_1;
    BOOL equal = [array_1 isEqual:array_2];
    BOOL equal_2 = [array_1 isEqualToArray:array_2];
    BOOL equal_3 = array_1 == array_2;
    
    BOOL equal_2_1 = [array_1 isEqual:array_3];
    BOOL equal_2_2 = [array_1 isEqualToArray:array_3];
    BOOL equal_2_3 = array_1 == array_3;
    NSLog(@"resutl");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.timer invalidate];
    [MMSimpleFuncTestTool invokeGCDTest];
//    MMPresentTestVC *test = [[MMPresentTestVC alloc] init];
//    test.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self.navigationController presentViewController:test animated:true completion:nil];
}

/// 谓词测试
- (void)test2 {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    model_1.type = 1;
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    model_2.type = 2;
    NSArray *array = @[@{@"keyType":@"beddesc",
                         @"content":@"c1",
                         @"type": @(1)
    },
                       @{@"keyType":@"multibed",
                         @"content":@"c1",
                         @"type": @(1)
                       }];
    NSArray *array_2 = @[model_1,model_2];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"keyType = %@ || keyType = %@",@"beddesc",@"multibed"];
    
    NSPredicate *pre_2 = [NSPredicate predicateWithFormat:@"type = %d",1];
    NSPredicate *pre_5 = [NSPredicate predicateWithFormat:@"type == %d",1];

//    NSArray <MMSimpleFuncModel>*array = @[model_1,model_2];
    NSPredicate *pre_3 = [NSPredicate predicateWithFormat:@"type == 1"];
    NSPredicate *pre_4 = [NSPredicate predicateWithFormat:@"type = 1"];

//    NSArray *result = [self.hotelDetailModel.otherText filteredArrayUsingPredicate:pre];
    
    NSArray *result = [array filteredArrayUsingPredicate:pre];
//    NSArray *result_2 = [array_2 filteredArrayUsingPredicate:pre];
    NSArray *result_2 = [array filteredArrayUsingPredicate:pre_2];
    NSArray *result_2_1 = [array_2 filteredArrayUsingPredicate:pre_2];
    
    NSArray *result_4 = [array filteredArrayUsingPredicate:pre_3];
    NSArray *result_4_2 = [array_2 filteredArrayUsingPredicate:pre_3];
    NSArray *result_5 = [array filteredArrayUsingPredicate:pre_4];
    NSArray *result_5_2 = [array_2 filteredArrayUsingPredicate:pre_4];
    NSArray *result_6 = [array filteredArrayUsingPredicate:pre_5];
    NSArray *result_6_2 = [array_2 filteredArrayUsingPredicate:pre_5];
    NSLog(@"%@--%@",result);
}

- (void)test7 {
    NSString *test = @"多少人[多少人]多少人多少人[]";
    NSString *rules = @"\\[[^\\]]+\\]";
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",rules];
    NSRange reslut = [test rangeOfString:rules options:NSRegularExpressionSearch];
    NSLog(@"result=%zd",reslut.length);

    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:rules options:0 error:nil];
    NSArray *match = [regular matchesInString:test options:NSMatchingReportCompletion range:NSMakeRange(0, test.length)];
    NSTextCheckingResult *check2 = [regular firstMatchInString:test options:NSMatchingReportCompletion range:NSMakeRange(0, test.length)];
    [regular enumerateMatchesInString:test options:NSMatchingReportCompletion range:NSMakeRange(0, test.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        NSLog(@"usingBlock->%d,str->%@",result.range.length,[test substringWithRange:result.range]);
    }];
    for (NSTextCheckingResult *check in match) {
        NSLog(@"range->%d,str->%@",check.range.length,[test substringWithRange:check.range]);
    }
}
- (void)test3 {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *uuidStr = (__bridge_transfer NSString *)uuid;
    NSLog(@"uuid-%@",uuidStr);
}

- (void)test4 {
    char *str = "aabbcc";
    char *p = str + 2;
    NSLog(@"%s",p);
}

- (void)test5 {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    NSArray *array_2 = @[model_1,model_2];
    NSMutableArray *array_1 = [NSMutableArray arrayWithArray:array_2];

    self.strongArray = array_1;
    self.cpArray = array_1;
    NSLog(@"%p",array_1);
    NSLog(@"%@,%@, %p,%p",self.strongArray,self.cpArray,self.strongArray,self.cpArray);
    model_1 = nil;
    NSLog(@"%p",array_1);
    NSLog(@"%@,%@, %p,%p",self.strongArray,self.cpArray,self.strongArray,self.cpArray);
    self.strongArray = [array_1 copy];
    self.cpArray = [array_1 copy];
    NSLog(@"%p",array_1);
    NSLog(@"%@,%@, %p,%p",self.strongArray,self.cpArray,self.strongArray,self.cpArray);
//    self.strongMutableArray = [array_2 mutableCopy];
//    self.cpMutableArray = [array_2 copy]; //必崩
//        NSLog(@"%p",array_2);
//        NSLog(@"%@,%@, %p,%p",self.strongMutableArray,self.cpMutableArray,self.strongMutableArray,self.cpMutableArray);
//    [self.cpMutableArray removeLastObject];
//NSLog(@"%p",array_1);
}
- (void)test6 { //更改文件名
     NSString *lastPathComponent = @"/Users/mumu/Documents/EL&TC_Pro/resource/设计稿/国内酒店迭代/967/详情页点评模块引入动态点评/assets/t";
    NSString *path2 = @"/Users/mumu/Documents/EL&TC_Pro/resource/设计稿/国内酒店迭代/967/详情页点评模块引入动态点评/assets";
//    [self p_setupFileRename:path2];
//    [self p_setupFileRename:lastPathComponent];
    [self getAllPngName:lastPathComponent];
    [self getAllPngName:path2];
}


- (NSString *)fitNameWith:(NSString *)original {
    BOOL is2x = [original containsString:@"@2x"];
    NSString *fit = @"";
    NSString *common = @"hoteldetail_tips_icon_";
    if ([original containsString:@"点评"]) {
        fit = @"comment";
    } else if ([original containsString:@"美食"]) {
        fit = @"food";
    } else if ([original containsString:@"交通"]) {
        fit = @"transport";
    } else if ([original containsString:@"亲子"]) {
        fit = @"parenting";
    } else if ([original containsString:@"情侣"]) {
        fit = @"lovers";
    } else if ([original containsString:@"设施"]) {
        fit = @"facilities";
    } else if ([original containsString:@"通用"]) {
        fit = @"common";
    } else if ([original containsString:@"网红"]) {
        fit = @"celebrity";
    }
    if(fit.length < 1) {
        return @"";
    }
    fit = [NSString stringWithFormat:@"%@%@%@.png",common,fit,is2x ? @"@2x":@"@3x"];
    return fit;
}

- (void) p_setupFileRename:(NSString *)lastPathComponent {
    
   
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSArray *arr = [fileManager contentsOfDirectoryAtPath:lastPathComponent error:nil];
    for (NSString *name in arr) {
        NSString *fitName = [self fitNameWith:name];
        if (fitName.length == 0) {
            continue;
        }
        NSString *orginalPath = [lastPathComponent stringByAppendingPathComponent:name];
        NSString *moveToPath = [lastPathComponent stringByAppendingPathComponent:fitName];
        NSError *error;
        //通过移动该文件对文件重命名
        BOOL isSuccess = [fileManager moveItemAtPath:orginalPath toPath:moveToPath error:&error];
        if (isSuccess) {
            NSLog(@"rename success ->%@",fitName);
        }else{
            NSLog(@"%@",error);
        }
    }
}

- (void)getAllPngName:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *arr = [fileManager contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *name in arr) {
        if ([name containsString:@".png"]) {
            NSString *imgName = [name substringToIndex:name.length - 7];
            [array addObject:imgName];
        }
    }
    NSLog(@"arr->%@",array);
}

- (void)testDate {
    NSDate *date = [NSDate date];
    NSTimeInterval timer = [date timeIntervalSince1970];
    NSLog(@"timer->%f",timer);
}
- (void)handleTimerInvoke:(id)sender {
    NSLog(@"%@",sender);
}
- (void)testTimer {
    self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(handleTimerInvoke:) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}


@end
