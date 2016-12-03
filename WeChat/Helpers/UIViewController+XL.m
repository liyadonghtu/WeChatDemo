//
//  UIViewController+XL.m
//  XueLeTS
//
//  Created by huang long on 16/5/3.
//  Copyright © 2016年 net.xuele. All rights reserved.
//

#import "UIViewController+XL.h"
static const void *bottomTipViewKey = &bottomTipViewKey;

@implementation UIViewController (XL)

#pragma mark - public method
- (void)showBottomInViewWithMsg:(NSString *)msg timeInterval:(NSTimeInterval)timeInterval{
    [self showBottomWithView:self.view msg:msg timeInterval:timeInterval];
}

- (void)showBottomInViewWithMsg:(NSString *)msg{
    [self showBottomInViewWithMsg:msg timeInterval:0];
}

- (void)showBottomInWindowWithMsg:(NSString *)msg timeInterval:(NSTimeInterval)timeInterval{
    [self showBottomWithView:self.view.window msg:msg timeInterval:timeInterval];
}

- (void)showBottomInWindowWithMsg:(NSString *)msg{
    [self showBottomInWindowWithMsg:msg timeInterval:0];
}

#pragma mark - private method
- (void)showBottomWithView:(UIView *)superView msg:(NSString *)msg timeInterval:(NSTimeInterval)timeInterval{
    UIView *view = self.bottomTipView;
    if (view == nil) {
        UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
        back.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        [superView addSubview:back];
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.with.right.offset(0);
            make.height.mas_equalTo(50);
        }];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.width - 80, 30)];
        label.tag = 1;
        label.numberOfLines = 2;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        [back addSubview:label];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width - 60, 10, 50, 30)];
        button.tag = 2;
        [button setTitle:@"完成" forState:(UIControlStateNormal)];
        [back addSubview:button];
        [button addTarget:self action:@selector(bottomTipComplete:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.right.offset(-8);
            make.top.offset(8);
            make.width.mas_equalTo(50);
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.offset(8);
            make.bottom.offset(-8);
            make.right.equalTo(button.mas_left).offset(-8);
        }];
        view = back;
        self.bottomTipView = back;
    }else{
        
    }
    UILabel *label = [view viewWithTag:1];
    UIButton *button = [view viewWithTag:2];
    label.text = msg?:@"";
    if (timeInterval == 0) {
        [button mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-8);//距离
        }];
    }else{
        [button mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.offset(50);//距离
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view removeSelfFromSuperview];
            self.bottomTipView = nil;
        });
    }
}

#pragma mark - click method
- (IBAction)bottomTipComplete:(id)sender{
    UIView *view = self.bottomTipView;
    [view removeSelfFromSuperview];
    self.bottomTipView = nil;
}

#pragma mark - getter setter
- (UIView *)bottomTipView{
    UIView *bottom = objc_getAssociatedObject(self, bottomTipViewKey);
    return bottom;
}

- (void)setBottomTipView:(UIView *)bottomTipView{
    objc_setAssociatedObject(self, bottomTipViewKey, bottomTipView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
