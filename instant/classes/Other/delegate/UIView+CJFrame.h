//
//  UIView+CJFrame.h
//  instant
//
//  Created by chjsun on 16/5/22.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CJFrame)
// 分类里面不能生成成员属性
// 会自动生成get，set方法和成员属性

// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性。
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@end
