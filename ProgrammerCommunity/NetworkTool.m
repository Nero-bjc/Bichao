//
//  NetworkTool.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/2.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "NetworkTool.h"
#import <AFNetworking/AFNetworking.h>

#ifdef DEBUG //DEBUG 是程序默认存在的一个宏定义，我们平时运行都是在这种方式下
// 平时我们开发时候，都会用一个单独的测试环境
static NSString *baseUrl = @"http://10.30.152.134/PhalApi/Public/CodeShare/";
// 接口列表地址
// http://10.30.152.134/PhalApi/Public/CodeShare/listAllApis.php

#else

static NSString *baseUrl = @"https://www.1000phone.tk";
// 接口列表地址
// https://www.1000phone.tk/listAllApis.php

#endif

@implementation NetworkTool
//需求分析

//我们在网络请求的时候 需要什么？
//网址 参数对

//我们想要得到什么？
//数据data

//因为网络请求是异步操作 所以我们获取到的数据不能直接返回 要用block回调
+ (void)getDataWithParameters:(NSDictionary *)parameters completeBlock:(void (^)(BOOL, id))complete {
    
    [[self shareManager] POST:@"" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSNumber *serviceCode = [responseObject objectForKey:@"ret"];
        if ([serviceCode isEqualToNumber:@200]) {
            // 证明没有服务错误
            NSDictionary *retData = [responseObject objectForKey:@"data"];
            
            NSNumber *dataCode = [retData objectForKey:@"code"];
            if ([dataCode isEqualToNumber:@0]) {
                // 证明返回的数据没有错误
                NSDictionary *userInfo = [retData objectForKey:@"data"];
                // 先判断是否有完成请求的处理 block, 如果有，就传回解析到的数据
                if (complete) {
                    complete(YES, userInfo);
                }
            }else {
                NSString *dataMessage = [retData objectForKey:@"msg"];
                NSLog(@"%@", dataMessage);
                if (complete) {
                    complete(NO, dataMessage);
                }
            }
            
        }else {
            NSString *serviceMessage = [responseObject objectForKey:@"msg"];
            NSLog(@"%@", serviceMessage);
            if (complete) {
                complete(NO, serviceMessage);
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
        if (complete) {
            complete(NO, error.localizedDescription);
        }
    }];
}


+ (AFHTTPSessionManager*)shareManager {
    
    static AFHTTPSessionManager *manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
//        manger = [AFHTTPSessionManager manager];
//        用AFNetworking做网络请求的时候 可以有一个小的优化 缓存我们的地址
//        为什么这算是一个优化？
//        我们这里的 BaseUrl 生成的 manager对象 会告诉 AFNetworking 我们以后请求的数据都是从这个服务器获取数据 那么 AFNetworking 会把这个地址给缓存起来
        manger = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:baseUrl]];
        
//        设置请求的超时时间  设置请求的参数编码格式
        manger.requestSerializer.timeoutInterval = 30.0;
        manger.responseSerializer = [AFJSONResponseSerializer serializer];
        manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"text/xml",@"application/json", nil];
    });
    return manger;
}
@end
