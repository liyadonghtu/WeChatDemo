//
//  LLCreateControls.h
//  LLCreateControls
//
//  Created by 蓝凌 on 14-6-1.
//  Copyright (c) 2014年 蓝凌. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 'LLCreateControls' 暂时为初始化UIButton，UILable的类，一次性设置控件所具有的部分常用属性。可以扩展更多 。。。
 */

@interface LLCreateControls : UIViewController
+ (UILabel*) createLabelWithFrame: (CGRect) frame
                             Font:(CGFloat)font
                             Text:(NSString*)text
                  BackgroundColor:(UIColor*) color
                        TextColor:(UIColor*) textColor;

+ (UIButton*) createButtonWithFrame: (CGRect) frame
                               Font:(CGFloat)font
                              Image:(NSString *)backgroundImage
                              Title:(NSString*)title
                             Target:(id)target
                           Selector:(SEL)selector
                    BackgroundColor:(UIColor *)backgroundColor
                         TitleColor:(UIColor *)titleColor;

+ (UIImageView *) createImageViewWithFrame:(CGRect)frame
                                     Image:(NSString *)image
                           BackgroundColor:(UIColor *)backgroundColor;

+ (UITextField *) createTextFieldWithFrame:(CGRect)frame
                               Placeholder:(NSString *)placeholder
                                      Text:(NSString*)text
                                 TextColor:(UIColor*) textColor
                                      Font:(CGFloat)font
                           BackgroundColor:(UIColor *)backgroundColor;

+ (UITableView *) createTableViewWithFrame:(CGRect)frame
                           BackgroundColor:(UIColor *)backgroundColor
                            separatorStyle:(UITableViewCellSeparatorStyle)tableViewCellSeparatorStyle;
@end
