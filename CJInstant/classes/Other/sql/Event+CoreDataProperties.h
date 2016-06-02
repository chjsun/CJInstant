//
//  Event+CoreDataProperties.h
//  CJInstant
//
//  Created by chjsun on 16/6/2.
//  Copyright © 2016年 chjsun. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *datetime;
@property (nullable, nonatomic, retain) NSString *detail;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *color;

@end

NS_ASSUME_NONNULL_END
