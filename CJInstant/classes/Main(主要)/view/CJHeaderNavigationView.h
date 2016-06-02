//
//  CJHeaderNavigationView.h
//  instant
//
//  Created by chjsun on 16/5/22.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJHeaderNavigationView;
@protocol HeaderNavitationDelegate <NSObject>

@optional
-(void) HeaderNavitation:(CJHeaderNavigationView *)headerView didSelectButton:(UIButton *)btn;
-(void) HeaderNavitation:(CJHeaderNavigationView *)headerView didSelectAdd:(UIButton *)btn;

@end

@interface CJHeaderNavigationView : UIView

/** 当前上次选中的按钮 */
@property (nonatomic, weak) UIButton *selectButton;
/** 底部显示的白色条 */
@property (nonatomic, strong) UIView *selectStatView;

/** 代理 */
@property (nonatomic, assign) id<HeaderNavitationDelegate> delegate;


-(void) setUpNavitation;

@end
