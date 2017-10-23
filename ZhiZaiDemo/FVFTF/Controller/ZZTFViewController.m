//
//  ZZTFViewController.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/20.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZTFViewController.h"

@interface ZZTFViewController ()

@end

@implementation ZZTFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    JVFloatLabeledTextField *testTF = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    testTF.placeholder = @"hello";
    testTF.borderStyle = UITextBorderStyleRoundedRect;
    testTF.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Title", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}];
    testTF.floatingLabelTextColor = [UIColor orangeColor];
    testTF.floatingLabelActiveTextColor = [UIColor orangeColor];
    
    [self.view addSubview:testTF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
