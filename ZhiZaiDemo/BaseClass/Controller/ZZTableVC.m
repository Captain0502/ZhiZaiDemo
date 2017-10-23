//
//  ZZTableVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/19.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZTableVC.h"

@interface ZZTableVC ()

@end

@implementation ZZTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setter && Getter method


- (UITableView *)dataTableView {
    
    if (nil == _dataTableView) {
        _dataTableView = [[UITableView alloc] initWithFrame:CGRectOffset(self.view.bounds, 0, 0) style:UITableViewStyleGrouped];
        _dataTableView.delegate = self;
        _dataTableView.dataSource = self;
        
        [self.view addSubview:_dataTableView];
    }
    
    return _dataTableView;
}

#pragma mark - Tableview Delegate and datasouce method implement

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentify = @"CellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.clipsToBounds = YES;
    }
    
    cell.textLabel.text = @"TextLabel";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Private method

- (void)loadData {
    [self.dataTableView reloadData];
}



@end
