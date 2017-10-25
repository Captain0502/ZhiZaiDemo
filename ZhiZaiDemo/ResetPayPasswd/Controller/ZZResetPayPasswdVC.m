//
//  ZZResetPayPasswdVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/24.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZResetPayPasswdVC.h"

@interface ZZResetPayPasswdVC ()

@property (nonatomic, strong) UITextField *phoneTF, *codeTF, *passwdTF, *confirmTF;

@end

@implementation ZZResetPayPasswdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    
    UIView *bgView = UIView.new;
    bgView.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(88.0f + 20.0f);
        make.left.mas_equalTo(+0);
        make.right.mas_equalTo(-0);
        make.height.mas_equalTo(260.0f);
    }];
    
    {
        if (nil == self.phoneTF) {
            self.phoneTF = UITextField.new;
            self.phoneTF.borderStyle = UITextBorderStyleRoundedRect;
            self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
            self.phoneTF.placeholder = @"请输入您的手机号码";
            
            [bgView addSubview:self.phoneTF];
            
            [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(+11.0f);
                make.right.mas_equalTo(-11.0f);
                make.top.mas_equalTo(bgView).offset(11.0f);
                make.height.mas_equalTo(40.0f);
            }];
        }
    }
    
    
    {
        //  send code button
        
        UIButton *sendCodeButton = UIButton.new;
        sendCodeButton.layer.cornerRadius = 5.0f;
        sendCodeButton.clipsToBounds = YES;
        
        [sendCodeButton setBackgroundColor:UIColor.orangeColor];
        [sendCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [sendCodeButton addTarget:self action:@selector(sendCodeAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [bgView addSubview:sendCodeButton];
        
        [sendCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.phoneTF.mas_bottom).offset(20.0f);
            make.right.mas_equalTo(self.view).offset(-11.0f);
            make.height.mas_equalTo(40.0f);
            make.width.mas_equalTo(120.0f);
        }];
        
        
        // code input view
        
        if (nil == self.codeTF) {
            self.codeTF = UITextField.new;
            self.codeTF.borderStyle = UITextBorderStyleRoundedRect;
            self.codeTF.keyboardType = UIKeyboardTypeNumberPad;
            self.codeTF.placeholder = @"请输入验证码";
            
            [bgView addSubview:self.codeTF];
            
            [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(+11.0f);
                make.right.mas_equalTo(sendCodeButton.mas_left).offset(-8.0f);
                make.top.mas_equalTo(self.phoneTF.mas_bottom).offset(20.0f);
                make.height.mas_equalTo(40.0f);
            }];
        }
    }
    
    {
        //  new passwd
        
        if (nil == self.passwdTF) {
            self.passwdTF = UITextField.new;
            self.passwdTF.borderStyle = UITextBorderStyleRoundedRect;
            self.passwdTF.keyboardType = UIKeyboardTypeNumberPad;
            self.passwdTF.placeholder = @"请输入新密码";
            
            [bgView addSubview:self.passwdTF];
            
            [self.passwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.codeTF.mas_bottom).offset(20.0f);
                make.left.mas_equalTo(self.codeTF.mas_left);
                make.size.mas_equalTo(self.phoneTF);
            }];
        }
        
        if (nil == self.confirmTF) {
            self.confirmTF = UITextField.new;
            self.confirmTF.borderStyle = UITextBorderStyleRoundedRect;
            self.confirmTF.keyboardType = UIKeyboardTypeNumberPad;
            self.confirmTF.placeholder = @"请确认新密码";
            
            [bgView addSubview:self.confirmTF];
            
            [self.confirmTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.passwdTF.mas_bottom).offset(20.0f);
                make.left.mas_equalTo(self.passwdTF.mas_left);
                make.size.mas_equalTo(self.passwdTF);
            }];
        }
    }
    
    {
        
        //  save button
        
        UIButton *saveButton = UIButton.new;
        saveButton.backgroundColor    = UIColor.orangeColor;
        saveButton.layer.cornerRadius = 5.0f;
        
        [saveButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [saveButton setTitle:@"保存" forState:UIControlStateNormal];
        [saveButton addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:saveButton];
        
        [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(bgView.mas_bottom).offset(20.0f);
            make.left.mas_equalTo(self.phoneTF);
            make.width.mas_equalTo(self.phoneTF);
            make.height.mas_equalTo(50.0f);
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Private method

- (void)sendCodeAction:(UIButton *)sender {
    
}

- (void)saveAction:(UIButton *)sender {
    
}

@end
