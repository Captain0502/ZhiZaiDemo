//
//  ZZDiyTF.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/23.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZDiyTF.h"

@implementation ZZDiyTF

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self removeLongGst];
    }
    
    return self;
}

- (void)removeLongGst {
    UILongPressGestureRecognizer *lgst = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(doNothing:)];
    [super addGestureRecognizer:lgst];
//    NSMutableArray *gsts = [NSMutableArray arrayWithArray:self.gestureRecognizers];
//
//    [gsts enumerateObjectsUsingBlock:^(UIGestureRecognizer  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[UILongPressGestureRecognizer class]]) {
//            NSLog(@"--");
//            [gsts removeObject:obj];
//        }
//    }];
//
//    self.gestureRecognizers = gsts;
}

- (void)doNothing:(id)sender {
    NSLog(@"11111");
}


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if ([UIMenuController sharedMenuController]) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

@end
