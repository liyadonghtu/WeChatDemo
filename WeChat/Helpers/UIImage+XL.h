//
//  UIImage+XL.h
//  XueLeTS
//
//  Created by huang long on 15/12/8.
//  Copyright © 2015年 net.xuele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XL)

/*
 * @huanggulong
 *
 * 根据最大值产生一个图片(缩小图片)
 */
- (UIImage *)scaleImageWithMaxLength:(CGFloat)length;


/*
 * @huanggulong
 *
 * 根据最小值产生一个图片(缩小图片)
 */
- (UIImage *)scaleImageWithMinLength:(CGFloat)length;


/**
 *  生成纯色图片
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/*
 * @huanggulong
 *
 * 通过颜色生成一个村色的图片9(大小 1 x 1)
 */
+(UIImage *)getPurityImageWithColor:(UIColor *)color;

/*
 * @huanggulong
 *
 * 通过颜色生成一个村色的图片(大小为size）
 */
+(UIImage *)getPurityImageWithColor:(UIColor *)color withSize:(CGSize)size;

/**
 *  生成填空题图片
 *
 */
+ (UIImage *)blankImage:(UIImage *)image WithIndex:(NSInteger)index;

/*
 * @hgl
 *
 * 和navigationbar同一个颜色的图片
 *
 */
+ (UIImage *)navigationImage;

/*
 * @hgl
 *
 * 个人头像(默认)
 *
 */
+ (UIImage *)personImage;

@end
