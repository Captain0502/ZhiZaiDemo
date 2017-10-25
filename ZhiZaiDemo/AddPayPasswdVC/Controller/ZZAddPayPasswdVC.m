//
//  ZZAddPayPasswdVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/24.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZAddPayPasswdVC.h"
#import "ZZPasswdInputView.h"

@interface ZZAddPayPasswdVC ()

@property (nonatomic, strong) ZZPasswdInputView *passwdView, *confirmPasswdView;

@end

@implementation ZZAddPayPasswdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializedBasePropertis {
    
}

- (void)setupUI {
    
    NSLog(@"%@",self.navigationController.navigationBar);
    
    UILabel *hintLabel0 = UILabel.new;
    hintLabel0.textAlignment = NSTextAlignmentCenter;
    hintLabel0.text = @"请输入支付密码";
//    hintLabel0.backgroundColor = UIColor.grayColor;
    
    [self.view addSubview:hintLabel0];
    
    [hintLabel0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(88.0f + 20.0f);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50.0f);
    }];
    
    
    if (nil == self.passwdView) {
        
        self.passwdView = [[ZZPasswdInputView alloc] initWithFrame:CGRectMake(50.0f, 64.0f + hintLabel0.bounds.size.height, SCREENWIDTH - 100.0f, 44.0f) with:6];


        [self.view addSubview:self.passwdView];
        
        [self.passwdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(hintLabel0.mas_bottom);
            make.left.mas_equalTo(50);
            make.right.mas_equalTo(-50);
            make.height.mas_equalTo(44);
        }];
    }
    
    UILabel *hintLabel1      = UILabel.new;
    hintLabel1.text          = @"请再次输入支付密码";
    hintLabel1.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:hintLabel1];

    [hintLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwdView.mas_bottom).offset(20.0f);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50.0f);
    }];
    

    if (nil == self.confirmPasswdView) {

        CGRect frame = CGRectMake(50, 0, SCREENWIDTH - 100.0f, 44.0f);

        self.confirmPasswdView = [[ZZPasswdInputView alloc] initWithFrame:frame with:6];

        [self.view addSubview:self.confirmPasswdView];
    }

    [self.confirmPasswdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hintLabel1.mas_bottom);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(44);
    }];
    
    
    UIButton *saveButton = UIButton.new;
    saveButton.backgroundColor    = UIColor.orangeColor;
    saveButton.layer.cornerRadius = 5.0f;

    [saveButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    
    [self.view addSubview:saveButton];
    
    [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(11.0f);
        make.right.mas_equalTo(-11.0f);
        make.top.mas_equalTo(self.confirmPasswdView.mas_bottom).offset(100.0f);
        make.height.mas_equalTo(50.0f);
    }];
    
    UIButton *findPasswdButton = UIButton.new;
    
    [findPasswdButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [findPasswdButton setTitle:@"忘记支付密码" forState:UIControlStateNormal];
    [findPasswdButton setImage:[UIImage imageNamed:@"YRecord"] forState:UIControlStateNormal];
    
    [self.view addSubview:findPasswdButton];
    
    [findPasswdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(saveButton.mas_bottom).offset(8.0f);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30.0f));
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
