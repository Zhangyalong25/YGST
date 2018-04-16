//
//  YGSTTool.m
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGSTTool.h"

@implementation YGSTTool
+ (CGFloat)getWidthOfText:(NSString *)text forHeight:(CGFloat)height andFontsize:(CGFloat)fontsize{
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil];
    return rect.size.width+1;
    
}
+ (CGFloat)getHeightOfText:(NSString *)text forWidth:(CGFloat)Width andFontsize:(CGFloat)fontsize{
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(Width, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil];
    return rect.size.height+1;
    
}
+ (NSMutableAttributedString *)getAttributedStringWithText:(NSString *)text WithIcon:(NSString *)icon  IconSize:(CGFloat)iconsize IconLoction:(BOOL)loc TextSize:(CGFloat)textsize IconColor:(UIColor *)iconcolor  TextColor:(UIColor *)textcolor{
    
    NSString *str = [NSString stringWithFormat:@"%@%@",icon,text];
    NSRange Icon=NSMakeRange(0, icon.length);
    NSRange Rtxt=NSMakeRange(icon.length, text.length);
    
    if (loc ==NO) {
        
        str = [NSString stringWithFormat:@"%@%@",text,icon];
        Icon=NSMakeRange(text.length, icon.length);
        Rtxt=NSMakeRange(0, text.length);
        
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    
    if (iconcolor)[attributedString addAttribute:NSForegroundColorAttributeName value:iconcolor range:Icon];
    if (textcolor)[attributedString addAttribute:NSForegroundColorAttributeName value:textcolor range:Rtxt];
    
    if (iconsize)[attributedString addAttribute:NSFontAttributeName value:iconfont(iconsize) range:Icon];
    if (textsize)[attributedString addAttribute:NSFontAttributeName value:font(textsize) range:Rtxt];
    return attributedString;
    
}
@end
