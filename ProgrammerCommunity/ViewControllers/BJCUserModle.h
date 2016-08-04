//
//  BJCUserModle.h
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/3.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJCUserModle : NSObject
/**
 *  
 */
@property (nonatomic,copy) NSString *address;

@property (nonatomic,copy) NSString *avatar;

@property (nonatomic,copy) NSString *birthday;

@property (nonatomic,copy) NSString *email;

@property (nonatomic,copy) NSString *gender;

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *nickname;

@property (nonatomic,copy) NSString *phone;
//通常都将用户当做一个model来判断 那么用户是否登录 就需要我们封装一个方法 因为在我们的程序的整个周期内 很可能只会创建一个对象 
+ (BOOL)isLogin;
+ (BJCUserModle*)shareBJVUserModel;

@end
