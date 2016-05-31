//
//  CJMonthViewController.m
//  instant
//
//  Created by chjsun on 16/5/21.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJMonthViewController.h"

#import "CJBaseTableViewController.h"

@interface CJMonthViewController ()

@end

@implementation CJMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *data = [NSMutableArray array];
    
    [data addObject:@{@"event": @"死亡倒计时"}];
    [data addObject:@{@"event": @"死亡计时"}];
    [data addObject:@{@"event": @"死倒计时"}];
    [data addObject:@{@"event": @"亡倒计时"}];
    [data addObject:@{@"event": @"死亡倒时"}];
    [data addObject:@{@"event": @"死亡倒时"}];
    [data addObject:@{@"event": @"死亡倒时"}];
    [data addObject:@{@"event": @"死亡倒时"}];
    [data addObject:@{@"event": @"死亡倒时"}];
    
    self.data = data;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"month");
}

@end
