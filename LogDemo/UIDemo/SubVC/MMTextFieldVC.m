//
//  MMTextFieldVC.m
//  LogDemo
//
//  Created by mumu on 2020/1/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMTextFieldVC.h"

@interface MMTextFieldVC () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UISegmentedControl *segmentControl;

@property (nonatomic, copy) NSArray *keyboardTypeArr;

@end

@implementation MMTextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.frame = CGRectMake(50, 200, 300, 30);
    self.segmentControl.frame = CGRectMake(0, 400, ScreenWidth, 40);
    [self.view addSubview:self.textField];
    [self.view addSubview:self.segmentControl];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"input -> 【%@】 , count -> %zd",string,string.length);
    if (string.length == 1) {
        return [string integerValue];
    } else if (string.length > 1) {
        NSArray *matchArr = [string matchStringWithRegularRule:@"\\d+"];
        if (matchArr.count > 0) {
            NSString *currentStr = textField.text ?: @"";
            //考虑可能选中部分字符串的情况 所以根据range 进行替换
            textField.text = [currentStr stringByReplacingCharactersInRange:range withString:[matchArr componentsJoinedByString:@""]];
        }
        return false;
    }
    return true;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
    [self.textField removeFromSuperview];
    NSLog(@"text->%@",self.textField);
}

- (NSArray *)matchString:(NSString *)string toRegularString:(NSString *)regularStr {
    if (!string || string.length == 0) {
        return nil;
    }
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    if (!matches) {
        return nil;
    }
    //match: 所有匹配到的字符
    NSMutableArray *array = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        if ([match numberOfRanges] > 0) { //匹配第一个
            NSString *component = [string substringWithRange:[match rangeAtIndex:0]];
            [array addObject:component];
        }
    }
    return [array copy];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"textFieldShouldClear");
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"return");
       return true;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldBeginEditing");
    return true;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing");
    return true;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    NSLog(@"textFieldDidChangeSelection");
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    NSLog(@"textFieldShouldEndEditing -> %@",reason == UITextFieldDidEndEditingReasonCommitted ? @"commid" : @"cancel");
}


- (void)handleValueChange:(UISegmentedControl *)sender {
    NSLog(@"当前键盘类型 -> %@",self.keyboardTypeArr[sender.selectedSegmentIndex]);
    self.textField.keyboardType = sender.selectedSegmentIndex;
}


#pragma mark - getter && setter

- (UITextField *)textField {
    if (!_textField) {
        UITextField *text = [[UITextField alloc] init];
        text.borderStyle = UITextBorderStyleLine;
        text.placeholder = @"testPlace";
        text.delegate = self;
        text.clearButtonMode = UITextFieldViewModeWhileEditing;
        text.keyboardType = UIKeyboardTypePhonePad;
        _textField = text;
    }
    return _textField;
}

- (UISegmentedControl *)segmentControl {
    if (!_segmentControl) {
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:self.keyboardTypeArr];
        [segment addTarget:self action:@selector(handleValueChange:) forControlEvents:UIControlEventValueChanged];
        _segmentControl = segment;
    }
    return _segmentControl;
}
/*   UIKeyboardTypeDefault,                // Default type for the current input method.
UIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters
UIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
UIKeyboardTypeNumberPad,              // 纯数字
UIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
UIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
UIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
UIKeyboardTypeDecimalPad API_AVAILABLE(ios(4.1)),   // A number pad with a decimal point.
UIKeyboardTypeTwitter API_AVAILABLE(ios(5.0)),      // A type optimized for twitter text entry (easy access to @ #)
UIKeyboardTypeWebSearch API_AVAILABLE(ios(7.0)),    // A default keyboard type with URL-oriented addition (shows space . prominently).
UIKeyboardTypeASCIICapableNumberPad API_AVAILABLE(ios(10.0)), // A number pad (0-9) that will always be ASCII digits.

UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated
*/

- (NSArray *)keyboardTypeArr {
    if (!_keyboardTypeArr) {
        _keyboardTypeArr = @[@"Default",@"ASCIICapable",@"NumbersAndPunctuation",@"URL",@"NumberPad",@"PhonePad",@"NamePhonePad",@"EmailAddress",@"DecimalPad",@"Twitter"];
    }
    return _keyboardTypeArr;
}


@end
