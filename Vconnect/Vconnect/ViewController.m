//
//  ViewController.m
//  Vconnect
//
//  Created by Sumit on 09/01/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "ViewController.h"
#import "RegisterVC.h"
#import "AFNHelper.h"
#import "AppDelegateFirstVC.h"
#import "RegisterVC.h"
#import "HomeVC.h"
#import "FirstVC.h"
#import "GroupViewController.h"
#import "CalendarViewController.h"
#import "MessageViewController.h"
#import "RefreshViewController.h"
#import "InterestViewController.h"
#import "SettingsViewController.h"
#import "GameState.h"
#import "LogutVC.h"
#import "ProfileViewController.h"

@interface ViewController (){
     RegisterVC *registerVC;
}

@end

@implementation ViewController
@synthesize emailField,passwordField,emailLoginButton,forgetPswdButton,imageView,meetupButton,eventBriteButton,rememberMeBtn,rememberMeLbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    self.emailField = [[UITextField alloc] init ];
    self.emailField.font = [UIFont systemFontOfSize:15];
    self.emailField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.emailField.placeholder  = @" Enter Email Adrress";
    self.emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailField.keyboardType = UIKeyboardTypeDefault;
    self.emailField.returnKeyType = UIReturnKeyDone;
    self.emailField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.emailField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.emailField.delegate = self;
    self.emailField.text=@"vinayaka@globussoft.com";
    [self.view addSubview:self.emailField];
    
    self.passwordField = [[UITextField alloc] init ];
    self.passwordField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.passwordField.borderStyle = UITextBorderStyleNone;
    self.passwordField.font = [UIFont systemFontOfSize:15];
    self.passwordField.placeholder = @"Enter Password";
    self.passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordField.keyboardType = UIKeyboardTypeDefault;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    self.passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordField.delegate = self;
    self.passwordField.text=@"123456";
    [self.view addSubview:self.passwordField];
    
    
    self.emailLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.emailLoginButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_btn.png"]];
    [self.emailLoginButton addTarget:self action:@selector(emailLoginClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.emailLoginButton setTitle:@"Login with Email" forState:UIControlStateNormal];
    [self.view addSubview:self.emailLoginButton];
    
    self.meetupButton=[UIButton buttonWithType:UIButtonTypeCustom];
   
    self.meetupButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_with_meetup.png"]];
    [self.meetupButton addTarget:self action:@selector(meetupLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.meetupButton];
    
    
    self.eventBriteButton=[UIButton buttonWithType:UIButtonTypeCustom];
   
    self.eventBriteButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_with_eventbrite.png"]];
    [self.eventBriteButton addTarget:self action:@selector(eventBriteLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.eventBriteButton];
    
    
    self.forgetPswdButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgetPswdButton addTarget:self action:@selector(forgetPswdButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.forgetPswdButton setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    [self.view addSubview:self.forgetPswdButton];
    
    self.rememberMeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.rememberMeBtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
    [self.rememberMeBtn setImage:[UIImage imageNamed:@"checkbox_mark.png"] forState:UIControlStateSelected];
    [self.rememberMeBtn addTarget:self action:@selector(buttonTouch:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.rememberMeBtn];
    
    self.rememberMeLbl = [[UILabel alloc]init];
    self.rememberMeLbl.text = @"Remember me";
    self.rememberMeLbl.font = [UIFont fontWithName:nil size:12];
    [self.view addSubview:self.rememberMeLbl];

    
    self.imageView = [[UIImageView alloc] init ];
//    self.imageView.frame=CGRectMake(self.view.frame.size.width-200, self.view.frame.size.height-180, 30,30);
    self.imageView.image=[UIImage imageNamed:@"or.png"];
    [self.imageView setUserInteractionEnabled:NO];
    [self.view addSubview:self.imageView];
    
    self.backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.frame=CGRectMake(10, 20, 50,50);
    [self.backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];


    
//    if ([UIScreen mainScreen].nativeScale == 2.0f){
        if ( self.view.bounds.size.height>568) {
            NSLog(@"in iPhone6");
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_7501@2x.png"]];
             self.emailField.frame=CGRectMake(55,self.view.frame.size.height-460, 268, 40);
            self.passwordField.frame=CGRectMake(55, self.view.frame.size.height-400, 268, 40);
            self.forgetPswdButton.frame=CGRectMake(100, self.view.frame.size.height-365, 300, 40);
            self.emailLoginButton.frame=CGRectMake(70, self.view.frame.size.height-290, 229, 28);
            self.imageView.frame=CGRectMake(self.view.frame.size.width-200, self.view.frame.size.height-180, 30,30);
            
            
            self.meetupButton.frame= CGRectMake(40, self.view.frame.size.height-120, 120, 30);
            self.eventBriteButton.frame=CGRectMake(180, self.view.frame.size.height-120,120,30);
        }
        else if (self.view.bounds.size.height==568){
              NSLog(@"in iPhone5");
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_5681.png"]];
            self.emailField.frame=CGRectMake(30,self.view.frame.size.height-380, 268, 40);
            self.passwordField.frame=CGRectMake(30, self.view.frame.size.height-330, 268, 40);
             self.forgetPswdButton.frame=CGRectMake(10, self.view.frame.size.height-280, 300, 40);
            self.emailLoginButton.frame=CGRectMake(40, self.view.frame.size.height-230, 230, 28);
           

            self.imageView.frame=CGRectMake(self.view.frame.size.width-200, self.view.frame.size.height-180, 30,30);
            self.meetupButton.frame= CGRectMake(40, self.view.frame.size.height-120, 120, 30);
            self.eventBriteButton.frame=CGRectMake(180, self.view.frame.size.height-120,120,30);

            
           
            
        } else{
              NSLog(@"in iPhone4 ");
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen1.png"]];
           
            self.emailField.frame=CGRectMake(30,self.view.frame.size.height-380, 268, 40);
            self.passwordField.frame=CGRectMake(30, self.view.frame.size.height-330, 268, 40);
            self.forgetPswdButton.frame=CGRectMake(130, self.view.frame.size.height-290, 200,40);
            self.forgetPswdButton.titleLabel.font = [UIFont systemFontOfSize:15];
            self.rememberMeBtn.frame=CGRectMake(30,self.view.frame.size.height-290, 40,40);
//            [self.forgetPswdButton setTitleColor:[UIColor colorWithRed:(CGFloat)244/255 green:(CGFloat)174/255 blue:(CGFloat)86/255 alpha:1] forState:UIControlStateNormal];
            self.rememberMeLbl.frame = CGRectMake(70,self.view.frame.size.height-290, 100,40);
            [self.forgetPswdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            self.emailLoginButton.frame=CGRectMake(40, self.view.frame.size.height-230,228,28);
            
            self.imageView.frame=CGRectMake(self.view.frame.size.width-200, self.view.frame.size.height-180, 30,30);
            self.meetupButton.frame= CGRectMake(40, self.view.frame.size.height-120, 120, 30);
            self.eventBriteButton.frame=CGRectMake(180, self.view.frame.size.height-120,120,30);
            
        }
    }
    
//    else if([UIScreen mainScreen ].nativeScale>2.1)
//    {
//        NSLog(@"in iPhone 6 plus");
//        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen1@3x.png"]];
//        
//        self.emailField.frame=CGRectMake(55,self.view.frame.size.height-460, 268, 40);
//        self.passwordField.frame=CGRectMake(55, self.view.frame.size.height-400, 268, 40);
//        self.forgetPswdButton.frame=CGRectMake(100, self.view.frame.size.height-365, 300, 40);
//        self.emailLoginButton.frame=CGRectMake(70, self.view.frame.size.height-290, 229, 28);
//        
//        self.imageView.frame=CGRectMake(self.view.frame.size.width-200, self.view.frame.size.height-220, 30,30);
//        self.meetupButton.frame= CGRectMake(40, self.view.frame.size.height-120, 160, 30);
//        self.eventBriteButton.frame=CGRectMake(210, self.view.frame.size.height-120,150,30);
//    }
//}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        NSString *str = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
       NSString *str1 = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks1: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            NSString *string = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
            NSLog(@"string is %@",string);
            
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

-(void)signupAction{
    /*
http://api.vconnect.globusapps.com/index.php?method=insertUserData&Email=dfsdf@test.com&UserName=ankit&Password=kjba213&Location=India&City=Bhilai&Latitude=21.07&Longitude=12.09
*/
    
}

-(void)backButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)buttonTouch:(UIButton *)aButton withEvent:(UIEvent *)event
{
    aButton.selected = !aButton.selected;
}

#pragma mark===== textfield delegate.

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField==self.passwordField) {
           [self.passwordField becomeFirstResponder];

    }
    
    if (textField==self.emailField) {
        [self.emailField becomeFirstResponder];
    }
    if (textField== self.emailTxtField) {
        [ self.emailTxtField becomeFirstResponder];
    }
    
}
// become first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField==self.passwordField) {
      
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.emailField !=nil&& self.passwordField!=nil) {
        
        [self.emailField resignFirstResponder];
        [self.passwordField resignFirstResponder];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField==self.passwordField) {
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField==self.passwordField) {
      
    }
    return YES;
}

