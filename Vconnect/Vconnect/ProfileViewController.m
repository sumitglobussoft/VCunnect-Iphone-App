//
//  ProfileViewController.m
//  Vconnect
//
//  Created by Sumit on 12/03/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "ProfileViewController.h"
#import "LocationSearchVIewController.h"
#import "EditProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize topview,firstview,secondview,thirdview,nameText,email,website,phono,hometown,fourthview,location,memberLabel,firstNameLabel,lastNameLabel,PhoneLabel,countryLabel,stateLabel,cityLabel,homePhoneLabel,workPhoneLabel,cellPhoneLabel;

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(CGFloat)225/255 green:(CGFloat)225/255 blue:(CGFloat)225/255 alpha:1];

    ///TopView
    
    
    topview=[[UIView alloc]initWithFrame:CGRectMake(30, 0, self.view.frame.size.width-60, 150) ];
    topview.backgroundColor=[UIColor colorWithRed:(CGFloat)245/255 green:(CGFloat)245/255 blue:(CGFloat)245/255 alpha:1];
    topview.layer.cornerRadius = 5;
    topview.layer.masksToBounds = YES;
    [self.view addSubview:topview];
    
    
    UILabel *FullNameLabel = [[UILabel alloc]init];
    FullNameLabel.frame = CGRectMake(100, 0, 320, 40);
    FullNameLabel.text = @"Vinayaka S Yattinahalli";
    [topview addSubview:FullNameLabel];
    
    
    firstview=[[UIView alloc]initWithFrame:CGRectMake(30, 160, self.view.frame.size.width-60, self.view.frame.size.height-200) ];
    firstview.layer.cornerRadius = 5;
    firstview.layer.masksToBounds = YES;
    firstview.backgroundColor= [UIColor colorWithRed:(CGFloat)245/255 green:(CGFloat)245/255 blue:(CGFloat)245/255 alpha:1];
    
    [self.view addSubview:firstview];

    
    self.memberLabel = [[UILabel alloc]init];
    self.memberLabel.frame = CGRectMake(0, 0, 250, 40);
    self.memberLabel.text = @"Member since 1 year";
    [firstview addSubview:self.memberLabel];
    
    UIButton *editProfileButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [editProfileButton addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    editProfileButton.backgroundColor = [UIColor redColor];
    [editProfileButton setTitle:@"Edit Profile" forState:UIControlStateNormal];
    editProfileButton.frame = CGRectMake(200.0, 0.0, 50.0, 40.0);
    [firstview addSubview:editProfileButton];
    
    self.firstNameLabel = [[UILabel alloc]init];
    self.firstNameLabel.frame = CGRectMake(10, 30, 250, 30);
    self.firstNameLabel.text = @"First Name";
     [self.firstNameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [firstview addSubview:self.firstNameLabel];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.frame = CGRectMake(10, 70, 250, 20);
    nameLabel.text = @"Vinayaka";
   // nameLabel.font=[UIFont systemFontOfSize:25.0f];
    [firstview addSubview:nameLabel];

    UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(30, 95, self.view.frame.size.width-60, 1)];
    separator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [firstview addSubview:separator];
    
    self.lastNameLabel = [[UILabel alloc]init];
    self.lastNameLabel.frame = CGRectMake(10, 100, 250, 30);
    self.lastNameLabel.text = @"Last Name";
    [ self.lastNameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [firstview addSubview:self.lastNameLabel];
    
    UILabel *lastName =[[UILabel alloc]init];
    lastName.frame = CGRectMake(10, 135, 250, 20);
    lastName.text = @"Yattinahalli";
    // nameLabel.font=[UIFont systemFontOfSize:25.0f];
    [firstview addSubview:lastName];
    
    UIView * separator1= [[UIView alloc] initWithFrame:CGRectMake(0, 160, self.view.frame.size.width-60, 1)];
    separator1.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [firstview addSubview:separator1];

    self.homePhoneLabel = [[UILabel alloc]init];
    self.homePhoneLabel.frame = CGRectMake(10, 162, 250, 30);
    self.homePhoneLabel.text = @"Home Phone";
     [ self.homePhoneLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [firstview addSubview:self.homePhoneLabel];
    
    UILabel *homePhone =[[UILabel alloc]init];
    homePhone.frame = CGRectMake(10, 195, 250, 20);
    homePhone.text = @"080-51458585";
    // nameLabel.font=[UIFont systemFontOfSize:25.0f];
    [firstview addSubview:homePhone];
    
    UIView * separator2= [[UIView alloc] initWithFrame:CGRectMake(0, 220, self.view.frame.size.width-60, 1)];
    separator2.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [firstview addSubview:separator2];
    
    self.workPhoneLabel = [[UILabel alloc]init];
    self.workPhoneLabel.frame = CGRectMake(10, 220, 250, 30);
    self.workPhoneLabel.text = @"Work Phone";
   [ self.workPhoneLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [firstview addSubview:self.workPhoneLabel];
    
    UILabel *workPhone =[[UILabel alloc]init];
    workPhone.frame = CGRectMake(10, 252, 250, 20);
    workPhone.text = @"080-5145858578";
    // nameLabel.font=[UIFont systemFontOfSize:25.0f];
    [firstview addSubview:workPhone];

    
    self.cellPhoneLabel = [[UILabel alloc]init];
    self.cellPhoneLabel.frame = CGRectMake(10, 290, 250, 30);
    self.cellPhoneLabel.text = @"Cell Phone";
    self.cellPhoneLabel.font=[UIFont systemFontOfSize:25.0f];
    //[firstview addSubview:self.cellPhoneLabel];
    
    UILabel *cellPhone =[[UILabel alloc]init];
    cellPhone.frame = CGRectMake(10, 330, 250, 20);
    cellPhone.text = @"9713358770";
    // nameLabel.font=[UIFont systemFontOfSize:25.0f];
   // [firstview addSubview:cellPhone];
   
    self.imageView = [[RoundedImageView alloc] init ];
    self.imageView.frame=CGRectMake(10, 30, 100, 100);
    self.imageView.image=[UIImage imageNamed:@"profile.png"];
    [self.imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageGestureRecognizer:)];
    [self.imageView addGestureRecognizer:gesture];
    [self.topview addSubview:self.imageView];
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
-(void)aMethod:(id)sender{
    NSLog(@"edit profile method called");

    EditProfileViewController *edit=[[EditProfileViewController alloc]init];
    [self.navigationController pushViewController:edit animated:YES];
    
  //  [self.navigationController addChildViewController:edit];
 //   [self.view addSubview:edit.view];
    
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location1 = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"location is %f, %f",location1.x,location1.y );
    
    LocationSearchVIewController *loc = [[LocationSearchVIewController alloc]init];
    [self presentViewController:loc animated:YES completion:nil];
    //Do stuff here...
}


-(void)createEventWebservice{
    
    

}


-(void)imageGestureRecognizer:(UIGestureRecognizer *)gesture{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setDelegate:self];
    [self addChildViewController:imagePicker];
    [self.view addSubview:imagePicker.view];
    //    [self  presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker.view removeFromSuperview];
    //    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
