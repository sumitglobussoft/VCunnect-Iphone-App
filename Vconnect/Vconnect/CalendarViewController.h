//
//  CalendarViewController.h
//  Vconnect
//
//  Created by Sumit on 09/02/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    UIButton *submitBtn ;
}
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIView *topView;
@property(nonatomic,strong) UITableView *eventTableView;


@end
