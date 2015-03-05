//
//  RegisterVC.h
//  Vconnect
//
//  Created by Sumit on 10/01/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegisterVC : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>{
    
    UIButton *btn1;
    UIButton *btn2;
    NSString *genderText;
 
}

-(void)btn1Clicked;
-(void)btn2Clicked;
@property(nonatomic,strong)UITextField *emailTxtField;
@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UITextField *passwordTxtField;
@property(nonatomic,strong)UITextField *nameTxtField;
@property (nonatomic,strong)UITextField *phoneTxtField;
@property(nonatomic,strong)UITextField *ageTxtField;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIButton *submitSignup;
@property(nonatomic,strong)UILabel *genderLbl;
@property(nonatomic,strong)UILabel *MaleLbl;
@property(nonatomic,strong)UILabel *femaleLbl;
@end
