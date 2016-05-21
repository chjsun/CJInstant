//
//  CJBaseTableViewController.m
//  instant
//
//  Created by chjsun on 16/5/18.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJBaseTableViewController.h"

#import "CJBaseTableViewCell.h"

#import "RTDragCellTableView.h"

@interface CJBaseTableViewController ()<RTDragCellTableViewDataSource, RTDragCellTableViewDelegate>

/** shujuyuan */
@property (nonatomic, strong) NSMutableArray *listTeams;

@end

@implementation CJBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[RTDragCellTableView alloc] init];
    
    //允许选中行
    self.tableView.allowsSelection = YES;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    self.navigationItem.title =@"移动单元格";
    
    //设置选中时的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.listTeams =[NSMutableArray arrayWithObjects:@{@"age":@"12"},
                                                     @{@"age":@"122"},
                                                     @{@"age":@"11"} , nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.listTeams.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CJBaseTableViewCell *cell = [CJBaseTableViewCell baseCellForTableView:tableView];
    
    // Configure the cell...
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.data = self.listTeams[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGSize size = [UIScreen mainScreen].bounds.size;
    return size.height/6;
}

#pragma mark - datasource
-(NSArray *)originalArrayDataForTableView:(RTDragCellTableView *)tableView{
    return self.listTeams;
}

#pragma mark - delegate
-(void)tableView:(RTDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray{
//    self.listTeams = (NSMutableArray *)newArray;
}

@end
