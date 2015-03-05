//
//  FirstVC.m
//  UberValetService
//
//  Created by Globussoft 1 on 10/27/14.
//  Copyright (c) 2014 Globussoft 1. All rights reserved.
//

#import "FirstVC.h"
#import "RoundedImageView.h"
#import "AppDelegate.h"
#import "GameState.h"



@interface FirstVC ()
{
}

@end

@implementation FirstVC
@synthesize texturedBackgroundView,imageView ;

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    
    if (copy) {
     
       
    }
    
    return copy;
}

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
    self.view.backgroundColor = [UIColor colorWithRed:(CGFloat)248/255 green:(CGFloat)216/255 blue:(CGFloat)141/255 alpha:1];
    
    self.texturedBackgroundView=[[UIView alloc]init];
    self.texturedBackgroundView.frame = CGRectMake(0,0, self.view.frame.size.width, 40);
    self.texturedBackgroundView.backgroundColor= [UIColor colorWithRed:(CGFloat)215/255 green:(CGFloat)229/255 blue:(CGFloat)178/255 alpha:1];
    [self.view addSubview:self.texturedBackgroundView];
    
    self.imageView = [[RoundedImageView alloc] init ];
    self.imageView.frame=CGRectMake(10, 0, 40, 40);
    self.imageView.image=[UIImage imageNamed:@"plus_icon.png"];
    [self.imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageGestureRecognizer:)];
    [self.imageView addGestureRecognizer:gesture];
    [self.texturedBackgroundView addSubview:self.imageView];

  
       
    // Do any additional setup after loading the view.
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
