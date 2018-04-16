//
//  YGSTTool.h
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGSTTool : NSObject
/* 获得字符串宽度*/
+ (CGFloat)getWidthOfText:(NSString *)text forHeight:(CGFloat)height andFontsize:(CGFloat)fontsize;
/* 获得字符串高度*/
+ (CGFloat)getHeightOfText:(NSString *)text forWidth:(CGFloat)Width andFontsize:(CGFloat)fontsize;
+ (NSMutableAttributedString *)getAttributedStringWithText:(NSString *)text WithIcon:(NSString *)icon  IconSize:(CGFloat)iconsize IconLoction:(BOOL)loc TextSize:(CGFloat)textsize IconColor:(UIColor *)iconcolor  TextColor:(UIColor *)textcolor;
@end
