//
//  HomeVC.m
//  UberValetService
//
//  Created by Globussoft 1 on 10/27/14.
//  Copyright (c) 2014 Globussoft 1. All rights reserved.
//

#import "HomeVC.h"
#import "RoundedImageView.h"


@interface HomeVC ()

@end

@implementation HomeVC

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
    
    self.view.backgroundColor = [UIColor blackColor];
    self.mainsubView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSLog(@"Main sub view frame X=-=- %f \n Y == %f",[UIScreen mainScreen].bounds.origin.x,[UIScreen mainScreen].bounds.origin.y);
    self.mainsubView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainsubView];

    CGFloat hh;
    CGRect frame_b;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        hh = 75;
        frame_b = CGRectMake(68, 30, 45, 25);
            //         frame_b = CGRectMake(self.view.frame.size.width-65, 30, 45, 25);
    }
    else{
        hh = 55;
            //        frame_b = CGRectMake(self.view.frame.size.width-65, 20, 45, 25);
        frame_b = CGRectMake(25, 20, 45, 25);
    }
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, hh);
    
    self.headerView = [[UIView alloc] initWithFrame:frame];
  //  self.headerView.backgroundColor = [UIColor darkTextColor];
    self.headerView.backgroundColor = [UIColor colorWithRed:(CGFloat)26/255 green:(CGFloat)147/255 blue:(CGFloat)131/255 alpha:1];
    [self.mainsubView addSubview:self.headerView];

    frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    self.contentContainerView = [[UIView alloc] initWithFrame:frame];
    self.contentContainerView.backgroundColor = [UIColor grayColor];
    self.contentContainerView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.mainsubView addSubview:self.contentContainerView];

    self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menuButton.frame = frame_b;
    self.menuButton.titleLabel.font = [UIFont systemFontOfSize:9.0f];
    self.menuButton.titleLabel.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
        //self.menuButton.titleLabel.layer.
    [self.menuButton addTarget:self action:@selector(menuButtonClciked:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    
    [self.headerView addSubview:self.menuButton];
    self.selectedIndex = 0;
////
//
  // [self createMenuTableView];
    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    self.swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.mainsubView addGestureRecognizer:self.swipeGesture];
     self.selectedViewController = [_viewControllers objectAtIndex:1];
   [self updateViewContainer];
    
    // Do any additional setup after loading the view.
}


-(void) handleSwipeGesture:(UISwipeGestureRecognizer *)swipeGesture{
    
    
    /*
    if (self.mainsubView.frame.origin.x<0) {
        
        [UIView animateWithDuration:.5 animations:^{
            self.mainsubView.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
                //              self.mainsubView.frame = CGRectMake(self.view.frame.size.width, 0,self.view.frame.size.width, self.screen_height);
        }completion:^(BOOL finish){
            
            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        }];
        
    }
    else{
        [UIView animateWithDuration:.5 animations:^{
            self.mainsubView.frame = CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height);
                //             self.mainsubView.frame = CGRectMake(80, 0, self.view.frame.size.width, self.screen_height);
        }completion:^(BOOL finish){
            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        }];
    }*/
    
    if (self.mainsubView.frame.origin.x>100 ) {
        
        [UIView animateWithDuration:.5 animations:^{
            self.mainsubView.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
            
        }completion:^(BOOL finish){
            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
            
        }];
    }
    else{
        [UIView animateWithDuration:.5 animations:^{
            self.mainsubView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            
        }completion:^(BOOL finish){
            
            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
            
        }];
    }

}



-(void) createMenuTableView{
    
    if (!self.menuTableView) {
        self.selectedIndex = 0;
        self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 180, self.view.frame.size.height) style:UITableViewStylePlain];
           
        
        self.menuTableView.backgroundColor =  [UIColor colorWithRed:(CGFloat)39/255 green:(CGFloat)39/255 blue:(CGFloat)41/255 alpha:1];
        
        self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.menuTableView.delegate = self;
        self.menuTableView.dataSource = self;
     
    
    }
    else{

          [self.menuTableView reloadData];

    }
   [self.mainsubView addSubview:self.menuTableView];
   
    [UIView animateWithDuration:.5 animations:^{
        self.menuTableView.frame = CGRectMake(0, 50, 180, self.view.frame.size.height);
    }];
    
}

+(HomeVC *)sharedObject
{
    static HomeVC *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[HomeVC alloc] initWithNibName:@"HomeVC" bundle:nil];
    });
    return obj;
}

-(void)removeAllAnnotations
{
//    [self.mapUser removeAnnotations:[self.mapUser annotations]];
}

#pragma mark -
#pragma mark TableView Delegate and DataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section==0) {
    
        return self.viewControllers.count;

}

/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([UIScreen mainScreen].nativeScale == 2.0f){
        if (self.view.frame.size.height>568.0f) {
            NSLog(@"in iPhone6");
            
            return 70;
            
            
        }
        else if ( self.view.bounds.size.height==568.0f) {
            NSLog(@"in iPhone5");
            return 55;
            
            
        }
        else{
            
            NSLog(@"in iPhone4 ");
            return 45;
        }
        
    }
    else if ([UIScreen mainScreen].scale > 2.1f)
    {
        NSLog(@"in iPhone 6 plus");
        return 75;
        
    }
    else
    {
        NSLog(@"in iPad ");
        return 45;
    }
}*/

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIColor *firstColor =  [UIColor colorWithRed:(CGFloat)39/255 green:(CGFloat)39/255 blue:(CGFloat)41/255 alpha:1];
    UIColor *secColor = [UIColor colorWithRed:(CGFloat)48/255 green:(CGFloat)48/255 blue:(CGFloat)50/255 alpha:1];
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = cell.contentView.frame;
    layer.colors = [NSArray arrayWithObjects:(id)firstColor.CGColor,(id)secColor.CGColor, nil];
    
    [cell.contentView.layer insertSublayer:layer atIndex:0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14.0f];
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
        //Check Section
