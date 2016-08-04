//
//  QFCommonSetting.h
//  CodeShare
//
//  Created by 王广威 on 16/3/29.
//  Copyright © 2016年 北京千锋-王广威. All rights reserved.
//

#ifndef QFCommonSetting_h
#define QFCommonSetting_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 *  是否开启自定义打印
 *	1.开启 0.关闭
 */
#define isShowLog 1

#if __has_include("LxDBAnything.h")

#import "LxDBAnything.h"
#define WLog(anyObj) LxDBAnyVar(anyObj)

#elif isShowLog

#define WLog(anyObj) fprintf(stderr,"%s: %s->%d\n%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __FUNCTION__, __LINE__, [[NSString stringWithFormat:@"%@", ##__VA_ARGS__] UTF8String])

#else

#define WLog(anyObj)

#endif

// 颜色
#define WColorRGB(r, g, b) WColorRGBA(r, g, b, 1.000f)
#define WColorRGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
// RGB十六进制表示颜色
#define WColorFromRGB(rgbValue) WColorRGB(\
(float)((rgbValue & 0xFF0000) >> 16),\
(float)((rgbValue & 0xFF00) >> 8),\
(float)(rgbValue & 0xFF))

// 随机数
#define WArcNum(x) arc4random_uniform(x)
// 随机颜色
#define WArcColor WColorRGB(WArcNum(128) + 128, WArcNum(128) + 128, WArcNum(128) + 128)

// 整形转字符串
#define NSStringFromNSInteger(x) [NSString stringWithFormat:@"%ld", (long)x]

/**
 *  深绿
 */
#define WColorDarkMain WColorFromRGB(0x27c242)
/**
 *  主要颜色(绿)
 */
#define WColorMain WColorFromRGB(0x9dcd58)
/**
 *  次绿
 */
#define WColorLightMain WColorFromRGB(0x82ee2b)
/**
 *  浅绿
 */
#define WColorSmallMain WColorFromRGB(0x6cb300)
/**
 *  黑色文字颜色
 */
#define WColorFont WColorFromRGB(0x343433)
/**
 *  粉红
 */
#define WColorPink WColorFromRGB(0xed9199)
/**
 *  背景颜色(灰)
 */
#define WColorBg WColorFromRGB(0xb2b2b2)
/**
 *  深灰色
 */
#define WColorDarkGray WColorFromRGB(0x9f9f9f)
/**
 *  浅灰色
 */
#define WColorLightGray WColorFromRGB(0xd8d8d8)
/**
 *  更浅灰色
 */
#define WColorDarkWhite WColorFromRGB(0xf1f1f1)
/**
 *  最浅灰色
 */
#define WColorLightWhite WColorFromRGB(0xf6f6f6)

//-------------------获取设备大小-------------------------
// NavBar高度
#define WNavigationBarHeight (44.0)
// 状态栏高度
#define WStatusBarHeight CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])
// 顶部高度
#define WTopHeight (WNavigationBarHeight + WStatusBarHeight)
// 底部 TabBar 高度
#define WTabBarHeight 49
// 动态获取屏幕宽高
#define WScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define WScreenWidth ([UIScreen mainScreen].bounds.size.width)
// 默认按钮高度
#define WButtonHeight 48
// 弹出框距左右边距
#define WLeftPedding 25
// 普通视图左右边距
#define WPedding 10
// 圆角
#define WCornerRadius 4.0f

// 弹出框动画时间
#define WAnimationTime 0.25f
// 提示框弹出时间
#define WAlertViewPopTime 0.15f
// 提示框显示时间
#define WAlertViewShowTime 2.5f

#endif /* QFCommonSetting_h */
