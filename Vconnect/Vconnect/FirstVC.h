//
//  FirstVC.h
//  UberValetService
//
//  Created by Globussoft 1 on 10/27/14.
//  Copyright (c) 2014 Globussoft 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>

@interface FirstVC : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
     UICollectionView * collectioView;
    NSMutableArray *data;

}
@property(nonatomic,strong)UIView * texturedBackgroundView;
@property(nonatomic,strong)UIImageView *imageView ;

//@property(nonatomic,strong)
@end
