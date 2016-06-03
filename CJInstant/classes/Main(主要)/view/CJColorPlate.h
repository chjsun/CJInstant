//
//  CJColorPlate.h
//  CJInstant
//
//  Created by chjsun on 16/6/2.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJColorPlate;

@protocol ColorPlateDelegate <NSObject>
-(void) colorPlate:(CJColorPlate *)colorPlate button:(UIButton *)button;

@optional

@end

@interface CJColorPlate : UIView

/** delegate */
@property (nonatomic, assign) id<ColorPlateDelegate> delegate;

@end
