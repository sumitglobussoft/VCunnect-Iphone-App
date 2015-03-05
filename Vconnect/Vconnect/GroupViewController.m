//
//  GroupViewController.m
//  Vconnect
//
//  Created by Sumit on 09/02/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "GroupViewController.h"
#import "GameState.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    btn2 = [[UIButton alloc]init];
    btn2.frame = CGRectMake(100, self.view.frame.size.height-120, 30, 30);
    [btn2 addTarget:self action:@selector(btn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor redColor];
//    [btn2 setImage:[UIImage imageNamed:@"select_normal.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
   

    
    
    
    // Do any additional setup after loading the view.
}

-(void)btn2Clicked{
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;

    
    NSString *userId = [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"];
    
    NSString * urlStr=[NSString stringWithFormat:@"http://api.vconnect.globusapps.com/index.php?method=profileData&UserId=%@",userId];
    
    urlStr=[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
    NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    
    
    if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"reponse is %@",response);
    
    //     AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    NSString *responseShow = [response objectForKey:@"message"];
    
//    [GameState sharedState].userId = [response objectForKey:@"UserId"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
