//
//  ViewController.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/2.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "ViewController.h"
#import "NetworkTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *parameter = @{
                                @"service": @"UserInfo.GetInfo",
                                @"uid": @"1",
                                };
    [NetworkTool getDataWithParameters:parameter completeBlock:^(BOOL success, id result) {
        // 虽然我们把成功和失败写到一个 block 回调，但是还是需要判断
        if (success) {
            NSLog(@"用户信息 --%@", result);
            
        }else {
            NSLog(@"失败原因 --%@", result);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
