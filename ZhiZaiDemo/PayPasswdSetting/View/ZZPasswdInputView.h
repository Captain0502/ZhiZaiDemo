//
//  ZZPasswdInputView.h
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/24.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZPasswdInputView : UILabel<UIKeyInput>

@property (nonatomic,strong) UIView *inputView;
@property (nonatomic, strong) UIView *inputAccessoryView;

@property (nonatomic, assign) NSUInteger paswdLength;

@property (nonatomic, strong) NSMutableString *inputText;


/**
 初始化对象

 @param frame 视图尺寸
 @param passwdLength 密码长度
 @return 实例
 */
- (id)initWithFrame:(CGRect)frame with:(NSInteger)passwdLength ;

@end
