//
//  CJFestival.m
//  CJInstant
//
//  Created by chjsun on 16/6/6.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJFestival.h"

@implementation CJFestival

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)festivalWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)festivalListWithCalendar:(NSString *)calendar{
    NSString *arrayPath = [[NSBundle mainBundle] pathForResource:calendar ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:arrayPath];
    NSMutableArray *tmp = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        CJFestival *festival = [CJFestival festivalWithDict:dict];
        [tmp addObject:festival];
    }
    return tmp;
};

@end
