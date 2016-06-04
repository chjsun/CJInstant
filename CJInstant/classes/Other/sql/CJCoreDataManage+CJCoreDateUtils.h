//
//  CJCoreDataManage+CJCoreDateUtils.h
//  CJInstant
//
//  Created by chjsun on 16/6/4.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJCoreDataManage.h"
@class CJCell;

@interface CJCoreDataManage (CJCoreDateUtils)
-(void) deleteEventForIds:(NSString *) ids;
-(void) createEvent:(CJCell *)cell Datetime:(NSNumber *)datetime;
-(void) updateEvent:(CJCell *)cell Datetime:(NSNumber *)datetime;
@end
