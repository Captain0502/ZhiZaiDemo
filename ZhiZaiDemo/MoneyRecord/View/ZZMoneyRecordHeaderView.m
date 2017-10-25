//
//  ZZMoneyRecordHeaderView.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/24.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZMoneyRecordHeaderView.h"

@interface ZZMoneyRecordHeaderView() {
    NSDictionary *options;
}

@property (nonatomic, strong) UILabel *banlanceLB;

@end


@implementation ZZMoneyRecordHeaderView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializedBaesPropertie];
        [self setupUI];
    }
    
    return self;
}

- (void)initializedBaesPropertie {
    
    self.backgroundColor = UIColor.orangeColor;
    
}

- (void)setupUI {

    {
        //  金额
        if (nil == self.banlanceLB) {
            self.banlanceLB = UILabel.new;
            self.banlanceLB.font = [UIFont systemFontOfSize:30.0f];
            self.banlanceLB.text = @"0.00元";
            self.banlanceLB.textColor = UIColor.whiteColor;
            
            
            [self addSubview:self.banlanceLB];
            
            [self.banlanceLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).offset(11.0f);
                make.bottom.mas_equalTo(self).offset(-20.0f);
            }];
            
            [self coretexWith:@"200000000.00"];
        }
    }
    
    
    {
        //  hint label
        UILabel *hintLabel = UILabel.new;
        hintLabel.text = @"钱包余额";
        hintLabel.textColor = UIColor.whiteColor;
        
        [self addSubview:hintLabel];
        
        [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(11.0f);
            make.bottom.mas_equalTo(self.banlanceLB.mas_top).offset(-20.0f);
        }];
    }
    
}

- (void)coretexWith:(NSString *)money {

    NSMutableAttributedString *str0 = [[NSMutableAttributedString alloc] initWithString:money attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30.0]}];
    
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:@"元" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10.0]}];
    
    [str0 appendAttributedString:str1];
    
    self.banlanceLB.attributedText = str0;
}

@end
