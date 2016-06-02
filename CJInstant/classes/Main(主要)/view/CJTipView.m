//
//  CJTipView.m
//  instant
//
//  Created by chjsun on 16/5/22.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJTipView.h"

#define leftTextSize 17
#define rightTextSize 50
#define leftX 30
#define spacing 5

@interface CJTipView()

/** 标题 */
@property (nonatomic, weak) UILabel *titleLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 天数 */
@property (nonatomic, weak) UILabel *dayNumberLabel;
/** 单位 */
@property (nonatomic, weak) UILabel *company;

@end

static NSString *testString = @"测试用标准字符串";
@implementation CJTipView

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:leftTextSize];
        
        CGFloat textHeight = [self heightForString:testString fontSize:leftTextSize].height;
        
        label.x = leftX;
        label.y = CJItemHeight/2 - textHeight - spacing;
        label.width = CJWIDTH/2 - leftX;
        label.height = leftTextSize;

        _titleLabel = label;
       
        [self addSubview:label];
        
    }
    return _titleLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:leftTextSize];
        
        label.x = leftX;
        label.y = CJItemHeight/2 + spacing;
        label.width = CJWIDTH/2 - leftX;
        label.height = leftTextSize;
        _timeLabel = label;
       
        [self addSubview:label];
        
    }
    return _timeLabel;
}

-(UILabel *)dayNumberLabel{
    if (!_dayNumberLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:rightTextSize];
        CGSize textSize = [self heightForString:@"12345" fontSize:rightTextSize];
        label.textAlignment =NSTextAlignmentRight;

        label.x = CJWIDTH - textSize.width - CJItemHeight/2;
        label.y = 0;
        label.width = CJWIDTH/2 - CJItemHeight/2;
        label.height = CJItemHeight;
        _dayNumberLabel = label;
        [self addSubview:label];
        
    }
    return _dayNumberLabel;
}

-(UILabel *)company{
    if (!_company) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.text = @"天";
        label.font = [UIFont systemFontOfSize:leftTextSize];
        CGSize textSize = [self heightForString:@"天" fontSize:leftTextSize];
        
        label.x = CJWIDTH - CJItemHeight/2 + textSize.width;
        label.y = self.timeLabel.y;
        label.width = textSize.width;
        label.height = textSize.height;

        _company = label;
        [self addSubview:label];
        
    }
    return _company;

}


-(void)setTipForTitle:(NSString *)title time:(NSString *)time dayNumber:(NSString *)dayNumber{

    self.titleLabel.text = title;
    self.timeLabel.text = time;
    self.dayNumberLabel.text = dayNumber;
    [self company];
//    [self.company sizeToFit];
    
}

-(void)setItemSystem:(UILabel *)label point:(CGPoint)point fontSize:(CGFloat)fontSize{
    label.font = [UIFont systemFontOfSize:leftTextSize];
    CGSize textSize = [self heightForString:testString fontSize:fontSize];
    
    label.frame = CGRectMake(point.x, point.y, textSize.width, textSize.height);

}

/**
 @method 获取指定字号下的文字的高度
 @param fontSize 字体的大小
 @result float 返回的高度
 */
- (CGSize) heightForString:(NSString *)value fontSize:(float)fontSize
{
    CGSize size =[value sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    return size;
}


@end
