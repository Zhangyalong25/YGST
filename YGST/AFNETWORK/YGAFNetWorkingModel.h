//
//  YGAFNetWorkingModel.h
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Successed)(NSDictionary *dicSuccessed);
typedef void(^Failure)(NSError *error);
@interface YGAFNetWorkingModel : NSObject
+ (NSString *)dicToJSONStringWithDictonary:(NSDictionary *)dic;
+ (NSString *)senderToJSONStringWithSender:(id)sender;
+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)dic Successed:(Successed)success failure:(Failure)failure;
+ (void)GETWithURL:(NSString *)url parameters:(NSDictionary *)dic Successed:(Successed)success failure:(Failure)failure;
@end
