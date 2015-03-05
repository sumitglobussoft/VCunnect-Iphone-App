//
//  RegisterVC.m
//  Vconnect
//
//  Created by Sumit on 10/01/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "RegisterVC.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RegisterVC ()

@end

@implementation RegisterVC
@synthesize nameTxtField,emailTxtField,passwordTxtField,phoneTxtField,submitSignup;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.scrollView.delegate=self;
    self.scrollView.backgroundColor=[UIColor clearColor];
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 650)];
    [self.view addSubview:self.scrollView];

    btn1 = [[UIButton alloc]init];
    btn1.frame = CGRectMake(210,self.view.frame.size.height-120, 30, 30);
     [btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setImage:[UIImage imageNamed:@"select_normal.png"] forState:UIControlStateNormal];
    [self.scrollView addSubview:btn1];

    
    btn2 = [[UIButton alloc]init];
    btn2.frame = CGRectMake(250, self.view.frame.size.height-120, 30, 30);
    [btn2 addTarget:self action:@selector(btn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setImage:[UIImage imageNamed:@"select_normal.png"] forState:UIControlStateNormal];
     [self.scrollView addSubview:btn2];
    
    self.genderLbl = [[UILabel alloc]init];
    self.genderLbl.text = @"Gender";
//    self.genderLbl.textColor = [UIColor redColor];
    self.genderLbl.font = [UIFont fontWithName:nil size:12];
    self.genderLbl.frame = CGRectMake(220, self.view.frame.size.height-140, 100, 30);
    [self.scrollView addSubview:self.genderLbl];
    
    self.MaleLbl = [[UILabel alloc]init];
    self.MaleLbl.text = @"Male";
//    self.MaleLbl.textColor = [UIColor redColor];
    self.MaleLbl.font = [UIFont fontWithName:nil size:12];
    self.MaleLbl.frame = CGRectMake(210, self.view.frame.size.height-100, 50, 30);
    [self.scrollView addSubview: self.MaleLbl];
    
    self.femaleLbl = [[UILabel alloc]init];
    self.femaleLbl.text = @"Female";
//   self.femaleLbl.textColor = [UIColor redColor];
    self.femaleLbl.font = [UIFont fontWithName:nil size:12];
      self.femaleLbl.frame = CGRectMake(250, self.view.frame.size.height-100, 100, 30);
    [self.scrollView addSubview:self.femaleLbl];
    
   
    self.nameTxtField = [[UITextField alloc] init];
    self.nameTxtField.font = [UIFont systemFontOfSize:15];
    self.nameTxtField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.nameTxtField.placeholder  = @" Enter Your Name";
    self.nameTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.nameTxtField.keyboardType = UIKeyboardTypeDefault;
    self.nameTxtField.returnKeyType = UIReturnKeyDone;
    self.nameTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameTxtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.nameTxtField.delegate = self;
    [self.scrollView addSubview:self.nameTxtField];
    
    self.ageTxtField = [[UITextField alloc] init];
     self.ageTxtField.font = [UIFont systemFontOfSize:15];
     self.ageTxtField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
     self.ageTxtField.placeholder  = @" Enter YourAge";
    self.ageTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
     self.ageTxtField.keyboardType = UIKeyboardTypeNumberPad;
    self.ageTxtField.returnKeyType = UIReturnKeyDone;
     self.ageTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.ageTxtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.ageTxtField.delegate = self;
    [self.scrollView addSubview:self.ageTxtField];
    
    self.phoneTxtField = [[UITextField alloc] init];
        self.phoneTxtField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.phoneTxtField.borderStyle = UITextBorderStyleNone;
    self.phoneTxtField.font = [UIFont systemFontOfSize:15];
    self.phoneTxtField.placeholder = @" Enter Phone No";
    self.phoneTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.phoneTxtField.keyboardType = UIKeyboardTypeDefault;
    self.phoneTxtField.returnKeyType = UIReturnKeyDone;
    self.phoneTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTxtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.phoneTxtField.delegate = self;
    [self.scrollView addSubview:self.phoneTxtField];
    
    self.emailTxtField = [[UITextField alloc] init];
    self.emailTxtField.font = [UIFont systemFontOfSize:15];
    self.emailTxtField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.emailTxtField.placeholder  = @" Enter Email Address";
    self.emailTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailTxtField.keyboardType = UIKeyboardTypeDefault;
    self.emailTxtField.returnKeyType = UIReturnKeyDone;
    self.emailTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.emailTxtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.emailTxtField.delegate = self;
    [self.scrollView addSubview:self.emailTxtField];
    
    self.passwordTxtField = [[UITextField alloc] init];
    self.passwordTxtField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.passwordTxtField.borderStyle = UITextBorderStyleNone;
    self.passwordTxtField.font = [UIFont systemFontOfSize:15];
    self.passwordTxtField.placeholder = @" Enter Password";
    self.passwordTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordTxtField.keyboardType = UIKeyboardTypeDefault;
    self.passwordTxtField.returnKeyType = UIReturnKeyDone;
    self.passwordTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTxtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordTxtField.delegate = self;
    [self.scrollView addSubview:self.passwordTxtField];
    
    self.backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.frame=CGRectMake(10, 20, 50,50);
    [self.backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [self.scrollView addSubview:self.backButton];
    
    self.submitSignup = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.submitSignup addTarget:self action:@selector(signupAction) forControlEvents:UIControlEventTouchUpInside];
      [self.submitSignup setImage:[UIImage imageNamed:@"signup.png"] forState:UIControlStateNormal];
    [self.scrollView addSubview:self.submitSignup];


    
//    if ([UIScreen mainScreen].nativeScale == 2.0f){
    
        if (self.view.frame.size.height>568) {
            NSLog(@"in iPhone6");
            
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_750@2x.png"]];
 
            
            self.nameTxtField.frame = CGRectMake(55,self.view.frame.size.height-430, 268, 40);
            
            self.phoneTxtField.frame = CGRectMake(55, self.view.frame.size.height-370, 268, 40);
            
            
            self.emailTxtField.frame = CGRectMake(55,self.view.frame.size.height-310, 268, 40);
            
            self.passwordTxtField.frame = CGRectMake(55, self.view.frame.size.height-250, 268, 40);
            
            
        }
        else if (self.view.frame.size.height==568){
            
            NSLog(@"in iPhone5");
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_568.png"]];
            
           
            
            self.nameTxtField.frame = CGRectMake(25,self.view.frame.size.height-390, 268, 40);
            
            self.phoneTxtField.frame = CGRectMake(25, self.view.frame.size.height-330, 268, 40);
            
            self.emailTxtField.frame = CGRectMake(25,self.view.frame.size.height-270, 268, 40);
            
            self.passwordTxtField.frame = CGRectMake(25, self.view.frame.size.height-210, 268, 40);
            
        }
        else{
            
            NSLog(@"in iPhone4");
            
             self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen.png"]];
            
 
            
            self.nameTxtField.frame = CGRectMake(25,self.view.frame.size.height-320, 268, 40);
            
            self.phoneTxtField.frame = CGRectMake(25, self.view.frame.size.height-270, 268, 40);
            
            self.emailTxtField.frame = CGRectMake(25,self.view.frame.size.height-220, 268, 40);
            
            self.passwordTxtField.frame = CGRectMake(25, self.view.frame.size.height-170, 268, 40);
           

            self.ageTxtField.frame = CGRectMake(25,self.view.frame.size.height-120, 140, 40);
            
             self.submitSignup.frame=CGRectMake(10, self.view.frame.size.height-70, 268, 40);
            }
        }
