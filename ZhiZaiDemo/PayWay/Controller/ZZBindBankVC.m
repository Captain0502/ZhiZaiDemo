//
//  ZZBindBankVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZBindBankVC.h"

@interface ZZBindBankVC ()

@property (nonatomic, strong) UIButton *bankTypePickBT;
@property (nonatomic, strong) UIPickerView *bankTypePicker;
@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation ZZBindBankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.dataArray = @[@"",@"",@""].copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setter && Getter
- (UIButton *)bankTypePickBT {
    if (nil == _bankTypePickBT) {
        
        _bankTypePickBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30.0f, 30.0f)];
        _bankTypePickBT.backgroundColor = [UIColor redColor];
        
        [_bankTypePickBT addTarget:self action:@selector(showPickView:) forControlEvents:UIControlEventTouchUpInside];
        [_bankTypePickBT setTitle:@"请选择银行" forState:UIControlStateNormal];
        
        [_bankTypePickBT setImage:[UIImage imageNamed:@"SignIn"] forState:UIControlStateNormal];
    }
    
    return _bankTypePickBT;
}

- (void)showPickView:(id)sender {
    
    UITableViewCell *cell = [self.dataTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    JVFloatLabeledTextField *tf = [cell.contentView viewWithTag:9527 + 1];
    if (nil != tf) {
        [tf becomeFirstResponder];
    }
}

- (UIPickerView *)bankTypePicker {
    
    if (nil == _bankTypePicker) {
        
        _bankTypePicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        _bankTypePicker.delegate = self;
        _bankTypePicker.dataSource = self;
    }
    
    return _bankTypePicker;
}

- (UIToolbar *)toolBar {
    
    if (nil == _toolBar) {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50.0)];
        
        UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
        
        _toolBar.items = @[flexItem, doneItem];
    }
    
    return _toolBar;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f + 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 70.0f;
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
            nameTF.tag = indexPath.row + 9527;
            nameTF.placeholder = @"请输入您的姓名";
            nameTF.borderStyle = UITextBorderStyleRoundedRect;
            nameTF.clipsToBounds = NO;
            nameTF.rightViewMode = UITextFieldViewModeAlways;
            nameTF.floatingLabel.text = @" 姓名 ";
            nameTF.floatingLabelYPadding = -8.0f;
            nameTF.floatingLabelActiveTextColor = [UIColor orangeColor];
            nameTF.floatingLabel.backgroundColor = [UIColor whiteColor];
            
            if (1 == indexPath.row) {
                nameTF.rightView = self.bankTypePickBT;
                nameTF.inputView = self.bankTypePicker;
                nameTF.inputAccessoryView = self.toolBar;
            }
            else
            {
                nameTF.rightView = nil;
                nameTF.inputView = nil;
                nameTF.inputAccessoryView = nil;
            }
            
            [cell.contentView addSubview:nameTF];
            
            [nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.contentView).offset(10.0f);
                make.right.mas_equalTo(cell.contentView).offset(-10.0f);
                make.top.mas_equalTo(cell.contentView).offset(15.0f);
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 11;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"111";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    UITableViewCell *cell = [self.dataTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    JVFloatLabeledTextField *tf = [cell.contentView viewWithTag:9527 + 1];
    if (nil != tf) {
        tf.text = [NSString stringWithFormat:@"%@",@(row)];
    }
}

#pragma mark - private method

- (void)doneAction:(id)sender {
    [self.view endEditing:YES];
}

@end
