//
//  LLCreateControls.m
//  LLCreateControls
//
//  Created by 蓝凌 on 14-6-1.
//  Copyright (c) 2014年 蓝凌. All rights reserved.
//

#import "LLCreateControls.h"

@interface LLCreateControls ()

@end

@implementation LLCreateControls

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (UIButton*) createButtonWithFrame: (CGRect) frame
                               Font:(CGFloat)font
                              Image:(NSString *)backgroundImage
                              Title:(NSString*)title
                             Target:(id)target
                           Selector:(SEL)selector
                    BackgroundColor:(UIColor *)backgroundColor
                         TitleColor:(UIColor *)titleColor;{
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    
    UIImage *image = [UIImage imageNamed: backgroundImage];
    [button setImage:image forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.titleLabel.font=[UIFont systemFontOfSize:font];
    
    [button setBackgroundColor:backgroundColor];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UILabel*) createLabelWithFrame: (CGRect) frame
                             Font:(CGFloat)font
                             Text:(NSString*)text
                  BackgroundColor:(UIColor*) color
                        TextColor:(UIColor*) textColor{
    UILabel* label=[[UILabel alloc]initWithFrame:frame];
    label.font=[UIFont systemFontOfSize:font];
    label.text=text;
    label.backgroundColor=color;
    label.textColor=textColor;
    
    
    return label;
}

+ (UIImageView *) createImageViewWithFrame:(CGRect)frame
                                     Image:(NSString *)image
                           BackgroundColor:(UIColor *)backgroundColor
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    [imageView setImage:[UIImage imageNamed:image]];
    [imageView setBackgroundColor:backgroundColor];
    imageView.userInteractionEnabled = YES;
    
    return imageView;
}

+ (UITextField *) createTextFieldWithFrame:(CGRect)frame
                               Placeholder:(NSString *)placeholder
                                      Text:(NSString*)text
                                 TextColor:(UIColor*) textColor
                                      Font:(CGFloat)font
                           BackgroundColor:(UIColor *)backgroundColor
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.text = text;
    textField.textColor = textColor;
    textField.font = [UIFont systemFontOfSize:font];
    textField.backgroundColor = backgroundColor;
    textField.contentVerticalAlignment =  UIControlContentVerticalAlignmentCenter;
    return textField;
}

+ (UITableView *) createTableViewWithFrame:(CGRect)frame
                           BackgroundColor:(UIColor *)backgroundColor
                            separatorStyle:(UITableViewCellSeparatorStyle)tableViewCellSeparatorStyle
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame];
    tableView.backgroundColor = backgroundColor;
    tableView.separatorStyle = tableViewCellSeparatorStyle;
    return tableView;
}
@end
