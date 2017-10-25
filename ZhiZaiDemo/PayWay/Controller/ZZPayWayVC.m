//
//  ZZPayWayVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZPayWayVC.h"
#import "ZZBindAliPayVC.h"
#import "ZZBindBankVC.h"

@interface ZZPayWayVC ()

@end

@implementation ZZPayWayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = @[@"000",@"111"].copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
#if 0
    ZZBindAliPayVC *bindAliPayVC = [[ZZBindAliPayVC alloc] init];
    
    [self.navigationController pushViewController:bindAliPayVC animated:YES];
#else
    ZZBindBankVC *bindAliPayVC = [[ZZBindBankVC alloc] init];
    
    [self.navigationController pushViewController:bindAliPayVC animated:YES];
#endif
}


@end
