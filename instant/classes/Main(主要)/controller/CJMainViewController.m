//
//  CJMainViewController.m
//  instant
//
//  Created by chjsun on 16/5/18.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJMainViewController.h"

#import "CJBaseTableViewController.h"

#import "CJMainScrollView.h"
#import "CJHeaderNavigationView.h"
#import "CJTipView.h"

#define onlyValue 78

@interface CJMainViewController ()<UIScrollViewDelegate, HeaderNavitationTelegate>

/** scroll */
@property (nonatomic, weak) CJMainScrollView *scrollView;
/** header */
@property (nonatomic, weak) CJHeaderNavigationView *headerView;
/** tip */
@property (nonatomic, weak) CJTipView *tipView;

@end


@implementation CJMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavitation];
    
    [self setUpTip];
    
    [self setUpAllController];
    

}

#pragma mark - 设置头部导航栏

/**
 *  设置头部导航的按钮
 */
-(void)setUpNavitation{

    CGRect navitationFrame = CGRectMake(0, 0, CJWIDTH, 64);
    CJHeaderNavigationView *headerView = [[CJHeaderNavigationView alloc] initWithFrame:navitationFrame];
    headerView.backgroundColor = CJHeaderColor;
    headerView.delegate = self;
    self.headerView = headerView;

    [headerView setUpNavitation];
    
    [self.view addSubview:headerView];
}



-(void)switchControl:(UIButton *)button{
    //设置点按后一直显示选中状态
    self.headerView.selectButton.selected = NO;
    button.selected = YES;
    self.headerView.selectButton = button;
    
    CGFloat than = button.tag - onlyValue;
    [self scrollViewScroll:than];
    
}

/**
 *  设置 scroll滚动位置和按钮下方白色条滚动位置
 *
 *  @param than 第几个
 */
-(void)scrollViewScroll:(CGFloat)than{

    [self.scrollView setContentOffset:CGPointMake(than * CJWIDTH, 0) animated:YES];
    
    CGFloat x = than * 44 + 10;
    CGRect selectViewFrame = CGRectMake(x, 60, 44, 4);
    [UIView animateWithDuration:0.1 animations:^{
        self.headerView.selectStatView.frame = selectViewFrame;
    }];

}

#pragma mark - 设置tip提示的view
-(void)setUpTip{
    CGRect navitationFrame = CGRectMake(0, 64, CJWIDTH, CJItemHeight);
    CJTipView *tipView = [[CJTipView alloc] initWithFrame:navitationFrame];
    
    self.tipView = tipView;
    
    tipView.backgroundColor = CJHeaderColor;

    [tipView setTipForTitle:@"世间三" time:@"2016年5月28日" dayNumber:@"30748"];
    
    [self.view addSubview:tipView];
    
}

#pragma mark - 设置滚动的scrollView
/**
 *  设置可以滚动的控制器
 */
-(void) setUpAllController{
    //设置scrollview大小
    CGRect rect = CGRectMake(0, 64 + CJItemHeight, CJWIDTH, CJHEIGHT);
    CJMainScrollView *mainScroll = [[CJMainScrollView alloc] initWithFrame:rect];
    self.scrollView = mainScroll;
    
    //设置基本属性
    mainScroll.showsHorizontalScrollIndicator = FALSE;
    mainScroll.pagingEnabled = YES;
    //添加代理
    mainScroll.delegate = self;
    //设置所有的控制器
    [mainScroll setUpAllControllerWithSuperControll:self];
    
    [self.view addSubview:mainScroll];
}

#pragma mark - 顶部按钮的代理方法
-(void)HeaderNavitation:(CJHeaderNavigationView *)headerView didSelectButton:(UIButton *)btn{
    [self switchControl:btn];
}

#pragma mark - scrollView delegate
/**
 *  拖动scrollView结束时调用
 *
 *  @param scrollView
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGFloat than = scrollView.contentOffset.x/CJWIDTH;
//    [self scrollViewScroll:than];
    UIButton *btn = (UIButton *)[self.view viewWithTag:than+onlyValue];

    [self switchControl:btn];
}

@end
