//
//  AppDelegate.h
//  Vconnect
//
//  Created by Sumit on 09/01/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegateFirstVC.h"
#import "HomeVC.h"
#import "FirstVC.h"
#import "GroupViewController.h"
#import "CalendarViewController.h"
#import "MessageViewController.h"
#import "RefreshViewController.h"
#import "InterestViewController.h"
#import "SettingsViewController.h"
#import "MBProgressHUD.h"
#import "ProfileViewController.h"

@class AppDelegateFirstVC;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>{
     MBProgressHUD *HUD;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AppDelegateFirstVC *viewController ;
@property (strong,nonatomic) UINavigationController *navigationController;
+(AppDelegate *)sharedAppDelegate;

-(void) showHUDLoadingView:(NSString *)strTitle;
-(void) hideHUDLoadingView;
-(void)showToastMessage:(NSString *)message;

@end

