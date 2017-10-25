//
//  ZZChargeRecordVC.m
//  ZhiZaiDemo
//
//  Created by captain on 2017/10/25.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZChargeRecordVC.h"
#import <MJRefresh.h>

@interface ZZChargeRecordVC ()

@end

@implementation ZZChargeRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = @[@"",@""].mutableCopy;
    

//    self.dataTableView.frame = CGRectOffset(self.dataTableView.frame, 0, 300);
    
    self.dataTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataTableView.mj_header endRefreshing];
    }];

    [self loadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
