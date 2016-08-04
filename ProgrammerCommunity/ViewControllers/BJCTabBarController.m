//
//  BJCTabBarController.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/3.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "BJCTabBarController.h"
#import "MainViewController.h"
#import "BJCUserModle.h"
#import "BJCLoginViewController.h"
@interface BJCTabBarController ()

@end

@implementation BJCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //将所有的控制器按照MVC的思想配置好，并且封装起来
    [self setUpViewControllers];
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    if (![BJCUserModle isLogin]) {
        
        [self showLoginViewController];
    }
}
#pragma mark - <跳转到登录界面>
- (void)showLoginViewController {
    
    BJCLoginViewController *loginVC = [[BJCLoginViewController alloc]init];
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:loginVC];
    //一般我们在使用模态视图时我们都会用导航控制将视图包装一下
    [self presentViewController:navVC animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <设置tabBarViewController的子控制器>
- (void)setUpViewControllers {
    
//    如何使用 MVC 的思想
    NSArray *controllerInfo = @[
                                //数组里面每一个条目都是一个字典 里面配置了是哟有控制显示的效果和类型
                                @{
                                    @"class":[MainViewController class],
                                    @"title":@"首页",
                                    @"icon":@"tabbar1"
                                    },
                                @{
                                    @"class":[UIViewController class],
                                    @"title":@"首页",
                                    @"icon":@"tabbar12"
                                    },
                                @{
                                    @"class":[UIViewController class],
                                    @"title":@"首页",
                                    @"icon":@"tabbar1"
                                    },
                                @{
                                    @"class":[UIViewController class],
                                    @"title":@"首页",
                                    @"icon":@"tabbar1"
                                    },
                                ];
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    [controllerInfo enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIViewController *viewController = [[[obj objectForKey:@"class"]alloc]init];
        
        viewController.title = [obj objectForKey:@"title"];
        
        UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:viewController];
        
//        需要将导航控制器装入到数组中
        [viewControllers addObject:navVC];
    }];
//    配置控制器数组
    self.viewControllers = viewControllers;
}

@end
