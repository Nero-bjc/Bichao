//
//  AppDelegate.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/2.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "AppDelegate.h"
#import "BJCTabBarController.h"
#import <SMSSDK/SMS_SDK/SMSSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //一般情况下为了防止 AppDelegate 里面添加的东西过多 显得程序混乱 我们会将不同的模块封装起来
    
    [self setUpRootViewController];
    [self setUpMob];
    return YES;
}

#pragma mark - <注册一个短信验证>
- (void)setUpMob {
    
    [SMSSDK registerApp:MobApp withSecret:MobSecret];
}
#pragma mark - <设置window的根视图控制器>
- (void)setUpRootViewController {
    
    //当我们把 main.storyboard 关联去掉 那么app只会展示一个黑色的 window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[BJCTabBarController alloc]init];
    [self.window makeKeyAndVisible];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
