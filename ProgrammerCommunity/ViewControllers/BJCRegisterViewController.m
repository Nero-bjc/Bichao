//
//  BJCRegisterViewController.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/3.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "BJCRegisterViewController.h"
#import "Masonry.h"

#import "UIButton+BackgroundColor.h"
#import "UIControl+ActionBlocks.h"
#import "NSTimer+Blocks.h"
#import "NSTimer+Addition.h"
#import "NSString+MD5.h"
#import "UIAlertView+Block.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SMSSDK/SMS_SDK/SMSSDK.h>
@interface BJCRegisterViewController ()

// 写成属性，可以方便地监控变化
@property (nonatomic, strong) NSNumber *waitTime;
// 定时器作为属性
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BJCRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册界面";
    self.view.backgroundColor = [UIColor colorWithWhite:0.942 alpha:1.000];
    
    [self setUpViews];
}
- (void)setUpViews {
    
    //手机号码
    UITextField *phoneTextField = [[UITextField alloc]init];
    [self.view addSubview:phoneTextField];
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneTextField.placeholder = @"请输入邮箱或手机号码";
    UIImageView *phoneLeftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"用户图标"]];
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
    [phoneView addSubview:phoneLeftImageView];
    [phoneLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(@0);
    }];
    phoneTextField.backgroundColor = [UIColor whiteColor];
    phoneTextField.leftView = phoneView;
    phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    phoneTextField.layer.borderWidth = 0.5;
    phoneTextField.font = [UIFont systemFontOfSize:15 weight:-0.15];
    phoneTextField.layer.borderColor = [UIColor grayColor].CGColor;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    //手机输入框布局 制造约束
    //在手写布局的时候 我们添加的所有约束必须能够确定这个视图的位置和大小
    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.left.equalTo(@0);
        //        make.right.equalTo(@0);
        make.height.equalTo(@64);
        make.top.equalTo(@120);
        make.left.right.equalTo(@0);
        //因为Masonry 在实现的时候 充分考虑到写约束的时候越简单越好 所以引入了链式写法 可以尽量将一样的约束写到一起
    }];
    
    //密码
    UITextField *passwordTextField = [[UITextField alloc]init];
    [self.view addSubview:passwordTextField];
    passwordTextField.placeholder = @"输入密码";
    passwordTextField.secureTextEntry = YES;
    UIImageView *passwordLeftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"密码图标"]];
    UIView *passwordView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
    [passwordView addSubview:passwordLeftImageView];
    [passwordLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(@0);
    }];
    passwordTextField.leftView = passwordView;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.backgroundColor = [UIColor whiteColor];
    passwordTextField.font = [UIFont systemFontOfSize:15 weight:-0.15];
    passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    passwordTextField.layer.borderWidth = 0.5;
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.and.right.equalTo(@0);
        make.height.equalTo(@64);
        make.top.equalTo(phoneTextField.mas_bottom);
    }];
    
    //验证码
    UITextField *testField = [[UITextField alloc]init];
    [self.view addSubview:testField];
    testField.placeholder = @"请输入验证码";
    UIView *testLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
    UIImageView *testImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"验证信息图标"]];
    [testLeftView addSubview:testImageView];
    testField.leftView = testLeftView;
    testField.leftViewMode = UITextFieldViewModeAlways;
    testField.backgroundColor = [UIColor whiteColor];
    testField.font = [UIFont systemFontOfSize:15 weight:-0.15];
    [testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.center.equalTo(@0);
    }];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [rightButton setBackgroundColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [rightButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithRed:0.490 green:1.000 blue:0.147 alpha:1.000] forState:UIControlStateNormal];
    [rightButton titleLabel].font = [UIFont systemFontOfSize:14 weight:-0.15];
    rightButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    rightButton.layer.borderWidth = 1.0f;
    rightButton.layer.cornerRadius = 4.0f;
    rightButton.layer.masksToBounds = YES;
    rightButton.enabled = NO;
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 108, 48)];
    [rightView addSubview:rightButton];
    testField.rightView = rightView;
    testField.rightViewMode = UITextFieldViewModeAlways;
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(@0);
        make.top.equalTo(@8);
        make.left.equalTo(@4);
    }];
    [testField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(@0);
        make.top.equalTo(passwordTextField.mas_bottom).offset(16);
        make.height.equalTo(@48);
    }];

    //注册按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [loginButton titleLabel].font = [UIFont systemFontOfSize:15];
    [loginButton setFrame:CGRectMake(0,320, self.view.bounds.size.width, 64)];
    [self.view addSubview:loginButton];
    
    // 当我们不用 antuLayout 的时候，如何去让视图自适应
    // autoResizing是 autoLayout 之前界面自适应的工具，只有几个枚举类型。
    //	typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    //		UIViewAutoresizingNone                 = 0,
    //		UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    //		UIViewAutoresizingFlexibleWidth        = 1 << 1,
    //		UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    //		UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    //		UIViewAutoresizingFlexibleHeight       = 1 << 4,
    //		UIViewAutoresizingFlexibleBottomMargin = 1 << 5
    //	};
    // 让登录按钮的宽度和左边距保持跟父控件相对位置不变。
    loginButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [loginButton setBackgroundColor:[UIColor colorWithRed:0.6693 green:0.8992 blue:1.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loginButton setBackgroundColor:[UIColor colorWithRed:0.8292 green:0.7534 blue:0.9992 alpha:1.0] forState:UIControlStateDisabled];
    [loginButton setBackgroundColor:[UIColor colorWithRed:0.9992 green:0.5655 blue:0.533 alpha:1.0] forState:UIControlStateNormal];
    loginButton.enabled = NO;
    RAC(loginButton, enabled) = [RACSignal combineLatest:@[phoneTextField.rac_textSignal, passwordTextField.rac_textSignal, testField.rac_textSignal] reduce:^(NSString *phone, NSString *pass, NSString *veri){
        return @(phone.length >= 11 && pass.length >=6 && veri.length == 4);
    }];

    
    
    
    [phoneTextField.rac_textSignal subscribeNext:^(NSString* x) {
        
        if (x.length >= 11) {
            
            [passwordTextField becomeFirstResponder];
        if (x.length > 11){
          
            phoneTextField.text = [x substringToIndex:11];
        }}
    }];
    
    RAC(rightButton,enabled) = [RACSignal combineLatest:@[phoneTextField.rac_textSignal] reduce:^(NSString *phone){
        return @(phone.length >= 11);
    }];
   
    [rightButton handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
       
        self.waitTime = @60;
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
            
            if (error) {
                
                NSLog(@"获取验证码失败");
                self.waitTime = @-1;
            }else {
                
                NSLog(@"发送验证码成功");
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f block:^{
                    
                    self.waitTime = [NSNumber numberWithInteger:self.waitTime.integerValue -1];
                } repeats:YES];
            }
        }];
    }];
    
    // 用 RAC 监控数据的变化，显示相应的界面
    [RACObserve(self, waitTime) subscribeNext:^(NSNumber *waitTime) {
        if (waitTime.integerValue <= 0) {
            // 将定时器去除的操作写到这里也可以
            [self.timer invalidate];
            self.timer = nil;
            [rightButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        }else if(waitTime.integerValue > 0) {
            [rightButton setTitle:[NSString stringWithFormat:@"等待%@秒", waitTime] forState:UIControlStateNormal];
        }
    }];
    
    [[loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        // 一般我们的密码不可能会明文传输，最简单的也要进行 MD5 加密
        // 一旦进行 MD5 加密，会破坏字符串原来携带的信息。
        // 但是对于密码来说，服务器和 app交换并不需要知道密码所携带的信息，所以无论是登录还是注册，我们都必须加密(服务器也不知道你的密码是多少)
        // MD5 加密算法是死的，所以别人可以通过暴力破解的方式来获取你的密码，
        // 所以我们有时候，会将我们的密码加盐后再进行加密，传给服务器
        //		固定字符串的盐 @"ABCDEF";
        //		随机字符串的盐
        
        NSString *pass = [passwordTextField.text md532BitUpper];
        NSDictionary *paras = @{
                                @"service": @"User.Register",
                                @"phone": phoneTextField.text,
                                @"password": pass,
                                @"verificationCode": testField.text,
                                };
        // 注册用户
        [NetworkTool getDataWithParameters:paras completeBlock:^(BOOL success, id result) {
            if (success) {
                [self.navigationController popViewControllerAnimated:YES];
            }else {
               [UIAlertView alertWithCallBackBlock:nil title:@"温馨提示" message:result cancelButtonName:@"确定" otherButtonTitles:nil, nil];
            }
        }];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
