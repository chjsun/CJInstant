//
//  CJBaseTableViewCell.m
//  instant
//
//  Created by chjsun on 16/5/19.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJBaseTableViewCell.h"
#import "CJCell.h"

@interface CJBaseTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *CountdownLabel;

/** 所有颜色 */
@property (nonatomic, strong) NSDictionary *dictColor;

@end

static NSString * const identifier = @"baseTableViewCell";
@implementation CJBaseTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

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

-(void)setCell:(CJCell *)cell{
    _cell = cell;
    self.eventLabel.text = cell.event;
    self.timeLabel.text = cell.datetime;
    self.describeLabel.text = cell.detail;
    self.stateLabel.text = cell.state;
    self.CountdownLabel.text = cell.countdown;
    
    self.stateLabel.textColor = self.dictColor[cell.color];
    self.CountdownLabel.textColor = self.dictColor[cell.color];
    
}

+(instancetype)baseCellForTableView:(UITableView *)tableView{
    CJBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];


    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CJBaseTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
