//
//  AppDelegateFirstVC.m
//  UberValetService
//
//  Created by Globussoft 1 on 10/30/14.
//  Copyright (c) 2014 Globussoft 1. All rights reserved.
//

#import "AppDelegateFirstVC.h"
#import "ViewController.h"
#import "RegisterVC.h"

@interface AppDelegateFirstVC ()
{
    ViewController *loginVC;
    RegisterVC *registerVC;
}
@end

@implementation AppDelegateFirstVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    
    UIButton *loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *registerButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [loginButton setImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [registerButton setImage:[UIImage imageNamed:@"signup.png"] forState:UIControlStateNormal];

//   if ([UIScreen mainScreen].nativeScale == 2.0f){
        if ( self.view.bounds.size.height>568) {
            NSLog(@"in iPhone6");
            
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_750@2x.png"]];
            loginButton.frame=CGRectMake(35.0, self.view.bounds.size.height-80, 120, 30);
            registerButton.frame=CGRectMake(215, self.view.bounds.size.height-80, 120, 30);
            
        }
        else if (self.view.bounds.size.height==568){
            NSLog(@"in iPhone5");
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_568.png"]];
            
            loginButton.frame=CGRectMake(25.0, self.view.bounds.size.height-100, 120, 30);
            registerButton.frame=CGRectMake(175, self.view.bounds.size.height-100, 120, 30);
            
        } else{
            NSLog(@"in iPhone4");
            
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen.png"]];
            
            loginButton.frame=CGRectMake(25.0, self.view.bounds.size.height-80, 120, 30);
            registerButton.frame=CGRectMake(175, self.view.bounds.size.height-80, 120, 30);
            
        }
 //  }
//    else if([UIScreen mainScreen ].nativeScale>2.1)
//    {
//        NSLog(@"in iPhone 6 plus");
//        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen@3x.png"]];
//        
//        loginButton.frame=CGRectMake(45.0, self.view.bounds.size.height-80, 120, 30);
//        registerButton.frame=CGRectMake(245, self.view.bounds.size.height-80, 120, 30);
//    }

    
    [self.view addSubview:loginButton];
    
    [self.view addSubview:registerButton];

    // Do any additional setup after loading the view.
}


-(void)registerButtonClick:(UIButton *)button{
    BOOL connect=[[NSUserDefaults standardUserDefaults]boolForKey:@"CurrentNetworkStatus"];
    
    if (!connect) {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"There is no Internet Connection in your device" message:@"Check Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
        
        if (!registerVC) {
            registerVC=[[RegisterVC alloc] init];
        }
        [self presentViewController:registerVC animated:YES completion:nil];
        
    }
}

-(void)loginButtonClick:(UIButton *)button{
    BOOL connect=[[NSUserDefaults standardUserDefaults]boolForKey:@"CurrentNetworkStatus"];
    
    if (!connect) {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"There is no Internet Connection in your device" message:@"Check Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{

    loginVC=[[ViewController alloc] init];
    [self presentViewController:loginVC animated:NO completion:nil];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
