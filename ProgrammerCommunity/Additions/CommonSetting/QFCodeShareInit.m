//
//  QFCodeShareInit.m
//  CodeShare
//
//  Created by 王广威 on 16/3/29.
//  Copyright © 2016年 北京千锋-王广威. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
const NSString* const QFAppBaseURL = @"http://10.30.152.134/PhalApi/Public/CodeShare/";
#else
const NSString* const QFAppBaseURL = @"http://www.1000phone.ml/";
#endif

const NSString *const QFResourceBaseUrl = @"http://www.1000phone.tk/upload/QFApi";

const NSString *const MobApp = @"15ba5f43a3aee";
const NSString *const MobSecret = @"0838a5830864badbc6ebf715d1793e37";
////const NSString *const MobApp = @"15b512bbfaad0";
////const NSString *const MobSecret = @"4cf49f7b30fa405804d955fffb5d16ee";
/**
 *  其他链接、Key
 */
const NSString *const WMAMapAppKey = @"";
const NSString *const WBaiduMapAppKey = @"";

const NSString *const WTencentAppKey = @"";
const NSString *const WWeixinAppKey = @"";
const NSString *const WWeixinAppAppSecret = @"";

const NSString *const WTestInAppKey = @"";
const NSString *const WUMengAppKey = @"567fa270e0f55ae3be00200e";

const NSString *const WAppStoreID = @"";

const NSString *const WJpushKey = @"";

const NSString *const WEaseMobAppKey = @"";
const NSString *const WEaseMobClientID = @"";
const NSString *const WEaseMobClientSecret = @"";
const NSString *const WEaseMobLoginChange = @"loginStateChange";

/**
 *  网易云信的相关key
 */
const NSString *const WNTESAppKey = @"b60a037c4a59ca9a31fc05c161c3e743";
const NSString *const WNTESApiURL = @"https://app.netease.im/api";

#if DEBUG
const NSString *const WApsCertName = @"aps_dev";
const NSString *const WNTESCerName = @"CodeShareDev";

#else
const NSString *const WApsCertName = @"aps_pro";
const NSString *const WNTESCerName = @"CodeShareDis";

#endif

/* 应用内通知 */
/**
 *  注册成功
 */
const NSString *const WRegisterSuccess = @"RegisterSuccess";
/**
 *  获取用户信息成功
 */
const NSString *const WCGetInfoSuccess = @"GetUserInfoSuccess";
/**
 *  登录成功
 */
const NSString *const WLogInSuccess = @"LogInSuccess";
/**
 *  用户注销
 */
const NSString *const WLogOffSuccess = @"LogOffSuccess";
