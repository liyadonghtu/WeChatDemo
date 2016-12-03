//
//  UIImage+XL.m
//  XueLeTS
//
//  Created by huang long on 15/12/8.
//  Copyright © 2015年 net.xuele. All rights reserved.
//

#import "UIImage+XL.h"

@implementation UIImage (XL)

- (UIImage *)scaleImageWithMaxLength:(CGFloat)length{
    CGSize size = self.size;
    if (size.width > size.height) { //e.g   1200 x 200  -->  300 x 50
        size = CGSizeMake(length, size.height * length / size.width);
    }else if(size.width == size.height){ //e.g   1200 x 1200  -->  300 x 300
        size = CGSizeMake(length, length);
    }else{  //e.g   200 x 1200  -->  50 x 300
        size = CGSizeMake( size.width * length / size.height,length);
    }
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

- (UIImage *)scaleImageWithMinLength:(CGFloat)length{
    CGSize size = self.size;
    if (size.width < size.height) { //e.g   1200 x 3000  -->  300 x 750
        size = CGSizeMake(length, size.height * length / size.width);
    }else if(size.width == size.height){ //e.g   1200 x 1200  -->  300 x 300
        size = CGSizeMake(length, length);
    }else{  //e.g   3000 x 1200  -->  750 x 300
        size = CGSizeMake( size.width * length / size.height,length);
    }
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

+(UIImage *)getPurityImageWithColor:(UIColor *)color{
    return [self getPurityImageWithColor:color withSize:CGSizeMake(1, 1)];
}

+(UIImage *)getPurityImageWithColor:(UIColor *)color withSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)blankImage:(UIImage *)image WithIndex:(NSInteger)index{
   //绘制填空题空格
    NSString *indexStr = @(index).stringValue;
    UIFont *font = [UIFont systemFontOfSize:10];
    NSDictionary* dic = @{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor blueColor]};
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    CGSize indexSize = [indexStr sizeWithAttributes:dic];
    CGRect re={CGPointMake((image.size.width-indexSize.width) * 0.5,(image.size.height-indexSize.height) * 0.5 - 3),indexSize};
    [indexStr drawInRect:re withAttributes:dic];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}

+ (UIImage *)navigationImage{
    return [self getPurityImageWithColor:colorFromHex(@"#ff5722")];
}

+ (UIImage *)personImage{
    return [UIImage imageNamed:@"menu_role_header_default"];
}


@end
