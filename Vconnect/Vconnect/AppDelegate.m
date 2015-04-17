//
//  AppDelegate.m
//  Vconnect
//
//  Created by Sumit on 09/01/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#import "LocationHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self reacheability];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }

    
    [[LocationHelper sharedObject]startLocationUpdatingWithBlock:^(CLLocation *newLocation, CLLocation *oldLocation, NSError *error)
     {
//                 [self updateLocation];
     }];


  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSString *str=    [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
    
    if ([str isEqualToString:@"NO" ] || str == nil) {
       
        self.viewController=[[AppDelegateFirstVC alloc] init];
        self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.viewController];
        self.navigationController.navigationBarHidden=YES;
        self.navigationController.delegate = self;
        
        self.window.rootViewController=self.navigationController ;
    }
    else{
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
        
        HomeVC *homeVC=[[HomeVC alloc] init];
        homeVC.viewControllers = @[prof,firstVC,calendar,group,message,refresh,interest,settings];
        
        
        self.navigationController = [[UINavigationController alloc]initWithRootViewController:homeVC];
        self.navigationController.delegate = self;

        self.window.rootViewController=self.navigationController ;
    }
    [self.window makeKeyAndVisible];
  
    return YES;
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"notification %@",userInfo);
    
}


#pragma Reacheability

-(void)reacheability
{
    // NSLog(@"Rechability");
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    BOOL networkStatus = NO;
    
    if(status == NotReachable)
    {
        // NSLog(@"stringgk////");
        networkStatus = NO;
    }
    else if (status == ReachableViaWiFi)
    {
        // NSLog(@"reachable");
        networkStatus = YES;
        
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
        networkStatus = YES;
    }
    else
    {
        networkStatus = NO;
    }
    // Do any additional setup after loading the view.
    
    [[NSUserDefaults standardUserDefaults] setBool:networkStatus forKey:@"CurrentNetworkStatus"];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    //return [FBSession.activeSession handleOpenURL:url];
    
    NSLog(@"url is %@",url);
    
//    [PFFacebookUtils handleOpenURL:url];
//    
////    [FBAppCall handleOpenURL:url sourceApplication:sourceApplication fallbackHandler:^(FBAppCall *call) {
//        NSString *accessToken = call.accessTokenData.accessToken;
//        [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:@"Facebook Access Token"];
//        NSLog(@"Access Token = %@",call.accessTokenData.accessToken);
//        NSLog(@"App Link Data = %@",call.appLinkData);
//        NSLog(@"call == %@",call);
//        
//        if (call.appLinkData && call.appLinkData.targetURL) {
//            
//            //[self openSessionWithLoginUI:8 withParams:nil];
//            //            [[NSNotificationCenter defaultCenter] postNotificationName:FacebookRequestNotification object:call.appLinkData.targetURL];
//        }
    
//    }];
    return YES;
}

+(AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"Url== %@", url);
//    return [FBSession.activeSession handleOpenURL:url];
    return YES;
}

-(void) showHUDLoadingView:(NSString *)strTitle
{
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
    [self.window addSubview:HUD];
    //HUD.delegate = self;
    //HUD.labelText = [strTitle isEqualToString:@""] ? @"Loading...":strTitle;
    HUD.detailsLabelText=[strTitle isEqualToString:@""] ? @"Loading...":strTitle;
    [HUD show:YES];
}

-(void) hideHUDLoadingView
{
    [HUD removeFromSuperview];
}


-(void)showToastMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window
                                              animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = message;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:3.0];
}

@end