//            else if([UIScreen mainScreen ].nativeScale>2.1)
//        {
//            NSLog(@"in iPhone 6 plus");
//           self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen@3x.png"]];
//            
//            self.nameTxtField.frame = CGRectMake(68,self.view.frame.size.height-480, 268, 40);
//           
//            self.phoneTxtField.frame = CGRectMake(68, self.view.frame.size.height-425, 268, 40);
//            
//            self.emailTxtField.frame = CGRectMake(68,self.view.frame.size.height-370, 268, 40);
//            
//            self.passwordTxtField.frame = CGRectMake(68, self.view.frame.size.height-315, 268, 40);
//        }

//}



- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)signupAction{
    
//http://api.vconnect.globusapps.com/index.php?method=insertMobileUserData&Email=12wqe@test.com&UserName=ankit&Password=kjba213&Location=India&City=Bhilai&Latitude=21.07&Longitude=12.09&Gender=male&Age=12
    
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    

    
    NSString *emailField = emailTxtField.text;
    NSString *userName = nameTxtField.text;
    NSString *password = passwordTxtField.text;
    NSString *latitude = [[NSUserDefaults standardUserDefaults]objectForKey:@"latitude"];
    NSString *longitude = [[NSUserDefaults standardUserDefaults]objectForKey:@"longitude"];
    NSString *locality = [[NSUserDefaults standardUserDefaults]objectForKey:@"locality"];
    NSString *country = [[NSUserDefaults standardUserDefaults]objectForKey:@"country"];

    
  
   NSString * urlStr=[NSString stringWithFormat:@"http://api.vconnect.globusapps.com/index.php?method=insertMobileUserData&Email=%@&UserName=%@&Password=%@&Location=%@&City=%@&Latitude=%@&Longitude=%@&Gender=%@&Age=%@",emailField,userName,password,country,locality,latitude,longitude,genderText,self.ageTxtField.text];
    urlStr=[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
    NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    
    
    if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    //     AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *responseShow = [response objectForKey:@"message"];
    NSLog(@"response show is %@",responseShow);
    [[AppDelegate sharedAppDelegate]showToastMessage:responseShow];
    
//      [[appDelegate sharedAppDelegate]showToastMessage:responseShow];
    NSLog(@"response is %@",response);

    
}


-(void)btn1Clicked
{
     genderText = @"Male";
    [btn1 setSelected:YES];
   
    
    [btn1 setImage:[UIImage imageNamed:@"select_active.png"]forState:UIControlStateSelected];
    [btn2 setImage:[UIImage imageNamed:@"select_normal.png"]forState:UIControlStateSelected];
    
}


-(void)btn2Clicked
{
     genderText = @"Female";
    [btn2 setSelected:YES];
    [btn2 setImage:[UIImage imageNamed:@"select_active.png"]forState:UIControlStateSelected];
    [btn1 setImage:[UIImage imageNamed:@"select_normal.png"]forState:UIControlStateSelected];
}


-(void)backButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