//    NSString * title=[NSString stringWithFormat:@"  %@",[(UIViewController *)[self.viewControllers objectAtIndex:indexPath.row] title]];
    
        //cell.textLabel.text = [NSString stringWithFormat:@"  %@",[(UIViewController *)[self.viewControllers objectAtIndex:indexPath.row] title]];
    cell.textLabel.text =  [(UIViewController *)[self.viewControllers objectAtIndex:indexPath.row]title];
    NSString *cellValue = [(UIViewController *)[self.viewControllers objectAtIndex:indexPath.row]title];
        //adding now
   // NSLog(@"cell value %@",cellValue);
    
    if ([cellValue isEqualToString:@"Profile"]) {
        cell.imageView.image=[UIImage imageNamed:@"profile.png"];
    }
    else if ([cellValue isEqualToString:@"Activity"]) {
        cell.imageView.image=[UIImage imageNamed:@"activity.png"];
    }
    else if ([cellValue isEqualToString:@"Calendar"]) {
        cell.imageView.image=[UIImage imageNamed:@"calendar.png"];
    }
    else if ([cellValue isEqualToString:@"Groups"] ) {
        cell.imageView.image=[UIImage imageNamed:@"group.png"];
    }
    else if ([cellValue isEqualToString:@"Message"]) {
        cell.imageView.image=[UIImage imageNamed:@"message.png"];
    }
    else if ([cellValue isEqualToString:@"Refresh"] ) {
        cell.imageView.image=[UIImage imageNamed:@"refresh.png"];
    }
    else if ([cellValue isEqualToString:@"Interests"]) {
        cell.imageView.image=[UIImage imageNamed:@"interests.png"];
    }
    else if ([cellValue isEqualToString:@"Settings"] ) {
        cell.imageView.image=[UIImage imageNamed:@"settings.png"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.menuTableView && self.menuTableView.frame.size.width>0 ) {
        //       self.menuTableView.hidden = YES ;
        
        
        [UIView animateWithDuration:.5 animations:^{
            //            self.menuTableView.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
            //
            //        }completion:^(BOOL finish){
            //            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
            self.menuTableView.frame = CGRectMake(0, 50, 0, self.view.frame.size.height);
        }];
    }
    else{
        [self createMenuTableView];
            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    }

    NSLog(@"indexPath.row is %ld",(long)indexPath.row);
    NSLog(@"self.viewControllers.count is %lu",(unsigned long)self.viewControllers.count);
    if (indexPath.row+1 < self.viewControllers.count) {
        
       // NSString *str=    [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
       // if ([str isEqualToString:@"NO"]) {
        [UIView animateWithDuration:.5 animations:^{
            
            self.mainsubView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            
            
        }completion:^(BOOL finished){
            //After completion
            //first check if new selected view controller is equals to previously selected view controller
            //self.isSignIn=YES;
            
            
            UIViewController *newViewController = [_viewControllers objectAtIndex:indexPath.row];
            //            _selectedSection = indexPath.section;
            _selectedIndex = indexPath.row;
            [self addChildViewController:newViewController];
            [self getSelectedViewControllers:newViewController];
        }];
      //  }

    }else{
        //Log out functionality.
//        [[User currentUser]logout];
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isLogin"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [UIView animateWithDuration:.5 animations:^{
            self.mainsubView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }completion:^(BOOL finished){
            
            [self removeFromParentViewController];
            AppDelegateFirstVC *loginVC=[[AppDelegateFirstVC alloc] init];
            loginVC.title=@"Login";
            [self presentViewController:loginVC animated:YES completion:nil];
            }];
        
}

    
            //Dismiss Menu TableView with Animation
}//Index Path 1 End




-(void) getSelectedViewControllers:(UIViewController *)newViewController{
        // selected new view controller
    UIViewController *oldViewController = _selectedViewController;
    
    if (newViewController != nil) {
        [oldViewController.view removeFromSuperview];
        _selectedViewController = newViewController;
                [self updateViewContainer];
            //Check Delegate assign or not
    }
}

-(void) updateViewContainer{
    self.selectedViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        NSLog(@"View Height  = %f",self.contentContainerView.frame.size.height);
    self.selectedViewController.view.frame = self.contentContainerView.bounds;
         NSLog(@"Selected view frame = %f",self.selectedViewController.view.frame.size.width);
       NSLog(@"Selected View Height = %f",self.selectedViewController.view.frame.size.height);
    self.menuLabel.text = self.selectedViewController.title;
    NSLog(@"menu label -=- %@",self.menuLabel.text);
    NSLog(@"self.selectedViewController.view is %@",self.selectedViewController.view);
    [self.contentContainerView addSubview:self.selectedViewController.view];
}


-(void) menuButtonClciked:(id)sender{
   
   if (self.menuTableView && self.menuTableView.frame.size.width>0 ) {
//       self.menuTableView.hidden = YES ;
       
      
            [UIView animateWithDuration:.5 animations:^{
//            self.menuTableView.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
//            
//        }completion:^(BOOL finish){
//            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
          self.menuTableView.frame = CGRectMake(0, 50, 0, self.view.frame.size.height);
      }];
   }
   else{
                   [self createMenuTableView];

//            self.swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
//            
//}];
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
