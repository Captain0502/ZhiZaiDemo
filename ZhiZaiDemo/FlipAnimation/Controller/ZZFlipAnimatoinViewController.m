//
//  ZZFlipAnimatoinViewController.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZFlipAnimatoinViewController.h"

@interface ZZFlipAnimatoinViewController ()<CAAnimationDelegate>

@end

@implementation ZZFlipAnimatoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40.0f)];
    label.backgroundColor = UIColor.redColor;
    label.textColor = UIColor.whiteColor;
    label.text = @"1235";
    
    [self.view addSubview:label];
    
    NSMutableAttributedString *str0 = [[NSMutableAttributedString alloc] initWithString:@"123" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30.0]}];
    
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:@"元" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10.0]}];
    
    [str0 appendAttributedString:str1];
    
    label.attributedText = str0;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animationAction:(id)sender {

    
//    [UIView beginAnimations:@"11" context:nil];
//    [UIView setAnimationDuration:0.1f];
//    [UIView setAnimationRepeatCount:10];
//
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.testIV cache:YES];
//    [UIView setAnimationDelegate:self];
//
//    [UIView commitAnimations];
    
    [UIView transitionWithView:self.testIV duration:1.0f options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionCurveLinear animations:^{
        self.testIV.image = [UIImage imageNamed:@"temp.jpeg"];
    } completion:^(BOOL finished) {

    }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s",__FUNCTION__);
}

@end
