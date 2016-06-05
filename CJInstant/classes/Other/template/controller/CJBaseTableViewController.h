//
//  CJBaseTableViewController.h
//  instant
//
//  Created by chjsun on 16/5/18.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJBaseTableViewController;
@protocol baseTableViewControllerDelegate <NSObject>

@optional
-(void)baseTableViewControllerDidSelect:(CJBaseTableViewController *)controller;

@end

@interface CJBaseTableViewController : UITableViewController

/** 数据 */
@property (nonatomic, strong) NSArray *data;
/** delegate */
@property (nonatomic, assign) id<baseTableViewControllerDelegate> delegate;

@end
