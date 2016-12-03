//
//  NSString+XL.h
//  NSString的扩展，提供NSString的一些扩展方法。
//
//  Created by wubing on 14-9-9.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XL)
/**
 *  是否远程资源
 *
 */
- (BOOL)isURL;

- (NSString *)stringByAppendingStringToFileName:(NSString *)string;

- (BOOL)hasSubString:(NSString *)string;

+(BOOL)isEmpty:(NSString *)aString shouldCleanWhiteSpace:(BOOL)cleanWhiteSpace;
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;
+ (NSString *)stringWithArab:(int)arab;
-(id)JSONValue;
//
+ (NSString *)validString:(NSString*)string;

- (CGSize)sizeWIthFont:(UIFont *)font height:(CGFloat)height;

- (CGSize)sizeWIthFont:(UIFont *)font width:(CGFloat)width;

//过滤emoji表情
- (NSString *)filterEmoji;
//判断包含emoji表情
- (BOOL)containsEmoji;

//+ (NSString *)getOffRubbishWithString:(NSString *)str;

@end
