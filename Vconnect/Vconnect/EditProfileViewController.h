//
//  EditProfileViewController.h
//  Vconnect
//
//  Created by Sumit on 16/04/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>{
       
    UILabel *selectStateLbl;
    UILabel *pinCodeLbl;
    UILabel *loanAmountLbl;
    UILabel *fixedRatesLbl;
    UILabel *purchaseLbl;
    UILabel *stateLabel;
    UILabel *cityLabel;
    UILabel *countryLabel;
   
}

@property(nonatomic,strong) UIScrollView *scrollView;
//UIButton Object
@property(nonatomic,strong)UIButton *backButton;

//TextField Object
@property(nonatomic,strong)UITextField *loanAmount;
@property(nonatomic,strong)UITextField *zipCode;
@property(nonatomic,strong)UITextField *stateTextField;
@property(nonatomic,strong)UITextField *lengthTextField;
@property(nonatomic,strong)UITextField *refinanceTextField;

@property(nonatomic,strong)UITextField *stateField;
@property(nonatomic,strong)UITextField *countryField;
@property(nonatomic,strong)UITextField  *cityField;

@end
