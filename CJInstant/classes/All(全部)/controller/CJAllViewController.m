//
//  CJAllViewController.m
//  instant
//
//  Created by chjsun on 16/5/21.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJAllViewController.h"
#import "CJCoreDataManage.h"
#import "Event.h"
#import "CJUseTime.h"
#import "CJCell.h"

#import "CJBaseTableViewCell.h"
#import "CJAddViewController.h"
#import "CJMainScrollView.h"

@interface CJAllViewController ()<addViewControllerDelegate>
/** 时间处理 */
@property (nonatomic, strong) CJUseTime *usetime;
@end

@implementation CJAllViewController

-(CJUseTime *)usetime{
    if (!_usetime) {
        _usetime = [[CJUseTime alloc] init];
    }
    return _usetime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
}
-(void)loadData{
    CJCoreDataManage *dateManage = [CJCoreDataManage sharedInstance];
    NSManagedObjectContext *content = [dateManage managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:content];
    
    [request setEntity:entity];
    
    // 排序
    NSSortDescriptor *sortDescriptor =
    [NSSortDescriptor sortDescriptorWithKey:@"datetime"
                                  ascending:YES
                                   selector:@selector(localizedCaseInsensitiveCompare:)];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    //查询条件
    //    NSPredicate*predicate = [NSPredicate predicateWithFormat:@"datetime>=1465084800"];
    //    [request setPredicate:predicate];

    NSError *error;
    NSArray *arr = [content executeFetchRequest:request error:&error];

    NSMutableArray *data = [NSMutableArray array];
    for (Event *e in arr) {
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[e.datetime integerValue]];
        
        NSInteger seconds = ([e.datetime integerValue]- [self.usetime.getTodayYYmmhh timeIntervalSince1970])/(60 * 60 * 24);
        NSString *state = seconds>=0? @"剩余": @"已过";

        CJCell *cell = [[CJCell alloc] init];
        cell.event = e.name;
        cell.datetime = [self.usetime dataToString:date];
        cell.detail = e.detail;
        cell.state = state;
        cell.countdown = [NSString stringWithFormat:@"%ld天", labs(seconds)];
        cell.color = e.color;
        cell.ids = [NSString stringWithFormat:@"%@",e.ids];
        
        [data addObject:cell];
    }
    self.data = data;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CJBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    CJAddViewController *addControl = [[CJAddViewController alloc] init];
    addControl.delegate = self;
    addControl.cjcell = cell.cell;
    [self presentViewController:addControl animated:YES completion:nil];
    // 该操作只是唤醒主线程立即操作 presentViewController: animated: completion， 弹出控制器
    // 可以什么都不做
    [self performSelector:@selector(dontSleep) onThread:[NSThread mainThread] withObject:nil waitUntilDone:nil];
}

-(void) dontSleep{}

@end
