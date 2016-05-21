//
//  CJBaseTableViewCell.m
//  instant
//
//  Created by chjsun on 16/5/19.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJBaseTableViewCell.h"

@interface CJBaseTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *CountdownLabel;

@end

static NSString * const identifier = @"baseTableViewCell";
@implementation CJBaseTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


-(void)setData:(NSDictionary *)data{
    _data = data;
    self.eventLabel.text = data[@"age"];
}

+(instancetype)baseCellForTableView:(UITableView *)tableView{
    CJBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];


    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CJBaseTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
