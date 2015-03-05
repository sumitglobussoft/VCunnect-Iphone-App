//
//  CalendarViewController.m
//  Vconnect
//
//  Created by Sumit on 09/02/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    submitBtn = [[UIButton alloc]init];
    submitBtn.frame = CGRectMake(100, self.view.frame.size.height-120, 30, 30);
    [submitBtn addTarget:self action:@selector(submitClicked) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.backgroundColor = [UIColor redColor];
    //    [btn2 setImage:[UIImage imageNamed:@"select_normal.png"] forState:UIControlStateNormal];
    [self.view addSubview:submitBtn];

    // Do any additional setup after loading the view.
}

-(void)submitClicked{
    
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    
    NSString *locality = [[NSUserDefaults standardUserDefaults]objectForKey:@"locality"];
    NSString *country = [[NSUserDefaults standardUserDefaults]objectForKey:@"country"];
     NSString *userId = [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"];
    
    NSString * urlStr=[NSString stringWithFormat:@"http://api.vconnect.globusapps.com/index.php?method=updateUserData&UserName=vinayaka&Location=%@&City=%@&Language=english& Gender=Male&Bio=qwerty&UserId=%@&BirthDate=17jan1991",country,locality,userId];
    
    NSString * urlStr2=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url=[NSURL URLWithString:urlStr2];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
    NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    
    
    if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"reponse is %@",response);
    
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
