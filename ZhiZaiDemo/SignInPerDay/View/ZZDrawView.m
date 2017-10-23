//
//  ZZDrawView.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZDrawView.h"

@interface ZZDrawView()<CAAnimationDelegate> {
    NSInteger currentIndex;
}
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *drawBTC;

@end


@implementation ZZDrawView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.drawBTC enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.exclusiveTouch = YES;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickAction:(UIButton *)sender {
    NSLog(@"%@",@(sender.tag));
    
    currentIndex = sender.tag;
    
    [UIView beginAnimations:@"11" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationRepeatCount:10];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:sender cache:YES];
    [UIView setAnimationDelegate:self];
    
    [UIView commitAnimations];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s",__FUNCTION__);
    
    sleep(1);
    
    [self.drawBTC enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != currentIndex) {
            [UIView transitionWithView:obj duration:1.0f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                
            } completion:^(BOOL finished) {
                
            }];
        }
    }];
}

@end
