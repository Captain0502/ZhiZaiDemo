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
    for (NSInteger i = 0; i < 100; ++i) {
        [self.dataArray addObject:@(i)];
    }
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  UI 界面
#pragma mark - Setter && Getter method

- (ZZMoneyRecordHeaderView *)headerView {
    
    if (nil == _headerView) {
        _headerView = [[ZZMoneyRecordHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 500)];
    }
    
    return _headerView;
}


- (void)setupUI {
    
//    [self.view addSubview:self.headerView];
    
    self.dataTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataTableView.mj_header endRefreshing];
    }];
}


#pragma mark - Tableview Delegate and datasouce method implement

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 210;
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *headerIndentify = @"HeaderIdentify";

    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIndentify];
    if (nil == headerView) {
        
        CGFloat heiht = [self tableView:tableView heightForHeaderInSection:section];
        
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerIndentify];
        headerView.frame = CGRectMake(0, 0, SCREENWIDTH, heiht);


//        ZZMoneyRecordHeaderView *moneyView = [[ZZMoneyRecordHeaderView alloc] initWithFrame:CGRectOffset(headerView.bounds, 0, -10.0f)];
//        moneyView.backgroundColor = UIColor.orangeColor;
//
//        [headerView.contentView addSubview:moneyView];
    }
    
    return headerView;
}

#pragma mark - Private method

- (void)loadData {
    [self.dataTableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < - 130) {
        
        offsetY = -130 + (offsetY + 130) * 0.3;
        
        if (offsetY < - 170) {
            return;
        }
    }
    
    NSLog(@"%f",offsetY);
    
    CGRect tempFrame = originFrame;
    tempFrame.origin.y -= offsetY + 88;
    self.headerView.frame = tempFrame;

//    [self.view bringSubviewToFront:self.headerView];
//    self.headerView.transform = CGAffineTransformMakeScale(2, 2);
}

@end
