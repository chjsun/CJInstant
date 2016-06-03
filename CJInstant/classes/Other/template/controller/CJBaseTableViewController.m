//
//  CJBaseTableViewController.m
//  instant
//
//  Created by chjsun on 16/5/18.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJBaseTableViewController.h"

#import "CJBaseTableViewCell.h"
#import "CJUseTime.h"
#import "CJCell.h"
#import "CJAddViewController.h"

#import "RTDragCellTableView.h"

@interface CJBaseTableViewController ()<RTDragCellTableViewDataSource, RTDragCellTableViewDelegate, addViewControllerDelegate>
/** 时间处理 */
@property (nonatomic, strong) CJUseTime *usetime;
@end

@implementation CJBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[RTDragCellTableView alloc] init];
    [self.tableView setContentInset:UIEdgeInsetsMake(5, 0, 0, 0)];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //允许选中行
    self.tableView.allowsSelection = YES;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //设置选中时的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CJBaseTableViewCell *cell = [CJBaseTableViewCell baseCellForTableView:tableView];
    
    // Configure the cell...
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.cell = self.data[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return CJItemHeight;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    CJAddViewController *addControl = [[CJAddViewController alloc] init];
//    addControl.delegate = self;
//    
//    [self presentViewController:addControl animated:YES completion:nil];
//    NSLog(@"ssss");
//
//}

#pragma mark - datasource
-(NSArray *)originalArrayDataForTableView:(RTDragCellTableView *)tableView{
    return self.data;
}

#pragma mark - delegate
-(void)tableView:(RTDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray{
    self.data = (NSMutableArray *)newArray;
}

@end
