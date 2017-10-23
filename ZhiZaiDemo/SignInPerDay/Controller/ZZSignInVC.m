//
//  ZZSignInVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZSignInVC.h"
#import "ZZSignInHeaderIV.h"
#import "ZZSignView.h"
#import "ZZSignHelpView.h"
#import "ZZDrawView.h"

@interface ZZSignInVC ()

@end

@implementation ZZSignInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    
    ZZSignInHeaderIV *headerView = [[ZZSignInHeaderIV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 300)];
    
    [self.view addSubview:headerView];
    
    ZZSignView *signInView = [[NSBundle mainBundle] loadNibNamed:[ZZSignView description] owner:nil options:nil].firstObject;
    signInView.backgroundColor = UIColor.lightGrayColor;
    signInView.frame = CGRectMake(0, headerView.bounds.size.height + 8, SCREENWIDTH, 130);
    
    [self.view addSubview:signInView];
    
    ZZSignHelpView *helpView = [[NSBundle mainBundle] loadNibNamed:[ZZSignHelpView description] owner:nil options:nil].firstObject;//[[ZZSignHelpView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 100)];
    helpView.frame = CGRectMake(0, headerView.bounds.size.height + 8 + signInView.bounds.size.height + 8, SCREENWIDTH, 50);
    
    [self.view addSubview:helpView];
}

@end
