//
//  ZZEditView.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZEditView.h"

@implementation ZZEditView {
    NSMutableString *secureText;
    NSDictionary *options;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initializedBaseProperties];
        
        [self setupUI];
    }
    
    return self;
}

- (void)initializedBaseProperties {
    
    //  默认密码长度设置为6位数
    if (0 == self.paswdLength) {
        self.paswdLength = 6;
    }
    
    secureText = @"".mutableCopy;
    self.inputText = @"".mutableCopy;
    
    NSAttributedString *tempStr = [[NSMutableAttributedString alloc] initWithString:@"******" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.0f]}];
    
    CGSize size = [tempStr size];
    
    CGFloat offsetWithPerUint = (self.bounds.size.width - size.width) / self.paswdLength;
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.firstLineHeadIndent = offsetWithPerUint / 2.0f;
    
    options = @{NSKernAttributeName : @(offsetWithPerUint),
                NSForegroundColorAttributeName : UIColor.blueColor,
                NSFontAttributeName : [UIFont systemFontOfSize:16.0f]
                ,
                NSParagraphStyleAttributeName : style
                }.copy;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapAction:)];
    
    [self addGestureRecognizer:tap];
    
}

- (void)setupUI {
    
    CGFloat offsetWithPerUint = self.bounds.size.width / self.paswdLength;
    CGFloat offsetHeightPerUnit = self.bounds.size.height;
    
    for (NSInteger i = 1; i < self.paswdLength; ++i) {
        
        UIView *seperateLine = [[UIView alloc] initWithFrame:CGRectMake(i * offsetWithPerUint, 0, 1.0f, offsetHeightPerUnit)];
        seperateLine.backgroundColor = UIColor.blueColor;
        
        [self addSubview: seperateLine];
    }
    
}

//  实现代理
- (BOOL)canBecomeFirstResponder { return YES;};
- (BOOL)hasText {return YES;}

- (void)insertText:(NSString *)text {

    if (self.inputText.length >= self.paswdLength) {
        return;
    }
    
    //键盘输入，追加字符
    [self.inputText appendString:text];
    
    [secureText appendString:text];
    
    [self update];
    
};

- (void)deleteBackward {

    //  使用退格键，删除最后一个字符
    if (self.inputText.length > 0) {
        [self.inputText deleteCharactersInRange:NSMakeRange(self.inputText.length - 1, 1)];
        [secureText deleteCharactersInRange:NSMakeRange(secureText.length - 1, 1)];
    }

    //  退格直接为星号显示 eg：*******
    self.attributedText = [[NSAttributedString alloc] initWithString:secureText attributes:options];
};

- (void)update {
    {
        //  替换除最后一个字符外的其他字符为*  eg: **********8
        NSMutableString *tempstr = @"".mutableCopy;
        for (NSInteger i = 0; i < secureText.length - 1 && secureText.length > 0; ++i) {
            [tempstr appendString:@"*"];
        }
        if (secureText.length > 0) {
            [secureText replaceCharactersInRange:NSMakeRange(0, secureText.length - 1) withString:tempstr];
        }
        
        self.attributedText = [[NSAttributedString alloc] initWithString:secureText attributes:options];
    }
    
    {
        //  在一秒后设置最后一个字符为"*"
        if (secureText.length > 0) {
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showWithSecurText:) object:nil];
            [self performSelector:@selector(showWithSecurText:) withObject:nil afterDelay:1.0f];
        }
    }
}



/**
 将最后一个字符设置为星号

 @param object 最终获得的星号字符串
 */
- (void)showWithSecurText:(id)object {

    if (secureText.length > 0) {
        [secureText replaceCharactersInRange:NSMakeRange(secureText.length - 1, 1) withString:@"*"];
    }

    self.attributedText = [[NSAttributedString alloc] initWithString:secureText attributes:options];
}


/**
 设置是否使用密码方式显示
 
 @return  只对TextField和TextView 生效，查看文档：
 @warning This property is set to NO by default. Setting this property to YES in any view that
 conforms to UITextInputTraits disables the user’s ability to copy the text in the view. Setting
 this property to YES in a UITextField object additionally enables a password-style experience,
 in which the text being entered is obscured.
 */
- (BOOL)isSecureTextEntry {
    return YES;
}


#pragma mark - Private method

- (void)tapAction:(id)sender {
    [self becomeFirstResponder];
}

@end
