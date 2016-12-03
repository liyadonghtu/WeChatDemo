//
//  MineFirstTableViewCell.m
//  WeChat
//
//  Created by 李亚东 on 16/11/27.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "MineFirstTableViewCell.h"

@implementation MineFirstTableViewCell

- (void)awakeFromNib {
    self.mineHeaderIconView.layer.cornerRadius = 10;
    self.mineHeaderIconView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
