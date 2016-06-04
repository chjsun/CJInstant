//
//  CJColorPlate.m
//  CJInstant
//
//  Created by chjsun on 16/6/2.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJColorPlate.h"

@interface CJColorPlate()

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;

@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation CJColorPlate

-(void)awakeFromNib{
    
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5;

    self.btn1.backgroundColor = [UIColor purpleColor];
    [self.btn1 setTitle:@"purpleColor" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    self.btn1.layer.masksToBounds = YES;
    self.btn1.layer.cornerRadius = 35;
    
    self.btn2.backgroundColor = [UIColor redColor];
    [self.btn2 setTitle:@"redColor" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.btn2.layer.masksToBounds = YES;
    self.btn2.layer.cornerRadius = 35;
    
    self.btn3.backgroundColor = CJColor(9, 21, 128);
    [self.btn3 setTitle:@"MidNightColor" forState:UIControlStateNormal];
    [self.btn3 setTitleColor:CJColor(9, 21, 128) forState:UIControlStateNormal];
    self.btn3.layer.masksToBounds = YES;
    self.btn3.layer.cornerRadius = 35;
    
    self.btn4.backgroundColor = [UIColor greenColor];
    [self.btn4 setTitle:@"greenColor" forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    self.btn4.layer.masksToBounds = YES;
    self.btn4.layer.cornerRadius = 35;
    
    self.btn5.backgroundColor = [UIColor blueColor];
    [self.btn5 setTitle:@"blueColor" forState:UIControlStateNormal];
    [self.btn5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.btn5.layer.masksToBounds = YES;
    self.btn5.layer.cornerRadius = 35;
    
    self.btn6.backgroundColor = [UIColor blackColor];
    [self.btn6 setTitle:@"blackColor" forState:UIControlStateNormal];
    [self.btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.btn6.layer.masksToBounds = YES;
    self.btn6.layer.cornerRadius = 35;
}

- (instancetype)init
{
    return [[[NSBundle mainBundle] loadNibNamed:@"CJColorPlate" owner:self options:nil] lastObject];
}

- (IBAction)selectColor:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(colorPlate:button:)]) {
        [self.delegate colorPlate:self button:sender];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -CJHEIGHT);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
