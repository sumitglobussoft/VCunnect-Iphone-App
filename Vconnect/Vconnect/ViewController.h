//
//  ViewController.h
//  Vconnect
//
//  Created by Sumit on 09/01/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import  <MapKit/MapKit.h>


@interface ViewController : UIViewController<UITextFieldDelegate,NSURLConnectionDelegate,UIWebViewDelegate,CLLocationManagerDelegate>
{
    NSMutableData *_responseData;
    NSMutableData  *mutableData;
    UIWebView *webView1;
    UIWebView *webView2;
    UIWebView *forgotWebview;
    NSMutableArray *urlParts;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@property(nonatomic,strong)UITextField *emailField;
@property (nonatomic,strong)UITextField *passwordField;
@property(nonatomic,strong)UIButton *emailLoginButton;
@property(nonatomic,strong)UIButton  *forgetPswdButton;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *meetupButton;
@property(nonatomic,strong) UIButton *eventBriteButton;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong) UIButton *backButton1 ; 
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)UIButton *rememberMeBtn;
@property(nonatomic,strong)UILabel *rememberMeLbl;
@property(nonatomic,strong)UIView * forgotView;
@property(nonatomic,strong)UITextField *emailTxtField;
@property(nonatomic,strong)UIButton *submitBtn;
@property(nonatomic,strong) NSString * locationName, * Area;

@end

