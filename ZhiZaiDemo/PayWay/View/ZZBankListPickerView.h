//
//  ZZBankListPickerView.h
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZBankListPickerView : UIPickerView<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, copy) void (^actionBlock)(NSString *bankName);

@end
