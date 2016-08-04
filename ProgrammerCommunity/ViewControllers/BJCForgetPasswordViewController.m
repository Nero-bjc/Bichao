//
//  BJCForgetPasswordViewController.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/3.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "BJCForgetPasswordViewController.h"
#import "Masonry.h"
#import "UIButton+BackgroundColor.h"
@interface BJCForgetPasswordViewController ()

@end

@implementation BJCForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"忘记密码";
    self.view.backgroundColor = [UIColor greenColor];
    [self setUpViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpViews {
    
    UITextField *phoneTextField = [[UITextField alloc]init];
    [self.view addSubview:phoneTextField];
    phoneTextField.placeholder = @"请输入邮箱或手机号码";
    phoneTextField.font = [UIFont systemFontOfSize:15 weight:-0.15];
    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.equalTo(@0);
        make.top.equalTo(@64);
        make.height.equalTo(@48);
    }];
    UIView *phoneLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    UIImageView *phoneImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"手机邮箱图标"]];
    [phoneLeftView addSubview:phoneImageView];
    phoneTextField.leftView = phoneLeftView;
    phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    phoneTextField.backgroundColor = [UIColor whiteColor];
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    
    
    
    
    UITextField *passwordTextField = [[UITextField alloc]init];
    [self.view addSubview:passwordTextField];
    passwordTextField.placeholder = @"请输入验证码";
    passwordTextField.font = [UIFont systemFontOfSize:15 weight:-0.15];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(@0);
        make.top.equalTo(phoneTextField.mas_bottom);
        make.height.equalTo(@48);
    }];
    UIView *passwordLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    UIImageView *passwordImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"验证信息图标"]];
    [passwordLeftView addSubview:passwordImageView];
    passwordTextField.leftView = passwordLeftView;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.backgroundColor = [UIColor whiteColor];
    [passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    passwordTextField.secureTextEntry = YES;
    
    
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [rightButton setBackgroundColor:[UIColor redColor] forState:UIControlStateDisabled];
    [rightButton setBackgroundColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [rightButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [rightButton setTintColor:[UIColor blackColor]];
    [rightButton titleLabel].font = [UIFont systemFontOfSize:14 weight:-0.15];
    rightButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    rightButton.layer.borderWidth = 1.0f;
    rightButton.layer.cornerRadius = 4.0f;
    rightButton.layer.masksToBounds = YES;
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 108, 48)];
    [rightView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(@0);
        make.top.equalTo(@8);
        make.left.equalTo(@4);
    }];
    passwordTextField.rightView = rightView;
    passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
