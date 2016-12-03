//
//  UIView+XL.m
//  XueLeTS
//
//  Created by huanggulong on 15/6/17.
//  Copyright (c) 2015年 net.xuele. All rights reserved.
//

#import "UIView+XL.h"

@implementation UIView (XL)


#pragma mark x(getter,setter)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}
#pragma mark y(getter,setter)
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
#pragma mark width(getter,setter)
- (void)setWidth:(CGFloat)width
{
    CGRect bounds = self.bounds;
    bounds.size.width = width;
    self.bounds = bounds;
}

- (CGFloat)width
{
    return self.bounds.size.width;
}
#pragma mark height(getter,setter)
- (void)setHeight:(CGFloat)height
{
    CGRect bounds = self.bounds;
    bounds.size.height = height;
    self.bounds = bounds;
}

- (CGFloat)height
{
    return self.bounds.size.height;
}
#pragma mark centerX(getter,setter)
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}
#pragma mark centerY(getter,setter)
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}
#pragma mark size(getter,setter)
-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size =size;
    self.frame=frame;
}

-(CGSize)size{
    return  self.frame.size;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
#pragma mark origin(getter,setter)
-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(CGPoint)origin{
    return self.frame.origin;
}

-(void)addborderWidth:(CGFloat)width borderColor:(UIColor *)color withRadius:(CGFloat)radius{
    CALayer *layer = self.layer;
    layer.borderWidth = width;
    layer.borderColor = color.CGColor;
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
}

-(void)addShadowSize:(CGSize)size Opacity:(CGFloat)opacity{
    CALayer *layer = self.layer;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = opacity > 1.0 ? 1.0 : opacity;
    layer.shadowOffset = size;
}

- (void)removeSelfFromSuperview{
    if (self.superview != nil) {
        [self removeFromSuperview];
    }
}

@end
