//
//  ZZBindAliPayVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZBindAliPayVC.h"

@interface ZZBindAliPayVC ()

@end

@implementation ZZBindAliPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = @[@""].copy;
    
    self.dataTableView.separatorColor = UIColor.clearColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f * 2 + 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 70.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdenityf = @"CellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenityf];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenityf];
        cell.clipsToBounds = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        {
            JVFloatLabeledTextField *nameTF = JVFloatLabeledTextField.new;
            nameTF.placeholder = @"请输入您的姓名";
            nameTF.borderStyle = UITextBorderStyleRoundedRect;
            nameTF.clipsToBounds = NO;
            nameTF.floatingLabel.text = @" 姓名 ";
            nameTF.floatingLabelYPadding = -8.0f;
            nameTF.floatingLabelActiveTextColor = [UIColor orangeColor];
            nameTF.floatingLabel.backgroundColor = [UIColor whiteColor];
            
            [cell.contentView addSubview:nameTF];
            
            [nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.contentView).offset(10.0f);
                make.right.mas_equalTo(cell.contentView).offset(-10.0f);
                make.top.mas_equalTo(cell.contentView).offset(15.0f);
                make.height.mas_equalTo(30.0f);
            }];
            
            JVFloatLabeledTextField *aliPayAccountTF = JVFloatLabeledTextField.new;
            aliPayAccountTF.placeholder = @"请输入您的支付宝账号";
            aliPayAccountTF.clipsToBounds = NO;
            aliPayAccountTF.borderStyle = UITextBorderStyleRoundedRect;
            aliPayAccountTF.floatingLabel.text = @" 支付宝账号 ";
            aliPayAccountTF.floatingLabelYPadding = -8.0f;
            aliPayAccountTF.floatingLabelActiveTextColor = [UIColor orangeColor];
            aliPayAccountTF.floatingLabel.backgroundColor = [UIColor whiteColor];
            
            [cell.contentView addSubview:aliPayAccountTF];
            
            [aliPayAccountTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.contentView).offset(10.0f);
                make.right.mas_equalTo(cell.contentView).offset(-10.0f);
                make.top.mas_equalTo(nameTF.mas_bottom).offset(15.0f);
                make.height.mas_equalTo(30.0f);
            }];
        }
        
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *headerIdenity = @"CellIdentify";
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdenity];
    if (nil == header) {
        
        CGFloat height = [self tableView:tableView heightForHeaderInSection:section];
        
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerIdenity];
        header.frame = CGRectMake(0, 0, SCREENWIDTH, height);
        
        UILabel *contentLB = [[UILabel alloc] initWithFrame:CGRectOffset(header.bounds, 11.0f, 5.0f)];
        contentLB.text = @"请绑定本人的支付宝";
        
        [header.contentView addSubview:contentLB];
    }
    
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    static NSString *footerIdenity = @"Footerdentify";
    
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdenity];
    if (nil == footer) {
        
        CGFloat height = [self tableView:tableView heightForFooterInSection:section];
        
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:footerIdenity];
        footer.frame = CGRectMake(0, 0, SCREENWIDTH, height);
        
        UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 11, SCREENWIDTH - 22.0f, 50.0f)];
        okButton.layer.cornerRadius = 5.0f;
        [okButton setBackgroundColor:[UIColor orangeColor]];
        
        [okButton setTitle:@"确定" forState:UIControlStateNormal];
        
        [footer.contentView addSubview:okButton];
    }
    
    return footer;
}

@end
