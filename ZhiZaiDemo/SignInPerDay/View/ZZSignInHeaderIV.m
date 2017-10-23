//
//  ZZSignInHeaderIV.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZSignInHeaderIV.h"

@interface ZZSignInHeaderIV()

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *daysLB;
@property (nonatomic, strong) UILabel *fundLB;

@end

@implementation ZZSignInHeaderIV

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    self.image = [UIImage imageNamed:@"temp.jpeg"];
    
    {
        //  头像
        if (nil == _headerImageView) {
            _headerImageView = UIImageView.new;
            _headerImageView.image = [UIImage imageNamed:@"header.jpg"];
            _headerImageView.clipsToBounds = YES;
            _headerImageView.layer.cornerRadius = 30.0f;
            
            [self addSubview:_headerImageView];
            
            [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(60, 60));
            }];
        }
    }
    
    //  seperateline
    UIView *seperateline = UIView.new;
    seperateline.backgroundColor = UIColor.redColor;
    
    [self addSubview:seperateline];
    
    [seperateline mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self).offset(-11.0f);
        make.size.mas_equalTo(CGSizeMake(1.0f, 30));
    }];
    
    {
        //  签到

        if (nil == _daysLB) {
            _daysLB = UILabel.new;
            _daysLB.text = @"连续签到10天";
            _daysLB.textAlignment = NSTextAlignmentRight;

            [self addSubview:_daysLB];

            [_daysLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(seperateline);
                make.right.mas_equalTo(seperateline).mas_offset(-8.0f);
            }];

        }
    }

    {
        //  fund
        if (nil == _fundLB) {
            _fundLB = UILabel.new;
            _fundLB.text = @"10 Y";

            [self addSubview: _fundLB];

            [_fundLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(seperateline.mas_right).offset(8.0f);
                make.centerY.mas_equalTo(seperateline);;
            }];
        }
    }
}

@end
