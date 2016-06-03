//
//  CJMainScrollView.m
//  instant
//
//  Created by chjsun on 16/5/22.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJMainScrollView.h"

#import "CJAllViewController.h"
#import "CJMonthViewController.h"
#import "CJPastViewController.h"
#import "CJWeekViewController.h"

#import "CJBaseTableViewController.h"

@interface CJMainScrollView()

/** 记录宽度 */
@property (nonatomic, assign) CGFloat nextWidth;

/** allController */
@property(nonatomic, weak)CJAllViewController *allController;
/** allController */
@property(nonatomic, weak)CJMonthViewController *monthController;
/** allController */
@property(nonatomic, weak)CJWeekViewController *weekController;
/** allController */
@property(nonatomic, weak)CJPastViewController *pastController;

@end



@implementation CJMainScrollView

#pragma mark - 设置滚动的scrollView
/**
 *  设置可以滚动的控制器
 */
-(void) setUpAllControllerWithSuperControll:(UIViewController *)controller{
    //所有
    CJAllViewController *all = [[CJAllViewController alloc] init];
    self.allController = all;
    [self setUpController:all superController:controller];
    
    //周
    CJWeekViewController *week = [[CJWeekViewController alloc] init];
    self.weekController = week;
    [self setUpController:week superController:controller];
    
    //月
    CJMonthViewController *month = [[CJMonthViewController alloc] init];
    self.monthController = month;
    [self setUpController:month superController:controller];
    
    //过去的
    CJPastViewController *past = [[CJPastViewController alloc] init];
    self.pastController = past;
    [self setUpController:past superController:controller];
    
    //添加scrollView到控制器
    self.contentSize = CGSizeMake(CJWIDTH*4, CJHEIGHT);
    self.backgroundColor = [UIColor whiteColor];
}

/**
 *  设置控制器通用属性
 *
 *  @param controller 对应控制器
 */
-(void) setUpController:(UIViewController *)controller superController:(UIViewController *)superController{
    
    controller.view.frame = CGRectMake(self.nextWidth, 0, CJWIDTH, CJHEIGHT - (CJHEIGHT/6 + 64));
    [self addSubview:controller.view];
    [superController addChildViewController:controller];
    controller.view.backgroundColor = [UIColor whiteColor];
    self.nextWidth += CJWIDTH;
}

-(void)reloadAllController{
    [self.allController loadData];
    [self.allController.tableView reloadData];
    
    
}
@end
