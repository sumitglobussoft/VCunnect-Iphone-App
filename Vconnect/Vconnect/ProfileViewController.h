//
//  ProfileViewController.h
//  Vconnect
//
//  Created by Sumit on 12/03/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoundedImageView.h"

@interface ProfileViewController : UIViewController<UIScrollViewDelegate,UITextViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate>{
    
}
@property(nonatomic,strong)UIView * topview, * firstview,* thirdview,*secondview,*fourthview;
@property(nonatomic,strong)UIScrollView * scorlView, * scrolBottom;
@property(nonatomic,strong) RoundedImageView *imageView;
@property(nonatomic,strong)UITextField   * nameText,* website,*phono ,* email,* hometown,*location;
@property(nonatomic,assign)CGPoint  orginalscale;
@property(nonatomic,strong)UILabel *memberLabel,*firstNameLabel,*lastNameLabel,*PhoneLabel,*countryLabel,*stateLabel,*cityLabel,*homePhoneLabel,*workPhoneLabel,*cellPhoneLabel;
@end
