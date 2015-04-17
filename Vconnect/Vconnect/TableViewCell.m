//
//  TableViewCell.m
//  NextInsure
//
//  Created by Sumit on 06/02/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    // Configure the view for the selected state
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 80, 20)];
    self.title.textColor = [UIColor blackColor];
    self.title.textAlignment = NSTextAlignmentCenter;
   self.title.font = [UIFont fontWithName:@"Arial" size:14.0f];
        
    self.forShowingTime = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 200, 20)];
    self.forShowingTime.textColor = [UIColor blackColor];
    self.forShowingTime.textAlignment = NSTextAlignmentCenter;
    self.forShowingTime.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 150, 20)];
    self.label3.textColor = [UIColor blackColor];
    self.label3.textAlignment = NSTextAlignmentCenter;
    [self.label3 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
   // self.label3.font = [UIFont fontWithName:@"Arial" size:12.0f];

    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 55, 150, 20)];
    self.headerLabel.textColor = [UIColor blackColor];
    self.headerLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
        
      //  self.imageView.frame = CGRectMake(0, 20, 20, 20);

        [self addSubview:self.title];
        [self addSubview:self.forShowingTime];
        [self addSubview:self.label3];
        [self addSubview:self.headerLabel];
    }
     return self;
}

@end
