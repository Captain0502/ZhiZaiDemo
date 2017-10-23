//
//  ZZFundRecordCell.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/19.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZFundRecordCell.h"

@interface ZZFundRecordCell()

@property (nonatomic, strong) UILabel *descLB;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *moneyLB;

@end

@implementation ZZFundRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
    {
        //  描述
        if (nil == _descLB) {
            _descLB = UILabel.new;
            
            [self addSubview:_descLB];
            
            [_descLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(11.0f);
                make.left.mas_equalTo(11.0f);
            }];
            
            _descLB.text = @"补充个人信息";
        }
    }
    
    {
        if (nil == _timeLB) {
            _timeLB = UILabel.new;
            
            [self addSubview:_timeLB];
            
            [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(11.0f);
                make.bottom.mas_equalTo(-11.0f);
            }];
        }
        
        _timeLB.text = @"2017-12-3";
    }
    
    {
        if (nil == _moneyLB) {
            _moneyLB = UILabel.new;
            _moneyLB.textAlignment = NSTextAlignmentRight;
            
            [self addSubview:_moneyLB];
            
            [_moneyLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-11.0f);
                make.center.mas_equalTo(self);
            }];
        }
        
        _moneyLB.text = @"+10";
    }

}

- (void)setDes:(NSString *)des {
    _des = des;
    
    _descLB.text = _des;
}

@end
