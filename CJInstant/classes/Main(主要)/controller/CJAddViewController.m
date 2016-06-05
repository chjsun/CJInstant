//
//  CJAddViewController.m
//  CJInstant
//
//  Created by chjsun on 16/6/1.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJAddViewController.h"

#import "CJCalendarViewController.h"

#import "CJColorPlate.h"

#import "CJUseTime.h"
#import "CJCoreDataManage+CJCoreDateUtils.h"
#import "Event.h"
#import "CJCell.h"

@interface CJAddViewController ()<CalendarViewControllerDelegate, ColorPlateDelegate>
@property (weak, nonatomic) IBOutlet UITextField *eventTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *detailTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *datetimeButton;
@property (weak, nonatomic) IBOutlet UIButton *colorButton;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@property (weak, nonatomic) IBOutlet UIButton *eventStateButton;
@property (weak, nonatomic) IBOutlet UIButton *detailStateButton;

/** 选择颜色 */
@property (nonatomic, strong) UIView *colorPlate;

/** 日历 */
@property (nonatomic, weak) CJCalendarViewController *calendar;
/** 时间处理 */
@property (nonatomic, strong) CJUseTime *usetime;
/** 所有颜色 */
@property (nonatomic, strong) NSDictionary *dictColor;

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

-(NSDictionary *)dictColor{
    if (!_dictColor) {
        _dictColor = @{@"purpleColor": [UIColor purpleColor],
                       @"redColor": [UIColor redColor],
                       @"MidNightColor":CJColor(9, 21, 128),
                       @"greenColor":[UIColor greenColor],
                       @"blueColor":[UIColor blueColor],
                       @"blackColor":[UIColor blackColor]
                       };
        
    }
    return _dictColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorButton.layer.masksToBounds = YES;
    self.colorButton.layer.cornerRadius = 5;
    
    self.cancelButton.layer.cornerRadius = 25;
    self.cancelButton.layer.masksToBounds = YES;
    
    self.deleteButton.layer.cornerRadius = 25;
    self.deleteButton.layer.masksToBounds = YES;
    self.deleteButton.hidden = self.deleteHidden;
    
    self.actionButton.layer.cornerRadius = 25;
    self.actionButton.layer.masksToBounds = YES;
    
    self.colorButton.backgroundColor = [UIColor purpleColor];
    [self.colorButton setTitle:@"purpleColor" forState:UIControlStateNormal];
    
    NSDate *now = [NSDate date];
    NSString *str = [self.usetime dataToString:now];

    [self.datetimeButton setTitle:str forState:UIControlStateNormal];

    // 初始化的时候可以根据传过来的数据给页面赋值
    self.eventTextLabel.text = self.cjcell.event;
    self.detailTextLabel.text = self.cjcell.detail;
    if (self.cjcell.datetime) {
        [self.datetimeButton setTitle:self.cjcell.datetime forState:UIControlStateNormal];
    }
    if (self.dictColor[self.cjcell.color]) {
        self.colorButton.backgroundColor = self.dictColor[self.cjcell.color];
    }
    
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
    CJColorPlate *colorPlateView = [[CJColorPlate alloc] init];
    colorPlateView.delegate = self;
    [self.view addSubview:colorPlateView];
    colorPlateView.transform = CGAffineTransformMakeTranslation(0, -CJHEIGHT);
    [UIView animateWithDuration:0.25 animations:^{
        colorPlateView.transform = CGAffineTransformIdentity;
    }];
}


-(void) changeColor{
    
}


- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)deleteButton:(UIButton *)sender {
    
    CJCoreDataManage *manage = [CJCoreDataManage sharedInstance];
    [manage deleteEventForIds:self.cjcell.ids];
    
    if ([self.delegate respondsToSelector:@selector(addViewController:didSelectDeleteBtn:)]) {
        [self.delegate addViewController:self didSelectDeleteBtn:sender];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
                
                  } completion:^(BOOL finished) {
                      return;
                  }];
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
                      
                  } completion:^(BOOL finished) {
                      return;
                  }];
        }];
    
    }else{
        CJCoreDataManage *dataManage = [CJCoreDataManage sharedInstance];
        CJCell *cell = [[CJCell alloc] init];
        
        cell.event = self.eventTextLabel.text;
        cell.detail = self.detailTextLabel.text;
        cell.color =  self.colorButton.titleLabel.text;
        
        // 时间戳
        NSDate *now = [self.usetime strToDate:self.datetimeButton.titleLabel.text];
        NSInteger seconds = [now timeIntervalSince1970];
        NSNumber *datetime = [NSNumber numberWithInteger:seconds];
        
        if (self.cjcell) {
            cell.ids = self.cjcell.ids;
            [dataManage updateEvent:cell Datetime:datetime];
        }else{
            [dataManage createEvent:cell Datetime:datetime];
            
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
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

#pragma mark - 添加颜色的代理

-(void)colorPlate:(CJColorPlate *)colorPlate button:(UIButton *)button{
    UIColor *color = button.titleLabel.textColor;
    NSString *name = button.titleLabel.text;
    self.colorButton.backgroundColor = color;
    [self.colorButton setTitle:name forState:UIControlStateNormal];
}

-(void)dealloc{
    NSLog(@"addcontroller dealloc___%s", __func__);
}


@end
