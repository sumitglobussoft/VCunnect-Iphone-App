//
//  CalendarViewController.m
//  Vconnect
//
//  Created by Sumit on 09/02/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "CalendarViewController.h"
#import "TableViewCell.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController
@synthesize scrollView,eventTableView,topView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.delegate=self;
    self.scrollView.backgroundColor=[UIColor clearColor];
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 700)];
    [self.view addSubview:self.scrollView];
    
    topView = [[UIView alloc]init];
    topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    topView.backgroundColor = [UIColor colorWithRed:(CGFloat)225/255 green:(CGFloat)225/255 blue:(CGFloat)225/255 alpha:1];
    [self.scrollView addSubview:topView];
    
    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.frame=CGRectMake(10, 10, 150, 30);
    dateLabel.text = @"Saturday 18th April";
    [topView addSubview:dateLabel];
    
    
    eventTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,40, self.view.frame.size.width, self.view.frame.size.height-40)];
    eventTableView.delegate=self;
    eventTableView.dataSource=self;
    eventTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:eventTableView];

    
    submitBtn = [[UIButton alloc]init];
    submitBtn.frame = CGRectMake(100, self.view.frame.size.height-120, 30, 30);
    [submitBtn addTarget:self action:@selector(submitClicked) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.backgroundColor = [UIColor redColor];
    //    [btn2 setImage:[UIImage imageNamed:@"select_normal.png"] forState:UIControlStateNormal];
    //[self.view addSubview:submitBtn];

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
#pragma mark -
#pragma mark UITableViewDelegates

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //  NSString *videoArray =  [[self.liveVideoArray objectAtIndex:indexPath.row]objectForKey:@"arr"];
    
  //  if(self.segmentControl.selectedSegmentIndex==0){
        cell.title.text=@"4 am";
        cell.forShowingTime.text=@"Vcunnect API Testing Sandbox";
        cell.label3.text=@"New Event";
        cell.headerLabel.text = @"2 Developers";
        cell.imageView.image=[UIImage imageNamed:@"hel.jpeg"];
        cell.imageView.backgroundColor=[UIColor redColor];
//        cell.liveNowimageView.hidden=NO;
//    }else{
//        cell.title.text=@"Recent Video";
//        cell.forShowingTime.text=@"   14 hrs";
//        cell.imageView.image=[UIImage imageNamed:@"hel.jpeg"];
//        cell.liveNowimageView.hidden=NO;
//    }
    
    
    // [button addTarget:self action:@selector(performExpand: event :) forControlEvents:UIControlEventTouchUpInside];
   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"return");
    NSLog(@"indexof row %d",indexPath.row);
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
