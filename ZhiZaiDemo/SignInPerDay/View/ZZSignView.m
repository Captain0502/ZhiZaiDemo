//
//  ZZSignView.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZSignView.h"
#import "ZZDrawView.h"

@implementation ZZSignView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)signInAction:(id)sender {
    
    ZZDrawView *drawView = [[NSBundle mainBundle] loadNibNamed:[ZZDrawView description] owner:nil options:nil].firstObject;
    drawView.frame = [UIApplication sharedApplication].keyWindow.bounds;
    drawView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.75f];
    
    [[UIApplication sharedApplication].keyWindow addSubview:drawView];
}
@end
