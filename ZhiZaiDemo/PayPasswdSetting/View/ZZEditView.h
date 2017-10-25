//
//  ZZEditView.h
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITextInputTraits;

@interface ZZEditView : UILabel<UIKeyInput>

@property (nonatomic, strong) NSMutableString *inputText;

@property (nonatomic,strong) UIView *inputView;
@property (nonatomic, strong) UIView *inputAccessoryView;

@property (nonatomic, assign) NSUInteger paswdLength;

@end