-(void)meetupLogin:(UIButton *)button{
    NSLog(@"login with meetup");
    
    //http://vconnect.globusapps.com/meetup-refresh-token/:refreshtoken/:accesstoken
   
    [self newWebView];
}

-(void)eventBriteLogin:(UIButton *)button{
    NSLog(@"login with eventbrite");
    
    NSString * client_id = @"MRKRQRR2U6CF4JWPXT";
    
    //   https://www.eventbrite.com/oauth/authorize?response_type=code&client_id=YOUR_CLIENT_KEY
    
    NSString *url = [NSString stringWithFormat:@"https://www.eventbrite.com/oauth/authorize?response_type=code&client_id=%@",client_id];
    
    NSURL * instagramUrl=[NSURL URLWithString:url];
    
    NSURLRequest *req = [[NSURLRequest alloc]initWithURL:instagramUrl];
    webView2=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    webView2.delegate=self;
    [webView2 loadRequest:req];
    [self.view addSubview:webView2];
    
    self.backButton1=[UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton1.frame=CGRectMake(20,20,50,50);
    [self.backButton1 addTarget:self action:@selector(webViewBackButton1:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton1 setTitle:@"Back" forState:UIControlStateNormal];
    self.backButton1.backgroundColor=[UIColor clearColor];
    [self.backButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [webView2 addSubview:self.backButton1];
    
    
}



-(void)newWebView{
 

        NSString * client_id = @"iqqv6hjqla8ppvp1sfrctf23av";
        NSString * redirectUri=@"http://www.globussoft.com/globussoft";
    
        NSString * url=[NSString stringWithFormat:@"https://secure.meetup.com/oauth2/authorize?client_id=%@&response_type=code&redirect_uri=%@",client_id,redirectUri];
        NSURL * instagramUrl=[NSURL URLWithString:url];
        NSURLRequest *req = [[NSURLRequest alloc]initWithURL:instagramUrl];
        webView1=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        webView1.delegate=self;
        [webView1 loadRequest:req];
        [self.view addSubview:webView1];
    
    self.backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame=CGRectMake(20,20,50,50);
    [self.backButton addTarget:self action:@selector(webViewBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    self.backButton.backgroundColor=[UIColor clearColor];
    [self.backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [webView1 addSubview:self.backButton];

        
}


#pragma mark- delegate method of webView
    
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
       urlParts = [[NSMutableArray alloc]init];
        NSString * urlStr=[[request URL]absoluteString];
        NSLog(@"WebView URL %@",urlStr);
    
    if (webView == webView1) {
        
      if ([urlStr containsString:@"code="]) {
        NSLog(@"entered here");
        
         NSArray *UrlParts =[NSArray arrayWithArray:[urlStr componentsSeparatedByString:@"?"]];
        NSLog(@"urlParts is %@",UrlParts);
        NSLog(@"url required is %@",UrlParts[1]);
        
        NSString * test = UrlParts[1];
        NSString *test2 = [test stringByReplacingOccurrencesOfString:@"code=" withString:@""];
        NSString *test3 = [test2 stringByReplacingOccurrencesOfString:@"&state=" withString:@""];
        NSLog(@"test 3 is %@",test3);
        
        [[NSUserDefaults standardUserDefaults]setObject:test3 forKey:@"authCodeMeet"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
}
    
    if (webView == webView2) {
        if ([urlStr containsString:@"code="]) {
            NSLog(@"entered here");
            
            NSArray *UrlParts =[NSArray arrayWithArray:[urlStr componentsSeparatedByString:@"?"]];
            NSLog(@"urlParts is %@",UrlParts);
            NSLog(@"url required is %@",UrlParts[1]);
            
            NSString * test = UrlParts[1];
            NSString *test2 = [test stringByReplacingOccurrencesOfString:@"code=" withString:@""];
//            NSString *test3 = [test2 stringByReplacingOccurrencesOfString:@"&state=" withString:@""];
            NSLog(@"test 2 is %@",test2);
            
            [[NSUserDefaults standardUserDefaults]setObject:test2 forKey:@"authCodeEvent"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
        }

}
    
    
        return YES;
}

-(void)webViewBackButton:(UIButton *)button{
    [self test];
//        [webView1 removeFromSuperview];
    
}
-(void)webViewBackButton1:(UIButton *)button{
    [self test1];
    
    
    FirstVC *firstVC=[[FirstVC alloc] init];
    firstVC.title=@"Home";
    
    AppDelegateFirstVC *AppFirst=[[AppDelegateFirstVC alloc] init];
    AppFirst.title=@"Login";
    
    RegisterVC *registerVc = [[RegisterVC alloc]init];
    registerVC.title = @"Register";
    
    HomeVC *homeVC=[[HomeVC alloc] init];
    homeVC.viewControllers = @[firstVC,AppFirst,registerVc];
    
    [self presentViewController:homeVC animated:YES completion:nil];
//       [webView1 removeFromSuperview];
    NSLog(@"back 2");
    
}


-(void)test{
    
    
    NSString * client_id = @"iqqv6hjqla8ppvp1sfrctf23av";
    NSString * client_secret=@"ebc36j32c80258bukm8qditijd";
    NSString * redirectUri=@"http://www.globussoft.com/globussoft";
    NSString *  grant_type=@"authorization_code";
    NSString *code=[[NSUserDefaults standardUserDefaults]objectForKey:@"authCodeMeet"];

//     NSString * url1=[NSString stringWithFormat:@"https://secure.meetup.com/oauth2/access?client_id=%@&client_secret=%@&grant_type=%@&redirect_uri=%@&code=%@",client_id,client_secret,grant_type,redirectUri,code];
       NSString *post = [NSString stringWithFormat: @"client_id=%@&client_secret=%@&grant_type=%@&redirect_uri=%@&code=%@",client_id,client_secret,grant_type,redirectUri,code];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:@"https://secure.meetup.com/oauth2/access"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept-Encoding"];
    
    [request setTimeoutInterval:20.0];
    [request setHTTPBody:postData];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSLog(@"dataAsString in json %@", [NSString stringWithUTF8String:[data bytes]]);
                               NSError *error1;
                               NSMutableDictionary * innerJson = [NSJSONSerialization
                                                                  JSONObjectWithData:data options:kNilOptions error:&error1
                                                                  ];
                               
                               NSLog(@"inner json data is %@",innerJson);
                               
                               NSString *access_token = [innerJson objectForKey:@"access_token"];
                               NSString *refresh_token = [innerJson objectForKey:@"refresh_token"];
                               

                               [[NSUserDefaults standardUserDefaults]setObject:access_token forKey:@"accesstoken"];
                               [[NSUserDefaults standardUserDefaults]setObject:refresh_token forKey:@"refreshtoken"];
                               [[NSUserDefaults standardUserDefaults]synchronize];
                               
                               NSLog(@"access_token = %@,refresh_token = %@",access_token,refresh_token);
                               
                                   [self meetUp:access_token withParams:refresh_token];

                           }];
}


//call web service for meetup .

-(void)meetUp:(NSString *)accessToken withParams:(NSString *)refreshToken{
    
 //  http://vconnect.globusapps.com/meetup-refresh-token/:refreshtoken/:accesstoken
    
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    
    accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"accesstoken"];
    refreshToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"refreshtoken"];
    
    NSString * urlStr=[NSString stringWithFormat:@"http://vconnect.globusapps.com/meetup-refresh-token/%@/%@",refreshToken,accessToken];
    urlStr=[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
   NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    

   if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSLog(@"response is %@",response);
    
}


-(void)test1{
    
    NSString * client_id = @"MRKRQRR2U6CF4JWPXT";
    //    NSString *api_key = @"1421335431132855820335";
    NSString * client_secret=@"QGS3GB67UPVI74NRJVB7OY2XEMW5URRDWOTOY2ZHBNTTZW7OCF";
    //   NSString * redirectUri=@"http://www.globussoft.com/globussoft";
    NSString *  grant_type=@"authorization_code";
    NSString *code=[[NSUserDefaults standardUserDefaults]objectForKey:@"authCodeEvent"];

    
    
    NSString *post =[NSString stringWithFormat:@"code=%@&client_secret=%@&client_id=%@&grant_type=%@",code,client_secret,client_id,grant_type];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.eventbrite.com/oauth/token"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    NSMutableDictionary * innerJson = [NSJSONSerialization
                                       JSONObjectWithData:urlData options:kNilOptions error:&error
                                       ];
    
    NSString *access_store = [innerJson objectForKey:@"access_token"];
    
    [[NSUserDefaults standardUserDefaults]setObject:access_store forKey:@"accesstokenevent"];
    [[NSUserDefaults standardUserDefaults]synchronize];
   
    NSLog(@"access store %@",access_store);
    NSLog(@"inner json is %@",innerJson);
    NSLog(@"response is %@",str);
    
    [self fetchUserDetails];
}


-(void)fetchUserDetails{
    
     //  https://www.eventbriteapi.com/v3/users/me/?token=SESXYS4X3FJ5LHZRWGKQ
    
    
    
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    
     NSString *code=[[NSUserDefaults standardUserDefaults]objectForKey:@"accesstokenevent"];
    
    NSString * urlStr=[NSString stringWithFormat:@"https://www.eventbriteapi.com/v3/users/me/?token=%@",code];
    urlStr=[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
    NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    
    
    if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSMutableDictionary * innerJson = [NSJSONSerialization
                                    JSONObjectWithData:data options:kNilOptions error:&error
                                     ];
    
    NSLog(@"response is=========================== %@",response);
    
    NSLog(@"innerJson is=========================== %@",innerJson);
    NSDictionary *emailDict = [innerJson objectForKey:@"emails"];
    
    NSString *email;
    for(NSDictionary *dict in emailDict){
     email=[dict objectForKey:@"email"];
    }
   
    NSString *firstname= [innerJson objectForKey:@"first_name"];
    NSString *lastname = [innerJson objectForKey:@"last_name"];
    NSString *name = [innerJson objectForKey:@"name"];
    NSString *idvalue = [innerJson objectForKey:@"id"];
    
    NSLog(@"email %@,firstname=%@,lastname=%@,name=%@, id=%@",email,firstname,lastname,name,idvalue);
    
   [self eventBrite:email firstname:firstname lastname:lastname name:name idval:idvalue];
    
}
//call event brite web service.

-(void)eventBrite:(NSString *)email firstname:(NSString *)firstName lastname:(NSString *)lastname name:(NSString *)name idval:(NSString*)idv{
    
    
//http://vconnect.globusapps.com/eventbrite-details/:id/:email/:name/:first_name/:last_name

    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    NSString * urlStr=[NSString stringWithFormat:@"http://vconnect.globusapps.com/eventbrite-details/%@/%@/%@/%@/%@",idv,email,name,firstName,lastname];
    urlStr=[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
    NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    
    
    if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"response is ===================-=-=-=567%@,%@",response,str);
    
}

-(void)emailLoginClick:(UIButton *)button{
   /*
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    
    
    NSString * urlStr=[NSString stringWithFormat:@"http://api.vconnect.globusapps.com/index.php?method=userLogin&Email=%@&Password=%@",self.emailField.text,self.passwordField.text];
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
    
    NSString *str = [[response objectForKey:@"UserInfo"]objectForKey:@"UserId"];;
    
//    NSString *userId;
//    for(NSDictionary *dict in emailDict){
//        userId=[dict objectForKey:@"UserId"];
//    }

    [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
//    [GameState sharedState].userId = str;
    NSLog(@"[GameState sharedState].userId %@",[GameState sharedState].userId);
   
    NSLog(@"response show is %@",responseShow);
   
    
    //      [[appDelegate sharedAppDelegate]showToastMessage:responseShow];
    NSLog(@"response is %@",response);
    
    if ([responseShow isEqualToString:@"User Login Successfully"]) {
       */
        ProfileViewController *prof = [[ProfileViewController alloc]init];
        prof.title= @"Profile";
        
        FirstVC *firstVC=[[FirstVC alloc] init];
        firstVC.title=@"Activity";
        
        CalendarViewController *calendar = [[CalendarViewController alloc]init];
        calendar.title=@"Calendar";
        
        GroupViewController *group = [[GroupViewController alloc]init];
        group.title=@"Groups";
        
        MessageViewController *message = [[MessageViewController alloc]init];
        message.title = @"Message";
        
        RefreshViewController *refresh = [[RefreshViewController alloc]init];
        refresh.title = @"Refresh";
        
        InterestViewController *interest = [[InterestViewController alloc]init];
        interest.title=@"Interests";
        
        SettingsViewController *settings = [[SettingsViewController alloc]init];
        settings.title = @"Settings";
        
        LogutVC *logvc = [[LogutVC alloc]init];
        logvc.title = @"Logout";
        
        
        HomeVC *homeVC=[[HomeVC alloc] init];
        homeVC.viewControllers = @[prof,firstVC,calendar,group,message,refresh,interest,settings,logvc];
    
//        [[AppDelegate sharedAppDelegate]showToastMessage:responseShow];
   
    [self addChildViewController:homeVC];
    
    [self.navigationController pushViewController:homeVC animated:YES];
    
    
    // [self presentViewController:homeVC animated:YES completion:nil];

//    }else{
//          [[AppDelegate sharedAppDelegate]showToastMessage:responseShow];
//    }
}


-(void)forgetPswdButton:(UIButton *)button{
   
    
    if (! self.forgotView) {
    self.forgotView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,self.view.frame.size.width, 200)];
    NSLog(@"Main sub view frame X=-=- %f \n Y == %f",[UIScreen mainScreen].bounds.origin.x,[UIScreen mainScreen].bounds.origin.y);
    self.forgotView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.forgotView];
    
    self.emailTxtField = [[UITextField alloc] init];
    self.emailTxtField.frame = CGRectMake(20, 50,268, 40);
    self.emailTxtField.font = [UIFont systemFontOfSize:15];
    self.emailTxtField.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input_bg.png"]];
    self.emailTxtField.placeholder  = @" Enter Email Address";
    self.emailTxtField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailTxtField.keyboardType = UIKeyboardTypeDefault;
    self.emailTxtField.returnKeyType = UIReturnKeyDone;
    self.emailTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.emailTxtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.emailTxtField.delegate = self;
    self.emailTxtField.backgroundColor = [UIColor redColor];
    [self.forgotView addSubview:self.emailTxtField];

    self.submitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn.frame=CGRectMake(60,150,100,50);
    [self.submitBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitBtn.backgroundColor=[UIColor yellowColor];
    [self.submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.forgotView addSubview:self.submitBtn];
    }else{
        self.forgotView.hidden=NO;
    }
}


-(void)submitAction:(UIButton *)button{
    self.forgotView.hidden = YES;
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
//   http://api.vconnect.globusapps.com/index.php?method=forgotPasswordEmail&Email=ankitsingh@globussoft.com
    NSString *emailText = self.emailTxtField.text;
    
    NSString * urlStr=[NSString stringWithFormat:@"http://api.vconnect.globusapps.com/index.php?method=forgotPasswordEmail&Email=%@",emailText];
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
    
//   [[appDelegate sharedAppDelegate]showToastMessage:responseShow];
    NSLog(@"response is %@",response);

}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
