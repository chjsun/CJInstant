//
//  CJFestival.h
//  CJInstant
//
//  Created by chjsun on 16/6/6.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJFestival : NSObject
/** datetime */
@property (nonatomic, copy) NSString *datetime;
/** event */
@property (nonatomic, copy) NSString *event;

-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) festivalWithDict:(NSDictionary *)dict;

+(NSArray *) festivalListWithCalendar:(NSString *)calendar;
@end
