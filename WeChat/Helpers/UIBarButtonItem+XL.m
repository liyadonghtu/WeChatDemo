//
//  UIBarButtonItem+XL.m
//  XueLeTS
//
//  Created by huanggulong on 15/7/8.
//  Copyright (c) 2015年 net.xuele. All rights reserved.
//

#import "UIBarButtonItem+XL.h"

@implementation UIBarButtonItem (XL)

/*  一般返回一个button  */
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    /*  正常情况下  */
    [button setBackgroundImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    /*  高亮状态下  */
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:(UIControlStateHighlighted)];
    /*  按钮大小为图片大小  */
    button.size = button.currentBackgroundImage.size;
    /*  点击事件  */
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    /*  返回自定义按钮  */
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

@end
