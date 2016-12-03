//
//  NSString+XL.m
//  GoddessClock
//
//  Created by wubing on 14-9-9.
//  Copyright (c) 2014年 iMac. All rights reserved.
//

#import "NSString+XL.h"

@implementation NSString (XL)

- (BOOL)isURL {
    if ([self hasPrefix:@"http://"] || [self hasPrefix:@"https://"]) {
        return YES;
    }
    return NO;
}

- (NSString *)stringByAppendingStringToFileName:(NSString *)string
{
    NSString * pathExtension = [self pathExtension];
    NSString * filename = [self stringByDeletingPathExtension];
    NSString * newFilename =  [filename stringByAppendingString:string];
    return [newFilename stringByAppendingPathExtension:pathExtension];
}

- (BOOL)hasSubString:(NSString *)string
{
    if (iOS8Later)
    {
        if ([self containsString:string])
        {
            return YES;
        }
    }else{
        if ( [self rangeOfString:string].length >0)
        {
            return YES;
        }
    }
    return NO;
}

+(BOOL)isEmpty:(NSString *)aString shouldCleanWhiteSpace:(BOOL)cleanWhiteSpace
{
    if (!aString) {
        return YES;
    }
    if ((NSNull *)aString == [NSNull null] ) {
        return YES;
    }
    if ([aString length] == 0) {
        return YES;
    }
    if (cleanWhiteSpace) {
        aString = [aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ([aString length] == 0) {
            return YES;
        }
    }
    return NO;
}
- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,                                                                         (CFStringRef)self,                                                                     NULL,                                                                          CFSTR("-!*'();:@&=+$,/?%#[]"),                                                                 kCFStringEncodingUTF8));
    return result;
}
- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,                                                                                           (CFStringRef)self,                                                                                       CFSTR(""),                                                                                       kCFStringEncodingUTF8));
    return result;
}

+ (NSString *)stringWithArab:(int)arab
{
    NSArray * array = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
    return array[arab-1];
}

- (id)JSONValue
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

+ (NSString *)validString:(NSString*)string
{
    if (string == nil)
    {
        return @"";
    }else{
        return string;
    }
}

// 自动计算文字的高度
- (CGSize)sizeWIthFont:(UIFont *)font height:(CGFloat)height
{
    CGSize actualsize = CGSizeZero;
    if (iOS7Later) {
        //get current font attributes
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        //IOS7 fix: get size that text needs, limit the width
        actualsize =[self boundingRectWithSize:CGSizeMake(MAXFLOAT,height) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:tdic context:nil].size;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        actualsize = [self sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT,height) lineBreakMode:NSLineBreakByCharWrapping];
#pragma clang diagnostic pop
    }
    return actualsize;
}

// 自动计算文字的高度
- (CGSize)sizeWIthFont:(UIFont *)font width:(CGFloat)width
{
    CGSize actualsize = CGSizeZero;
    if (iOS7Later) {
        //get current font attributes
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        //IOS7 fix: get size that text needs, limit the width
        actualsize =[self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:tdic context:nil].size;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        actualsize = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
#pragma clang diagnostic pop
    }
    return actualsize;
}

- (NSString *)filterEmoji
{
    NSUInteger len = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    const char *utf8 = [self UTF8String];
    char *newUTF8 = malloc( sizeof(char) * len );
    int j = 0;
    //0xF0(4) 0xE2(3) 0xE3(3) 0xC2(2) 0x30---0x39(4)
    for ( int i = 0; i < len; i++ )
    {
        unsigned int c = (unsigned int)utf8;
        BOOL isControlChar = NO;
        if ( c == 4294967280 ||
            c == 4294967089 ||
            c == 4294967090 ||
            c == 4294967091 ||
            c == 4294967092 ||
            c == 4294967093 ||
            c == 4294967094 ||
            c == 4294967095 ||
            c == 4294967096 ||
            c == 4294967097 ||
            c == 4294967088 ) {
            
            i = i + 3;
            
            isControlChar = YES;
            
        }else if ( c == 4294967266 || c == 4294967267 ) {
            
            i = i + 2;
            
            isControlChar = YES;
            
        }else if ( c == 4294967234 ) {
            
            i = i + 1;
            
            isControlChar = YES;
            
        }
        
       if ( !isControlChar ) {
            
            newUTF8[j] = (char)utf8;
            j++;
        }
    }
    newUTF8[j] = '\0';
    NSString *encrypted = [NSString stringWithCString:(const char*)newUTF8
                                            encoding:NSUTF8StringEncoding];
    free( newUTF8 );
    return encrypted;
}

- (BOOL)containsEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

@end
