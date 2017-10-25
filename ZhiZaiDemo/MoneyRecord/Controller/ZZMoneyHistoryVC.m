//
//  ZZMoneyHistoryVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/24.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZMoneyHistoryVC.h"
#import "ZZMoneyRecordHeaderView.h"

@interface ZZMoneyHistoryVC ()

@property (nonatomic, strong) ZZMoneyRecordHeaderView *headerView;

@end

@implementation ZZMoneyHistoryVC

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
    [self.view addSubview:self.headerView];
}

#pragma mark - Setter && Getter method

- (ZZMoneyRecordHeaderView *)headerView {
    if (nil == _headerView) {
        _headerView = [[ZZMoneyRecordHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 300)];
    }
    return _headerView;
}


@end
