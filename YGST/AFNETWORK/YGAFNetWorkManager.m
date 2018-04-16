//
//  YGAFNetWorkManager.m
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGAFNetWorkManager.h"

@implementation YGAFNetWorkManager
+ (YGAFNetWorkManager *)shareManager{
    
    static YGAFNetWorkManager *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager =[[YGAFNetWorkManager alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
    });
    return manager;
    
}
@end
