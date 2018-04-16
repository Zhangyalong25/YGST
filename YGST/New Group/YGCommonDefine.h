//
//  YGCommonDefine.h
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#ifndef YGCommonDefine_h
#define YGCommonDefine_h
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define Iphone_Width [UIScreen mainScreen].bounds.size.width
#define Iphone_Height [UIScreen mainScreen].bounds.size.height
#define iconfont(Size) [UIFont fontWithName:@"IconFont" size: Size]
#define font(size) [UIFont systemFontOfSize:size]
#define mainGreen RGB(51, 153, 0)
#endif /* YGCommonDefine_h */
