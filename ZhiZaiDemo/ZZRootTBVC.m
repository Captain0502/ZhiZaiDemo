//
//  ZZRootTBVC.m
//  ZhiZaiDemo
//
//  Created by wangzhangchuan on 2017/10/19.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "ZZRootTBVC.h"

@interface ZZRootTBVC ()

@property (nonatomic, strong) NSArray <NSDictionary *> *functionList;

@end

@implementation ZZRootTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setupUI];
    
    [self loadData];
}

- (void)initializedBaseProperties {
    
}

- (void)setupUI {
    self.title = @"功能列表";
}

#pragma mark Setter && Getter method implement
- (NSArray <NSDictionary *> *)functionList {
    if (nil == _functionList) {
        
        NSString *configPath = [[NSBundle mainBundle] pathForResource:@"FunctionList" ofType:@"plist"];

        _functionList = [[NSArray alloc] initWithContentsOfFile:configPath];
    }
    
    return _functionList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functionList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentify = @"CellIdentify";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    
    NSDictionary *classConfigDict = [self.functionList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [classConfigDict valueForKey:@"Description"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *classConfigDict = [self.functionList objectAtIndex:indexPath.row];
    NSString *classString = [classConfigDict valueForKey:@"ClassName"];
    
    [self push2VCWith:classString];
}

- (void)push2VCWith:(NSString *)className {
    
    Class c = NSClassFromString(className);
    
    UIViewController *vc = c.new;
    vc.view.backgroundColor = UIColor.grayColor;
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Private method

- (void)loadData {
    [self.tableView reloadData];
}

@end
