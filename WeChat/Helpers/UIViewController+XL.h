//
//  UIViewController+XL.h
//  XueLeTS
//
//  Created by huang long on 16/5/3.
//  Copyright © 2016年 net.xuele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XL)

@property (nonatomic) UIView *bottomTipView;

- (void)showBottomInViewWithMsg:(NSString *)msg timeInterval:(NSTimeInterval)timeInterval;

- (void)showBottomInViewWithMsg:(NSString *)msg;

- (void)showBottomInWindowWithMsg:(NSString *)msg timeInterval:(NSTimeInterval)timeInterval;

- (void)showBottomInWindowWithMsg:(NSString *)msg;
@end
