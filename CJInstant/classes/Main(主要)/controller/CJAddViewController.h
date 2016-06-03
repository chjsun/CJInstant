//
//  CJAddViewController.h
//  CJInstant
//
//  Created by chjsun on 16/6/1.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJAddViewController;
@class CJCell;
@protocol addViewControllerDelegate <NSObject>

@optional
-(void) addViewController:(CJAddViewController *)controller didSelectDeleteBtn:(UIButton *)button;

-(void) addViewController:(CJAddViewController *)controller didSelectActionBtn:(UIButton *)button;

@end

@interface CJAddViewController : UIViewController

@property (nonatomic, assign) id<addViewControllerDelegate> delegate;

@property (nonatomic, assign) BOOL deleteHidden;

/** cjcell */
@property (nonatomic, strong) CJCell *cjcell;

@end
