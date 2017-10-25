//
//  ZZPayPasswdSettingVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZPayPasswdSettingVC.h"
#import "ZZEditView.h"
#import "ZZDiyTF.h"
#import "ZZPasswdInputView.h"

@interface ZZPayPasswdSettingVC ()<UITextFieldDelegate>

@property (nonatomic, strong) ZZPasswdInputView *editView;

@end

@implementation ZZPayPasswdSettingVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//
//    [self.editView addGestureRecognizer:tap];
    [self.view addSubview:self.editView];
}

- (void)tapAction:(id)sender {
    NSLog(@"-----");
    [self.editView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Setter && Getter method

- (ZZPasswdInputView *)editView {
    
    if (nil == _editView) {
        _editView = [[ZZPasswdInputView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
        _editView.backgroundColor = UIColor.redColor;
        _editView.userInteractionEnabled = YES;
        _editView.paswdLength = 8;
        
    }
    
    return _editView;
}

#pragma mark - Private method

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__FUNCTION__);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
