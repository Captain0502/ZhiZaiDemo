//
//  ZZFundHeaderView.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/19.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZFundHeaderView.h"
#import "Masonry.h"

@interface ZZFundHeaderView()

@property (nonatomic, strong) UIImageView *haderIV;
@property (nonatomic, strong) UILabel *nameLB;
@property (nonatomic, strong) UILabel *fundLB;

@end

@implementation ZZFundHeaderView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.orangeColor;
        
        [self setupUI];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {

}

- (void)setupUI {
    {
        //  头像
        if (nil == _haderIV) {
            _haderIV = UIImageView.new;// [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            _haderIV.contentMode = UIViewContentModeScaleAspectFit;
            
            [self addSubview:_haderIV];
            
            [_haderIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(11.0f);
                make.center.mas_equalTo(self.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(60, 60));
            }];
        }
        
        _haderIV.image = [UIImage imageNamed:@"Alipay"];
    }
    
    {
        //  名字
        if (nil == _nameLB) {
            _nameLB = UILabel.new;
            
            [self addSubview:_nameLB];
            
            [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_haderIV.mas_right).mas_offset(11);
                make.top.mas_equalTo(_haderIV);
            }];
        }
        
        _nameLB.text = @"亚马逊";
    }
    
    {
        //  金额
        if (nil == _fundLB) {
            _fundLB = UILabel.new;
            
            [self addSubview:_fundLB];
            
            [_fundLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.haderIV.mas_right).mas_offset(11);
                make.bottom.mas_equalTo(self.haderIV);
            }];
        }
        
        _fundLB.text = @"100.0";
    }
}




@end
