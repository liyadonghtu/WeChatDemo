//
//  UIButton+NSIndexPath.m
//  XueLeTS
//
//  Created by huang long on 16/4/26.
//  Copyright © 2016年 net.xuele. All rights reserved.
//

#import "UIView+NSIndexPath.h"

@implementation UIView (NSIndexPath)

static const void * XLIndexPathButtonKey = &XLIndexPathButtonKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, XLIndexPathButtonKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, XLIndexPathButtonKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
