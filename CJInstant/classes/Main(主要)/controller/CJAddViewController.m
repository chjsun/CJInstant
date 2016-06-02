//
//  CJAddViewController.m
//  CJInstant
//
//  Created by chjsun on 16/6/1.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJAddViewController.h"

#import "CJUseTime.h"

#import "CJCalendarViewController.h"

#import "CJCoreDataManage.h"
#import "Event.h"

@interface CJAddViewController ()<CalendarViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *eventTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *detailTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *datetimeButton;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@property (weak, nonatomic) IBOutlet UIButton *eventStateButton;
@property (weak, nonatomic) IBOutlet UIButton *detailStateButton;

/** 日历 */
@property (nonatomic, weak) CJCalendarViewController *calendar;
/** 时间处理 */
@property (nonatomic, strong) CJUseTime *usetime;
@end

@implementation CJAddViewController

-(instancetype)init{
    self = [super init];

    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}

-(CJUseTime *)usetime{
    if (!_usetime) {
        _usetime = [[CJUseTime alloc] init];
    }
    return _usetime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cancelButton.layer.cornerRadius = 25;
    self.cancelButton.layer.masksToBounds = YES;
    
    self.deleteButton.layer.cornerRadius = 25;
    self.deleteButton.layer.masksToBounds = YES;
    self.deleteButton.hidden = self.deleteHidden;
    
    self.actionButton.layer.cornerRadius = 25;
    self.actionButton.layer.masksToBounds = YES;
    
    NSDate *now = [NSDate date];
    NSString *str = [self.usetime dataToString:now];

    [self.datetimeButton setTitle:str forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectTime:(UIButton *)sender {
    CJCalendarViewController *calendar = [[CJCalendarViewController alloc] init];
    self.calendar = calendar;
    calendar.view.frame = self.view.frame;
    calendar.delegate = self;
    
    NSArray *arr = [sender.titleLabel.text componentsSeparatedByString:@"-"];
    
    if (arr.count > 1) {
        [calendar setYear:arr[0] month:arr[1] day:arr[2]];
    }
    
    [self presentViewController:calendar animated:YES completion:nil];
}


- (IBAction)selectColor:(UIButton *)sender {
    NSLog(@"%s", __func__);
}


- (IBAction)cancelButton:(id)sender {
    
    CJCoreDataManage *dateManage = [CJCoreDataManage sharedInstance];
    NSManagedObjectContext *content = [dateManage managedObjectContext];

    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:content];

    [req setEntity:entity];
    
    NSError *error;
    
    NSArray *arr = [content executeFetchRequest:req error:&error];
    
    for (Event *e in arr) {
        NSLog(@"%@", e.name);
        NSLog(@"%@", e.color);
        NSLog(@"%@", e.detail);
        NSLog(@"%@", e.datetime);
    }
    

    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)deleteButton:(UIButton *)sender {
    
    
    if ([self.delegate respondsToSelector:@selector(addViewController:didSelectDeleteBtn:)]) {
        [self.delegate addViewController:self didSelectDeleteBtn:sender];
    }
    
}


- (IBAction)actionButton:(UIButton *)sender {
    
    NSString *eventTabel = [self.eventTextLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *detailTabel = [self.detailTextLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([eventTabel isEqualToString:@""]) {
        self.eventTextLabel.placeholder = @"请输入事件名";

        [UIView animateWithDuration:0.25 animations:^{
            // 动画变小
            _eventStateButton.transform = CGAffineTransformMakeScale(0.7, 0.7);
            
        }completion:^(BOOL finished) {
            // 变小之后弹性回归
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.2
                  initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                _eventStateButton.transform = CGAffineTransformIdentity;
                
            } completion:nil];
        }];
    }else if([detailTabel isEqualToString:@""]) {
        self.detailTextLabel.placeholder = @"请输入详细信息";
        
        [UIView animateWithDuration:0.25 animations:^{
            // 动画变小
            _detailStateButton.transform = CGAffineTransformMakeScale(0.7, 0.7);
            
        }completion:^(BOOL finished) {
            // 变小之后弹性回归
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.2
                  initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                      _detailStateButton.transform = CGAffineTransformIdentity;
                      
                  } completion:nil];
        }];
    
    }else{
        
        CJCoreDataManage *dataManage = [CJCoreDataManage sharedInstance];
        NSManagedObjectContext *manageContent = [dataManage managedObjectContext];
        
        Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:manageContent];
        
        event.name = self.eventTextLabel.text;
        event.detail = self.detailTextLabel.text;
        event.color =  @"blue";
        
        NSDate *now = [self.usetime strToDate:self.datetimeButton.titleLabel.text];
        NSInteger seconds = [now timeIntervalSince1970];
        event.datetime = [NSNumber numberWithInteger:seconds];
        
        NSError *error;
        if (![manageContent save:&error]) {
            
            NSLog(@"保存失败－－%@", [error localizedDescription]);
        }
    }
    
    // delegate
    if ([self.delegate respondsToSelector:@selector(addViewController:didSelectActionBtn:)]) {
        [self.delegate addViewController:self didSelectActionBtn:sender];
    }
}


#pragma mark - 日历控制器代理
-(void)CalendarViewController:(CJCalendarViewController *)controller didSelectActionYear:(NSString *)year month:(NSString *)month day:(NSString *)day{
    
    [self.datetimeButton setTitle:[NSString stringWithFormat:@"%@-%@-%@", year, month, day] forState:UIControlStateNormal];
    
    [self.calendar setYear:year month:month day:day];
}

- (void)dealloc
{
    NSLog(@"add kill");
}

@end
