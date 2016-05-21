//
//  CJBaseTableViewCell.h
//  instant
//
//  Created by chjsun on 16/5/19.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJBaseTableViewCell : UITableViewCell


+(instancetype) baseCellForTableView: (UITableView *)tableView;

/** 数据 */
@property (nonatomic, strong) NSDictionary *data;
@end
