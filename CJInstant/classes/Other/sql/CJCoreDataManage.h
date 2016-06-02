//
//  CJCoreDataManage.h
//  TestCoca
//
//  Created by chjsun on 16/5/31.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CJCoreDataManage;
@interface CJCoreDataManage : NSObject
@property (nonatomic, strong, readonly)NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;

@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CJCoreDataManage *)sharedInstance;

- (void)saveContext;

@end
