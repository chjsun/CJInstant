//
//  CJTipView.h
//  instant
//
//  Created by chjsun on 16/5/22.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJTipView : UIView

/** 标题 */
//@property (nonatomic, copy) NSString *title;
///** 时间 */
//@property (nonatomic, copy) NSString *time;
///** 天数 */
//@property (nonatomic, copy) NSString *dayNumber;

-(void)setTipForTitle:(NSString *)title time:(NSString *)time dayNumber:(NSString *)dayNumber;

@end
