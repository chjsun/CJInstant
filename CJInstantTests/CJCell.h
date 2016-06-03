//
//  CJCell.h
//  CJInstant
//
//  Created by chjsun on 16/6/2.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJCell : NSObject
//self.eventLabel.text = data[@"event"];
//self.timeLabel.text = data[@"time"];
//self.describeLabel.text = data[@"desctibe"];
//self.stateLabel.text = data[@"state"];
//self.CountdownLabel.text = data[@"countdown"];


/** 事件名 */
@property (nonatomic, copy) NSString *event;
/** 时间 */
@property (nonatomic, copy) NSString *datetime;
/** 详情 */
@property (nonatomic, copy) NSString *detail;
/** 状态 */
@property (nonatomic, copy) NSString *state;
/** 天数 */
@property (nonatomic, copy) NSString *countdown;
/** 颜色 */
@property (nonatomic, copy) NSString *color;
@end
