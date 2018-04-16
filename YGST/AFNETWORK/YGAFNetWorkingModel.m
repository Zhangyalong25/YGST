//
//  YGAFNetWorkingModel.m
//  YGST
//
//  Created by yalong zhang on 2018/1/25.
//  Copyright © 2018年 yalong zhang. All rights reserved.
//

#import "YGAFNetWorkingModel.h"
#import "YGAFNetWorkManager.h"
@implementation YGAFNetWorkingModel
+ (NSString *)dicToJSONStringWithDictonary:(NSDictionary *)dic{
    
    NSData *data =[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonstr =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonstr;
    
}
+ (NSString *)senderToJSONStringWithSender:(id)sender{
    
    NSData *data =[NSJSONSerialization dataWithJSONObject:sender options:kNilOptions error:nil];
    NSString *jsonstr =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonstr;
    
}
+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)dic Successed:(Successed)success failure:(Failure)failure{
    
    YGAFNetWorkManager *manager =[YGAFNetWorkManager shareManager];
    manager.requestSerializer.timeoutInterval =10;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/plain",@"text/html", @"text/javascript", @"text/json", @"application/x-www-form-urlencoded; charset=utf-8",@"application/javascript", nil];
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dataDic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:nil];
        NSMutableDictionary *resultDic =[[NSMutableDictionary alloc] initWithDictionary:dataDic];
        success(resultDic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
+ (void)GETWithURL:(NSString *)url parameters:(NSDictionary *)dic Successed:(Successed)success failure:(Failure)failure{
    YGAFNetWorkManager *manager =[YGAFNetWorkManager shareManager];
    manager.requestSerializer.timeoutInterval =10;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/plain",@"text/html", @"text/javascript", @"text/json", @"application/x-www-form-urlencoded; charset=utf-8",@"application/javascript", nil];
    [manager GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dataDic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:nil];
        NSMutableDictionary *resultDic =[[NSMutableDictionary alloc] initWithDictionary:dataDic];
        success(resultDic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
