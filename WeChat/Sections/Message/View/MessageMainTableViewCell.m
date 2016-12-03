//
//  MessageMainTableViewCell.m
//  WeChat
//
//  Created by 李亚东 on 16/11/27.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "MessageMainTableViewCell.h"

@implementation MessageMainTableViewCell

- (void)awakeFromNib {
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
