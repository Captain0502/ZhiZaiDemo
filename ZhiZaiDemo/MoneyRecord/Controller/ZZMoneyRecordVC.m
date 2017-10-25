//
//  ZZMoneyRecordVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/24.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZMoneyRecordVC.h"
#import "ZZMoneyRecordHeaderView.h"
#import <MJRefresh/MJRefresh.h>

@interface ZZMoneyRecordVC () {
    CGRect originFrame;
}

@property (nonatomic, strong) ZZMoneyRecordHeaderView *headerView;

@end

@implementation ZZMoneyRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    originFrame = CGRectMake(0, 0, SCREENWIDTH, 288);
    
    self.dataArray = @[@"",@"",@""].mutableCopy;
//    for (NSInteger i = 0; i < 100; ++i) {
//        [self.dataArray addObject:@(i)];
//    }
    
    [self setupUI];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  UI 界面
#pragma mark - Setter && Getter method

- (ZZMoneyRecordHeaderView *)headerView {
    
    if (nil == _headerView) {
        _headerView = [[ZZMoneyRecordHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 300)];
    }
    
    return _headerView;
}


- (void)setupUI {

    [self.view addSubview:self.headerView];
    
    self.dataTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataTableView.mj_header endRefreshing];
    }];
    
    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView.mas_bottom).offset(-60.0f);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
}


#pragma mark - Tableview Delegate and datasouce method implement

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentify = @"CellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.clipsToBounds = YES;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Private method

- (void)loadData {
    [self.dataTableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    NSLog(@"%f",offsetY);
    
    if (-64 > offsetY || offsetY < 64) {
        return;
    }

    CGRect tempFrame = originFrame;
    tempFrame.origin.y -= offsetY + 88;
    self.headerView.frame = tempFrame;
}

@end
