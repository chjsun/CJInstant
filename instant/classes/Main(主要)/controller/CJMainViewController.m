//
//  CJMainViewController.m
//  instant
//
//  Created by chjsun on 16/5/18.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJMainViewController.h"

#import "CJBaseTableViewController.h"

@interface CJMainViewController ()

@end

@implementation CJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpFrameWork];
}

-(void) setUpFrameWork{
    
    CJBaseTableViewController *base = [[CJBaseTableViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:base];
    nav.title = @"我不是针对谁，我是说你们全都是辣鸡";
    
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
}

@end
