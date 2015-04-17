//
//  EditProfileViewController.m
//  Vconnect
//
//  Created by Sumit on 16/04/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "EditProfileViewController.h"

@implementation EditProfileViewController
@synthesize zipCode,loanAmount;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:(CGFloat)248/255 green:(CGFloat)216/255 blue:(CGFloat)141/255 alpha:1];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonPressed:)];
    
    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.delegate=self;
    self.scrollView.backgroundColor=[UIColor clearColor];
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 700)];
    [self.view addSubview:self.scrollView];
    
    //----------  UILabel Initialization --------
    selectStateLbl=[[UILabel alloc] init];
    selectStateLbl.backgroundColor=[UIColor clearColor];
    selectStateLbl.text=@"First Name";
    
    
    
    pinCodeLbl=[[UILabel alloc] init];
    pinCodeLbl.backgroundColor=[UIColor clearColor];
    pinCodeLbl.text=@"Last Name";
    
    
    
    loanAmountLbl=[[UILabel alloc] init];
    loanAmountLbl.backgroundColor=[UIColor clearColor];
    loanAmountLbl.text=@"Home Phone";
    
    
    fixedRatesLbl=[[UILabel alloc] init];
    fixedRatesLbl.backgroundColor=[UIColor clearColor];
    fixedRatesLbl.text=@"Work Phone";
    
    
    purchaseLbl=[[UILabel alloc] init];
    purchaseLbl.backgroundColor=[UIColor clearColor];
    purchaseLbl.text=@"Cell Phone";
    
    stateLabel=[[UILabel alloc]init];
    stateLabel.backgroundColor=[UIColor clearColor];
    stateLabel.text=@"State";
    
    cityLabel=[[UILabel alloc]init];
    cityLabel.backgroundColor=[UIColor clearColor];
    cityLabel.text=@"City";
    
    countryLabel=[[UILabel alloc]init];
    countryLabel.backgroundColor=[UIColor clearColor];
    countryLabel.text=@"Country";
    //--------------------------------
    
    // -----   StatePicker Object initalization -----
    
    // ------ stateTextField  Object initialization
    self.stateTextField = [[UITextField alloc] init];
    self.stateTextField.font = [UIFont systemFontOfSize:15];
    self.stateTextField.placeholder  = @" Enter Your FirstName";
    self.stateTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.stateTextField.keyboardType = UIKeyboardTypeDefault;
    self.stateTextField.returnKeyType = UIReturnKeyDone;
    self.stateTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.stateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.stateTextField.delegate = self;
    self.stateTextField.backgroundColor=[UIColor clearColor];
   [self.stateTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scrollView addSubview:self.stateTextField];


    
    // ---- zipCodeTextField  Object initialization
    self.zipCode = [[UITextField alloc] init];
    self.zipCode.font = [UIFont systemFontOfSize:15];
    self.zipCode.placeholder  = @" Enter your Lastname";
    self.zipCode.autocorrectionType = UITextAutocorrectionTypeNo;
    self.zipCode.keyboardType = UIKeyboardTypeDefault;
    self.zipCode.returnKeyType = UIReturnKeyDone;
    self.zipCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.zipCode.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.zipCode.delegate = self;
    self.zipCode.backgroundColor=[UIColor clearColor];
     [self.zipCode setBorderStyle:UITextBorderStyleRoundedRect];
     [self.scrollView addSubview:self.zipCode];
    
    // ----- loanAmount TextField  Object initialization
    self.loanAmount = [[UITextField alloc] init];
    self.loanAmount.font = [UIFont systemFontOfSize:15];
    self.loanAmount.placeholder  = @" Enter Your HomePhone";
    self.loanAmount.autocorrectionType = UITextAutocorrectionTypeNo;
    self.loanAmount.keyboardType = UIKeyboardTypeDefault;
    self.loanAmount.returnKeyType = UIReturnKeyDone;
    self.loanAmount.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.loanAmount.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.loanAmount.delegate = self;
    self.loanAmount.backgroundColor=[UIColor clearColor];
    [self.loanAmount setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scrollView addSubview:self.loanAmount];
    
    // ------ lengthTextField  Object initialization
    self.lengthTextField = [[UITextField alloc] init];
    self.lengthTextField.font = [UIFont systemFontOfSize:15];
    self.lengthTextField.placeholder  = @" Enter Your WorkPhone";
    self.lengthTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.lengthTextField.keyboardType = UIKeyboardTypeDefault;
    self.lengthTextField.returnKeyType = UIReturnKeyDone;
    self.lengthTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.lengthTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.lengthTextField.delegate = self;
    self.lengthTextField.backgroundColor=[UIColor clearColor];
       [self.lengthTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scrollView addSubview:self.lengthTextField];
    
    
    // ------   refinanceTextField object initialization
    self.refinanceTextField = [[UITextField alloc] init];
    self.refinanceTextField.font = [UIFont systemFontOfSize:15];
    self.refinanceTextField.placeholder  = @" Enter Your CellPhone";
    self.refinanceTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.refinanceTextField.keyboardType = UIKeyboardTypeDefault;
    self.refinanceTextField.returnKeyType = UIReturnKeyDone;
    self.refinanceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.refinanceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.refinanceTextField.delegate = self;
    self.refinanceTextField.backgroundColor=[UIColor clearColor];
       [self.refinanceTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scrollView addSubview:self.refinanceTextField];
    
    self.stateField = [[UITextField alloc] init];
  
    self.stateField.font = [UIFont systemFontOfSize:15];
     self.stateField.placeholder  = @" Enter Your state";
    self.stateField.autocorrectionType = UITextAutocorrectionTypeNo;
     self.stateField.keyboardType = UIKeyboardTypeDefault;
     self.stateField.returnKeyType = UIReturnKeyDone;
     self.stateField.clearButtonMode = UITextFieldViewModeWhileEditing;
     self.stateField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
     self.stateField.delegate = self;
    self.stateField.backgroundColor=[UIColor clearColor];
       [self.stateField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scrollView addSubview:self.stateField];
    
    self.cityField = [[UITextField alloc] init];
    
    self.cityField.font = [UIFont systemFontOfSize:15];
    self.cityField.placeholder  = @" Enter Your city";
    self.cityField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.cityField.keyboardType = UIKeyboardTypeDefault;
    self.cityField.returnKeyType = UIReturnKeyDone;
    self.cityField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.cityField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.cityField.delegate = self;
    self.cityField.backgroundColor=[UIColor clearColor];
       [self.cityField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scrollView addSubview:self.cityField];
    
    self.countryField = [[UITextField alloc] init];
        self.countryField.font = [UIFont systemFontOfSize:15];
    self.countryField.placeholder  = @" Enter Your country";
    self.countryField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.countryField.keyboardType = UIKeyboardTypeDefault;
    self.countryField.returnKeyType = UIReturnKeyDone;
    self.countryField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.countryField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.countryField.delegate = self;
    self.countryField.backgroundColor=[UIColor clearColor];
   [self.countryField   setBorderStyle:UITextBorderStyleRoundedRect];
   [self.scrollView addSubview:self.countryField];
    
    
    // ------   SubmitButton Object initalization
    
    // ------ Setting Frames on different iPhone Devices
    if ([UIScreen mainScreen].scale == 2.0f){
        
        if (self.view.frame.size.height>568) {
            NSLog(@"in iPhone6");
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"after_login_bg_750x1334.png"]];
            
          //  ApplicationBtn.frame =CGRectMake(60,20, 278, 59);
            selectStateLbl.frame=CGRectMake(100,self.view.frame.size.height-550, 318, 40);
            self.stateTextField.frame = CGRectMake(25,self.view.frame.size.height-520, 318, 40);//230
            
            pinCodeLbl.frame = CGRectMake(100,self.view.frame.size.height-480, 318, 40);
            self.zipCode.frame = CGRectMake(25,self.view.frame.size.height-450, 318, 40);//370
            
            loanAmountLbl.frame = CGRectMake(100, self.view.frame.size.height-410, 318, 40);
            self.loanAmount.frame = CGRectMake(25, self.view.frame.size.height-380, 318, 40);//300
            
            
            fixedRatesLbl.frame = CGRectMake(100, self.view.frame.size.height-340, 318, 40);
            self.lengthTextField.frame = CGRectMake(25, self.view.frame.size.height-310, 318, 40);//160
            
            purchaseLbl.frame = CGRectMake(100, self.view.frame.size.height-270, 318, 40);
            self.refinanceTextField.frame=CGRectMake(25, self.view.frame.size.height-240, 318, 40);//90
            
            
            
            
        }
        else if (self.view.frame.size.height==568){
            
            NSLog(@"in iPhone5");
             self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"after_login_bg_320x568.png"]];
          //  ApplicationBtn.frame =CGRectMake(20,20, 278, 59);
            selectStateLbl.frame=CGRectMake(30,self.view.frame.size.height-500, 268, 40);
            self.stateTextField.frame = CGRectMake(25,self.view.frame.size.height-470, 268, 40);//230
            
            pinCodeLbl.frame = CGRectMake(30,self.view.frame.size.height-430, 268, 40);
            self.zipCode.frame = CGRectMake(25,self.view.frame.size.height-400, 268, 40);//370
            
            loanAmountLbl.frame = CGRectMake(30, self.view.frame.size.height-360, 268, 40);
            self.loanAmount.frame = CGRectMake(25, self.view.frame.size.height-330, 268, 40);//300
            
            
            fixedRatesLbl.frame = CGRectMake(30, self.view.frame.size.height-290, 268, 40);
            self.lengthTextField.frame = CGRectMake(25, self.view.frame.size.height-260, 268, 40);//160
            
            purchaseLbl.frame = CGRectMake(30, self.view.frame.size.height-220, 268, 40);
            self.refinanceTextField.frame=CGRectMake(25, self.view.frame.size.height-190, 268, 40);//90
            stateLabel.frame =  CGRectMake(30, self.view.frame.size.height-150, 318, 40);
            self.stateField.frame = CGRectMake(25, self.view.frame.size.height-120, 268, 40)   ;
            
            cityLabel.frame = CGRectMake(30, self.view.frame.size.height-80, 318, 40);
            self.cityField.frame = CGRectMake(25, self.view.frame.size.height-50, 268, 40)   ;
            
            countryLabel.frame = CGRectMake(30, self.view.frame.size.height-10, 318, 40);
            self.countryField.frame = CGRectMake(25, self.view.frame.size.height+20, 268, 40)   ;

    }
        else{
            
            NSLog(@"in iPhone4");
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"after_login_bg_320x480.png"]];
            
            selectStateLbl.frame=CGRectMake(30,self.view.frame.size.height-480, 268, 40);
            self.stateTextField.frame = CGRectMake(25,self.view.frame.size.height-450, 268, 40);//230
            
            pinCodeLbl.frame = CGRectMake(30,self.view.frame.size.height-410, 268, 40);
            self.zipCode.frame = CGRectMake(25,self.view.frame.size.height-380, 268, 40);//370
            
            loanAmountLbl.frame = CGRectMake(30, self.view.frame.size.height-340, 268, 40);
            self.loanAmount.frame = CGRectMake(25, self.view.frame.size.height-310, 268, 40);//300
            
            
            fixedRatesLbl.frame = CGRectMake(30, self.view.frame.size.height-270, 268, 40);
            self.lengthTextField.frame = CGRectMake(25, self.view.frame.size.height-240, 268, 40);//160
            
            purchaseLbl.frame = CGRectMake(30, self.view.frame.size.height-200, 268, 40);
            self.refinanceTextField.frame=CGRectMake(25, self.view.frame.size.height-170, 268, 40);//90
            
            stateLabel.frame =  CGRectMake(30, self.view.frame.size.height-130, 318, 40);
            self.stateField.frame = CGRectMake(25, self.view.frame.size.height-100, 268, 40)   ;
            
            cityLabel.frame = CGRectMake(30, self.view.frame.size.height-60, 318, 40);
            self.cityField.frame = CGRectMake(25, self.view.frame.size.height-30, 268, 40)   ;
            
            countryLabel.frame = CGRectMake(30, self.view.frame.size.height+10, 318, 40);
            self.countryField.frame = CGRectMake(25, self.view.frame.size.height+40, 268, 40)   ;
            
        }
    }
    else if([UIScreen mainScreen ].nativeScale>2.1)
    {
        NSLog(@"in iPhone 6 plus");
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"after_login_bg_1242x2208.png"]];
        
        selectStateLbl.frame=CGRectMake(150,self.view.frame.size.height-600, 378, 40);
        self.stateTextField.frame = CGRectMake(25,self.view.frame.size.height-570, 378, 40);//230
        
        pinCodeLbl.frame = CGRectMake(150,self.view.frame.size.height-530, 378, 40);
        self.zipCode.frame = CGRectMake(25,self.view.frame.size.height-500, 378, 40);//370
        
        loanAmountLbl.frame = CGRectMake(150, self.view.frame.size.height-460, 378, 40);
        self.loanAmount.frame = CGRectMake(25, self.view.frame.size.height-430, 378, 40);//300
        
        
        fixedRatesLbl.frame = CGRectMake(150, self.view.frame.size.height-390, 378, 40);
        self.lengthTextField.frame = CGRectMake(25, self.view.frame.size.height-360, 378, 40);//160
        
        purchaseLbl.frame = CGRectMake(120, self.view.frame.size.height-320, 378, 40);
        self.refinanceTextField.frame=CGRectMake(25, self.view.frame.size.height-290, 378, 40);//90
}
    [selectStateLbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
     [pinCodeLbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
     [loanAmountLbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
     [fixedRatesLbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
     [purchaseLbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [stateLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
     [cityLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
    [countryLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
   
    
    [self.scrollView addSubview:selectStateLbl];
    [self.scrollView addSubview:pinCodeLbl];
    [self.scrollView addSubview:loanAmountLbl];
    [self.scrollView addSubview:fixedRatesLbl];
    [self.scrollView addSubview:purchaseLbl];
    [self.scrollView addSubview:stateLabel];
    [self.scrollView addSubview:cityLabel];
    [self.scrollView addSubview:countryLabel];

    
    // Do any additional setup after loading the view.
}
- (void)saveButtonPressed:(id)sender
{
    // Do something when the refresh button is pressed.
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark -
#pragma mark TextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}// return NO to disallow editing.

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
        [textField becomeFirstResponder];
    //if textField is stateTextField return statePicker
    if (textField==self.stateTextField) {
    }
    
    //if textField is lengthTextField return yearPicker
    if (textField==self.lengthTextField) {

    }
    
    //if textField is refinanceTextField return refinancePicker
    if (textField==self.refinanceTextField) {

    }
    
    //if textField is loanAmount return loanPicker
    if (textField==self.loanAmount) {
       
    }
    
    int y=0;
    
    
    if ([UIScreen mainScreen].scale == 2.0f){
        if (self.view.frame.size.height>568){
            if (textField==self.refinanceTextField)
            {
                y=180;
            }
            else if (textField==self.lengthTextField){
                y=120;
            }
            else if (textField==self.loanAmount){
                y=120;
            }
            else if (textField==self.zipCode){
                y=120;
            }
            
        }
        else if (self.view.frame.size.height==568){
            if (textField==self.refinanceTextField)
            {
                y=180;
            }
            else if (textField==self.lengthTextField){
                y=120;
            }
            else if (textField==self.loanAmount){
                y=120;
            }
            else if (textField==self.zipCode){
                y=120;
            }
            
            [self.scrollView setContentOffset:CGPointMake(0, -60) animated:YES];
        }else{
            if (textField==self.refinanceTextField)
            {
                y=180;
            }
            else if (textField==self.lengthTextField){
                y=120;
            }
            else if (textField==self.loanAmount){
                y=120;
            }
            else if (textField==self.zipCode){
                y=60;
            }
            
            
        }
    }
    else if([UIScreen mainScreen ].nativeScale>2.1)
    {
        if (textField==self.refinanceTextField)
        {
            y=180;
        }
        else if (textField==self.lengthTextField){
            y=120;
        }
        else if (textField==self.loanAmount){
            y=120;
        }
        else if (textField==self.zipCode){
            y=120;
        }
        
    }
    
    //scrollView scrollup to display text in TextField when edit begin
    [self.scrollView setContentOffset:CGPointMake(0, y) animated:YES];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    //    self.datePicker.hidden=YES;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    int y=0;
    
    
    if ([UIScreen mainScreen].scale == 2.0f){
        if (self.view.frame.size.height>568){
            if (textField==self.refinanceTextField)
            {
                y=-180;
            }
            else if (textField==self.lengthTextField){
                y=-120;
            }
            else if (textField==self.loanAmount){
                y=-120;
            }
            else if (textField==self.zipCode){
                y=-60;
            }
        }
        else if (self.view.frame.size.height==568){
            
            if (textField==self.refinanceTextField)
            {
                y=-180;
            }
            else if (textField==self.lengthTextField){
                y=-120;
            }
            else if (textField==self.loanAmount){
                y=-120;
            }
            else if (textField==self.zipCode){
                y=-60;
            }
            
        }else{
            
            
            if (textField==self.refinanceTextField)
            {
                y=-180;
            }
            else if (textField==self.lengthTextField){
                y=-120;
            }
            else if (textField==self.loanAmount){
                y=-120;
            }
            else if (textField==self.zipCode){
                //                y=-60;
            }
            
        }
    }
    else if([UIScreen mainScreen ].nativeScale>2.1)
    {
        
        if (textField==self.refinanceTextField)
        {
            y=-180;
        }
        else if (textField==self.lengthTextField){
            y=-120;
        }
        else if (textField==self.loanAmount){
            y=-120;
        }
        else if (textField==self.zipCode){
            y=-60;
        }
        
    }
    
    //scrollView scroll down  after editing  to previous position
    
    [self.scrollView setContentOffset:CGPointMake(0, y) animated:YES];
    
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
