//
//  UIBarButtonItem+XL.h
//  XueLeTS
//
//  Created by huanggulong on 15/7/8.
//  Copyright (c) 2015年 net.xuele. All rights reserved.
//

#import <UIKit/UIKit.h>
/*  UIBarButtonItem的分类，设置图片时用到  */
@interface UIBarButtonItem (XL)

+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
