//
//  ZZFundRecordVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/19.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZFundRecordVC.h"
#import "ZZFundHeaderView.h"
#import "ZZFundRecordCell.h"

@interface ZZFundRecordVC ()

@end

@implementation ZZFundRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = @[@"111",@"222"].copy;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdenitify = @"CellIdentify";
    
    ZZFundRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenitify];
    if (nil == cell) {
        cell = [[ZZFundRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenitify];
        cell.clipsToBounds = YES;
    }
    
    cell.des = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *headerIdenityf = @"HeaderIdentify";
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdenityf];
    if (nil == header) {
        
        CGFloat height = [self tableView:tableView heightForHeaderInSection:section];
        
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerIdenityf];
        header.frame = CGRectMake(0, 0, SCREENWIDTH, height);
        
        ZZFundHeaderView *headerContentV = [[ZZFundHeaderView alloc] initWithFrame:header.bounds];
        
        [header.contentView addSubview:headerContentV];
        
        header.contentView.backgroundColor = [UIColor orangeColor];
    }
    
    return header;
}

@end
