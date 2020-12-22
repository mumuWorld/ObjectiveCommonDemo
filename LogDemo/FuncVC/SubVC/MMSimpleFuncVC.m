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
#import "MMGenerateObjTool.h"
#import "NSString+MMString.h"
#import "MMUIKitTool.h"
#import "ELHotelDispatchTimer.h"
#import "MMPresentTestVC.h"
#import "MMGCDTestVC.h"
#import "MMSimpleFuncModel+MMExtension.h"

@interface MMSimpleFuncVC ()
@property (nonatomic, strong) NSArray *strongArray;
@property (nonatomic, copy) NSArray *cpArray;

@property (nonatomic, strong) NSMutableArray *strongMutableArray;
@property (nonatomic, strong) NSMutableArray *cpMutableArray;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) NSString *timerName;

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) MMSimpleFuncModel *funcModel;
@end

@implementation MMSimpleFuncVC

- (void)dealloc {
    NSLog(@"dealloc->%@",self.timer);
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"self=%@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self windowTest];
//    [self test6];
    [MMSimpleFuncTestTool test];
    NSString *test = @"".appendObj(@(2)).appendObj(@"test").appendObj(@(true));
    NSString *test_2 = @"".appendObjs(@(3),@"hello",@(YES),nil);
    NSLog(@"joeLog->test=%@",test);
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
    self.funcModel = [MMSimpleFuncModel new];
    self.funcModel.disasterCity = YES;
    
    
    BOOL value = self.funcModel.disasterCity;
    
    NSLog(@"value=%d",value);
//    [self.funcModel resgister];
//    [MMUIKitTool differentWindowScreen];
    
//    self.timerName = [ELHotelDispatchTimer excuTimerTask:^(NSString * _Nonnull timer) {
//        NSLog(@"timer=%@",timer);
//    } andStart:3 interval:2 repeats:true async:NO];
}


- (void)gcdfunc {
    NSThread *thread = [[NSThread alloc] init];
//    [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(1)} waitUntilDone:true];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(2)} waitUntilDone:true];
    });
    [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(3)} waitUntilDone:false];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(4)} waitUntilDone:false];
    });
    
    //- (void)viewDidLoad {
    
    [self performSelector:@selector(testThread1:) withObject:@{@"key":@(5)} afterDelay:2];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(testThread1:) withObject:@{@"key":@(6)} afterDelay:3];
    });
}

- (void)testThread1:(NSDictionary *)obj {
    NSLog(@"joeLog->obj=%@,thread=%@,obj=%@",self,[NSThread currentThread],obj);
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
//    [self test2];
    [self.funcModel postNotify];
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
    MMSimpleFuncModel *model_3 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"beddesc";
    model_2.content = @"c3";
    model_2.type = 3;
    NSArray *array = @[@{@"keyType":@"beddesc",
                         @"content":@"c1",
                         @"type": @(1)
    },
                       @{@"keyType":@"multibed",
                         @"content":@"c1",
                         @"type": @(1)
                       }];
    NSArray *array_2 = @[model_1,model_2,model_3];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"keyType = %@ || keyType = %@",@"beddesc",@"multibed"];
    //错误写法
    NSPredicate *pre_1 = [NSPredicate predicateWithFormat:@"keyType = beddesc"];
    
    NSPredicate *pre_2 = [NSPredicate predicateWithFormat:@"type = %d",1];
    NSPredicate *pre_5 = [NSPredicate predicateWithFormat:@"type == %d",1];

//    NSArray <MMSimpleFuncModel>*array = @[model_1,model_2];
    NSPredicate *pre_3 = [NSPredicate predicateWithFormat:@"type == 1"];
    NSPredicate *pre_4 = [NSPredicate predicateWithFormat:@"type = 1"];

//    NSArray *result = [self.hotelDetailModel.otherText filteredArrayUsingPredicate:pre];
    
    NSArray *result = [array filteredArrayUsingPredicate:pre];
    NSArray *result_2 = [array filteredArrayUsingPredicate:pre_1];
    
    NSArray *result_2_1 = [array_2 filteredArrayUsingPredicate:pre_2];
    
    NSArray *result_2_result_1 = [array_2 filteredArrayUsingPredicate:pre];
    //错误用法
    NSArray *result_2_result_2 = [array_2 filteredArrayUsingPredicate:pre_1];

    
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

- (void)windowTest {
    UIWindow *topWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    MMPresentTestVC *pre = [MMPresentTestVC new];
    __weak typeof(self) ws = self;
    __weak typeof(pre) ws_pre = pre;

    pre.callBack = ^{
        MMPresentTestVC *test = [[MMPresentTestVC alloc] init];
        [ws_pre.navigationController pushViewController:test animated:YES];

        MMGCDTestVC *test_2 = [[MMGCDTestVC alloc] init];
        [ws.navigationController pushViewController:test_2 animated:YES];
    };
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:pre];
    topWindow.rootViewController = navi;
    
    topWindow.windowLevel = 100;
    topWindow.hidden = false;
    self.window = topWindow;
    
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
//     NSString *lastPathComponent = @"/Users/mumu/Documents/EL&TC_Pro/resource/设计稿/国内酒店迭代/967/详情页点评模块引入动态点评/assets/t";
    NSString *path2 = @"/Users/mumu/Documents/EL&TC_Pro/resource/设计稿/国内酒店迭代/973/酒店详情页头部设施icon";
    [self p_setupFileRename:path2];
