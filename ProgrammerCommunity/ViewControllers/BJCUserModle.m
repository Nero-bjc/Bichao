//
//  BJCUserModle.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/3.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "BJCUserModle.h"

@implementation BJCUserModle

+ (BOOL)isLogin {
    
    return [self shareBJVUserModel].ID;
}
+ (BJCUserModle*)shareBJVUserModel {
    
    static BJCUserModle *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        model = [[BJCUserModle alloc]init];
        model = [[super allocWithZone:NULL]init];
        
    });
    return model;
}
//模型自定义属性映射
+ (NSDictionary*)modelCustomPropertyMapper {
    
    return @{
             @"ID":@"id",
             };
}
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//
//    if ([key isEqualToString:@"id"]) {
//        self.ID = value;
//    }
//}

@end
