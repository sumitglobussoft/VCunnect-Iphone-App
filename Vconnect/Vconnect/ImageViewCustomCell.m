//
//  ImageViewCustomCell.m
//  Anypic
//
//  Created by Globussoft 1 on 9/2/14.
//
//

#import "ImageViewCustomCell.h"
@implementation ImageViewCustomCell
@synthesize imageView,eventLbl;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       // self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"adjustBack.png"]];
        self.imageView=[[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 120, 120)];
       
        [self.contentView addSubview:self.imageView];
        
        self.eventLbl=[[UILabel alloc]initWithFrame:CGRectMake(25, 115, 120, 50)];
        self.eventLbl.text=@"event details";
        self.eventLbl.textColor= [UIColor redColor];
        [self.contentView addSubview:self.eventLbl];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
