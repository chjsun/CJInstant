//
//  CJCoreDataManage+CJCoreDateUtils.m
//  CJInstant
//
//  Created by chjsun on 16/6/4.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJCoreDataManage+CJCoreDateUtils.h"
#import "Event.h"
#import "CJCell.h"

@implementation CJCoreDataManage (CJCoreDateUtils)

-(void) deleteEventForIds:(NSString *) ids{

    NSManagedObjectContext *manageContent = [self managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:manageContent];
    
    [request setEntity:entity];
    
    //            查询条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ids=%@", ids];
    [request setPredicate:predicate];
    
    NSError *error;
    Event *event = [[manageContent executeFetchRequest:request error:&error] lastObject];
    if (event == nil) {
        NSLog(@"对象不存在－－%@", event.ids);
        return;
    }
    [manageContent deleteObject:event];
    
    if (![manageContent save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

-(void) createEvent:(CJCell *)cell Datetime:(NSNumber *)datetime{
    NSManagedObjectContext *manageContent = [self managedObjectContext];
    
    Event *eventData = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:manageContent];

    NSDate *nowDate = [NSDate date];
    NSInteger ids = [nowDate timeIntervalSince1970];
    eventData.ids = [NSNumber numberWithInteger:ids];

    eventData.name = cell.event;
    eventData.detail = cell.detail;
    eventData.color =  cell.color;
    
    eventData.datetime = datetime;
    
    NSError *error;
    if (![manageContent save:&error]) {
        
        NSLog(@"保存/修改失败－－%@", [error localizedDescription]);
    }
}

-(void) updateEvent:(CJCell *)cell Datetime:(NSNumber *)datetime{

    NSManagedObjectContext *manageContent = [self managedObjectContext];
    Event *eventData;

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event"inManagedObjectContext:manageContent];
    
    [request setEntity:entity];
    
    // 查询条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ids=%@", cell.ids];
    [request setPredicate:predicate];

    NSError *error;
    eventData = [[manageContent executeFetchRequest:request error:&error] lastObject];
    
    if (eventData == nil) {
        NSLog(@"对象不存在－－%@", cell.ids);
        return;
    }
    eventData.name = cell.event;
    eventData.detail = cell.detail;
    eventData.color =  cell.color;
    eventData.datetime = datetime;
    
    if (![manageContent save:&error]) {
        NSLog(@"修改失败－－%@", [error localizedDescription]);
    }
}

@end
