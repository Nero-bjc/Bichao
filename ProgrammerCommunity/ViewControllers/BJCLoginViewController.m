
//
//  BJCLoginViewController.m
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/3.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import "BJCLoginViewController.h"
#import <Masonry.h>
//这个里面封装了一个方法 可以让我们通过一个颜色得到一个纯色的图片
#import "UIImage+Color.h"
#import "UIControl+ActionBlocks.h"
#import "UIButton+BackgroundColor.h"
#import "BJCForgetPasswordViewController.h"
#import "BJCRegisterViewController.h"
#import "UIAlertView+Block.h"
#import "NSString+MD5.h"
@interface BJCLoginViewController ()

@end

@implementation BJCLoginViewController
//viewDidLoad是控制器的视图已经加载完毕 会自动调用的一个方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.942 alpha:1.000];
    self.title = @"用户登录界面";
    [self setUpViews];
}
- (void)setUpViews {
    
    //创建手机号码输入框 密码输入框 登录按钮
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
    
    
    
    
    

    UIButton *forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPassword titleLabel].font = [UIFont systemFontOfSize:14];
    [forgetPassword setFrame:CGRectMake(self.view.frame.size.width - 80, 250, 80, 64)];
    [self.view addSubview:forgetPassword];
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginButton];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton titleLabel].font = [UIFont systemFontOfSize:15];
//    [loginButton setFrame:CGRectMake(0,320, self.view.bounds.size.width, 64)];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(forgetPassword.mas_bottom);
        make.right.equalTo(@20);
        make.left.equalTo(@20);
        make.height.equalTo(@44);
    }];
    
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
    [loginButton setBackgroundColor:[UIColor colorWithRed: 10/255.0 green:164/255.0 blue:10/255.0 alpha:1.0] forState:UIControlStateNormal];
    [loginButton setBackgroundColor:[UIColor colorWithRed:153/255.0 green:218/255.0 blue:153/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [loginButton setBackgroundColor:[UIColor colorWithRed:8/255.0 green:144/255.0 blue:7/255.0 alpha:1.0] forState:UIControlStateHighlighted];


    //跳转界面
    [forgetPassword setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //[forgetPassword addTarget:self action:@selector(gotoForgetVC) forControlEvents:UIControlEventTouchUpInside];
    //我们还可以把按钮的事件与按钮写到一块 把按钮的事件回调写到block里便于我们在写界面的时候 方便的加入控制时间
    [forgetPassword handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        
        BJCForgetPasswordViewController *forgetVC = [[BJCForgetPasswordViewController alloc]init];
        [self.navigationController pushViewController:forgetVC animated:YES];
    }];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(gotoRegisterVC)];
    
    [phoneTextField handleControlEvents:UIControlEventEditingChanged withBlock:^(id weakSender) {
       
        if (phoneTextField.text.length >= 11) {
            if (phoneTextField.text.length > 11) {
                phoneTextField.text = [phoneTextField.text substringToIndex:11];
            }
            [passwordTextField becomeFirstResponder];
        }
    }];
    
    RAC(loginButton,enabled) = [RACSignal combineLatest:@[phoneTextField.rac_textSignal,passwordTextField.rac_textSignal] reduce:^(NSString* phone,NSString *password){
       
        return @(phone.length >= 11 &&password.length >=6);
    }];
    [loginButton handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
       
        NSDictionary *dic = @{
                              @"service":@"User.Login",
                              @"phone":phoneTextField.text,
                              @"password":[passwordTextField.text md532BitUpper],
                              };
        [NetworkTool getDataWithParameters:dic completeBlock:^(BOOL success, id result) {
           
            if (success) {
                NSLog(@"%@",result);
//                [[BJCUserModle shareBJVUserModel] setValuesForKeysWithDictionary:result];
                
                [[BJCUserModle shareBJVUserModel] yy_modelSetWithDictionary:result];
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }else {
                
                [UIAlertView alertWithCallBackBlock:nil title:@"温馨提示" message:result cancelButtonName:@"确定" otherButtonTitles: nil];
            }
        }];
    }];
    
    
    
    
    
    
    
}
#pragma mark - <点击空白处键盘下去>
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - <跳转到注册的视图控制器>
- (void)gotoRegisterVC {
    
    BJCRegisterViewController *forgetVC = [[BJCRegisterViewController alloc]init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}
#pragma mark - <生命周期>
//界面将要出现
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
//界面已经出现
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
//界面将要消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
//界面已经消失
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
