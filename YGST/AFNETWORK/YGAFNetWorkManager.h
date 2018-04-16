//
//  YGAFNetWorkManager.h
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface YGAFNetWorkManager : AFHTTPSessionManager
+ (YGAFNetWorkManager *)shareManager;
@end