//    [self p_setupFileRename:lastPathComponent];
//    [self getAllPngName:lastPathComponent];
//    [self getAllPngName:path2];
}


- (NSString *)fitNameWith:(NSString *)original {
    BOOL is2x = [original containsString:@"@2x"];
    NSString *fit = @"";
    NSString *common = @"hotelDetail_facility_entrance_";
    if ([original containsString:@"接送机"]) {
        fit = @"airport_transfer";
    } else if ([original containsString:@"儿童设施"]) {
        fit = @"child_facility";
    } else if ([original containsString:@"温泉"]) {
        fit = @"hot_spring";
    } else if ([original containsString:@"沙滩"]) {
        fit = @"private_sandbeach";
    } else if ([original containsString:@"滑雪"]) {
        fit = @"skiing";
    } else if ([original containsString:@"高尔夫"]) {
        fit = @"golf";
    } else if ([original containsString:@"潜水"]) {
        fit = @"dive";
    } else if ([original containsString:@"水上运动"]) {
        fit = @"water_sport";
    } else if ([original containsString:@"海边娱乐"]) {
        fit = @"sea_happy";
    } else if ([original containsString:@"泳池"]) {
        fit = @"swimming_pool";
    } else if ([original containsString:@"健身中心"]) {
        fit = @"gym";
    } else if ([original containsString:@"景观"]) {
        fit = @"scenery";
    } else if ([original containsString:@"免费停车"]) {
        fit = @"park";
    } else if ([original containsString:@"智能家具"]) {
        fit = @"smart_home";
    } else if ([original containsString:@"免费携带宠物"]) {
        fit = @"pet";
    } else if ([original containsString:@"spa"]) {
        fit = @"spa";
    } else if ([original containsString:@"会议室"]) {
        fit = @"meeting_room";
    } else if ([original containsString:@"行政酒廊"]) {
        fit = @"executive_lounge";
    } else if ([original containsString:@"餐厅"]) {
        fit = @"restaurant";
    } else if ([original containsString:@"接站服务"]) {
        fit = @"pickup_station";
    } else if ([original containsString:@"WIFI"]) {
        fit = @"wifi";
    } else if ([original containsString:@"24小时前台"]) {
        fit = @"24hour_receptionist_service";
    } else if ([original containsString:@"篮球场"]) {
        fit = @"basketball_court";
    } else if ([original containsString:@"茶室"]) {
        fit = @"tea_room";
    } else if ([original containsString:@"欢迎礼品"]) {
        fit = @"wellcom_gift";
    } else if ([original containsString:@"酒吧"]) {
        fit = @"bar";
    } else if ([original containsString:@"乒乓球"]) {
        fit = @"pingpang";
    } else if ([original containsString:@"休闲会所"]) {
        fit = @"lie_club";
    } else if ([original containsString:@"行李寄存"]) {
        fit = @"baggage";
    } else if ([original containsString:@"叫醒服务"]) {
        fit = @"wakeup_service";
    } else if ([original containsString:@"叫车服务"]) {
        fit = @"car_service";
    } else if ([original containsString:@"免费洗漱用品"]) {
        fit = @"wash";
    } else if ([original containsString:@"洗衣服务"]) {
        fit = @"washcloth";
    } else if ([original containsString:@"24小时热水"]) {
        fit = @"24th_hotwater";
    } else if ([original containsString:@"电梯"]) {
        fit = @"elevator";
    } else if ([original containsString:@"旅游服务"]) {
        fit = @"tour";
    } else if ([original containsString:@"外币兑换"]) {
        fit = @"foreign_currency";
    } else if ([original containsString:@"商务"]) {
        fit = @"business_center";
    } else if ([original containsString:@"入住测温"]) {
        fit = @"moveinto_temperature";
    } else if ([original containsString:@"员工测温"]) {
        fit = @"staff_temperature";
    } else if ([original containsString:@"14天无病"]) {
        fit = @"no_patient";
    } else if ([original containsString:@"每日消毒"]) {
        fit = @"everyday_disinfect";
    } else if ([original containsString:@"配备消毒设施"]) {
        fit = @"have_facility";
    } else if ([original containsString:@"咖啡厅"]) {
        fit = @"coffee_house";
    } else if ([original containsString:@"桑拿"]) {
        fit = @"sauna";
    } else if ([original containsString:@"足浴"]) {
        fit = @"foot_bath";
    }
    if(fit.length < 1) {
        return @"";
    }
    if (is2x) {
        fit = [NSString stringWithFormat:@"%@%@_header.png",fit,common];
    } else {
        return nil;
    }
    

//    fit = [NSString stringWithFormat:@"%@%@_header%@.png",common,fit,is2x ? @"@2x":@"@3x"];
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
