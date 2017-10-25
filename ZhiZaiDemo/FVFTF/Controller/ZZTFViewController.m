//
//  ZZTFViewController.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZTFViewController.h"
#import "ZZBankListPickerView.h"

@interface ZZTFViewController ()

@property (strong, nonatomic) UIPickerView *pickerView;

@end

@implementation ZZTFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    JVFloatLabeledTextField *testTF = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    testTF.placeholder = @"hello";
    testTF.borderStyle = UITextBorderStyleRoundedRect;
    testTF.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Title", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}];
    testTF.floatingLabelTextColor = [UIColor orangeColor];
    testTF.floatingLabelActiveTextColor = [UIColor orangeColor];
    testTF.floatingLabelYPadding = -8.0f;
    testTF.floatingLabel.backgroundColor = [UIColor whiteColor];
    testTF.inputView = self.pickerView;
    
    [self.view addSubview:testTF];
}

- (UIPickerView *)pickerView {
    if (nil == _pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    
    return _pickerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"111";
}

@end
