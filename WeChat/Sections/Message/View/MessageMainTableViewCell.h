//
//  MessageMainTableViewCell.h
//  WeChat
//
//  Created by 李亚东 on 16/11/27.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageMainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameText;
@property (weak, nonatomic) IBOutlet UILabel *messageText;


@end
