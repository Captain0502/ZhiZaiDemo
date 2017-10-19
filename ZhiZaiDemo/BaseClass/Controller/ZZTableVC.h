//
//  ZZTableVC.h
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/19.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZBaseViewController.h"

@interface ZZTableVC : ZZBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *dataTableView;

@end
