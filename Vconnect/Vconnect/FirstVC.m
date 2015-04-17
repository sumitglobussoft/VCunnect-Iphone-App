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
#import "ImageViewCustomCell.h"



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
    
    data = [[NSMutableArray alloc] initWithObjects:@"0", nil];

    self.texturedBackgroundView=[[UIView alloc]init];
    self.texturedBackgroundView.frame = CGRectMake(0,0, self.view.frame.size.width, 40);
    self.texturedBackgroundView.backgroundColor= [UIColor colorWithRed:(CGFloat)215/255 green:(CGFloat)229/255 blue:(CGFloat)178/255 alpha:1];
    [self.view addSubview:self.texturedBackgroundView];
    
    self.imageView = [[RoundedImageView alloc] init ];
    self.imageView.frame=CGRectMake(10, 0, 40, 40);
    self.imageView.image=[UIImage imageNamed:@"profile.png"];
    [self.imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageGestureRecognizer:)];
    [self.imageView addGestureRecognizer:gesture];
    [self.texturedBackgroundView addSubview:self.imageView];

//    [self createEventsWebservice];
    // self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    collectioView=[[UICollectionView alloc] initWithFrame:CGRectMake(0,40, self.view.frame.size.width, self.view.frame.size.height-40) collectionViewLayout:layout];
    [collectioView setDataSource:self];
    [collectioView setDelegate:self];
    [collectioView registerClass:[ImageViewCustomCell class] forCellWithReuseIdentifier:@"cell"];
    [collectioView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    [self.view addSubview:collectioView];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(150, 150)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectioView setCollectionViewLayout:flowLayout];
    collectioView.delegate=self;
    collectioView.dataSource=self;
    [self.view addSubview:collectioView];
        // Do any additional setup after loading the view.
}

-(void)addNewCell:(UISwipeGestureRecognizer *)downGesture {
    
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    //NSString *searchTerm = self.searches[section];
    return data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * identifier=@"cell";
    
    
    ImageViewCustomCell * cell=(ImageViewCustomCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imageView.image=[UIImage imageNamed:@"profile.png"];
    
    if (indexPath.row == 0) {
         cell.imageView.image=[UIImage imageNamed:@"plus_icon.png"];
    }
    return cell;
 
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Indexpath.row %lu",(long)indexPath.row);
    
    if (indexPath.row == 0) {
        NSArray *newData = [[NSArray alloc] initWithObjects:@"otherData", nil];
        [collectioView performBatchUpdates:^{
            int resultsSize = [data count]; //data is the previous array of data
            [data addObjectsFromArray:newData];
            NSMutableArray *arrayWithIndexPaths = [NSMutableArray array];
            
            for (int i = resultsSize; i < resultsSize + newData.count; i++) {
                [arrayWithIndexPaths addObject:[NSIndexPath indexPathForRow:i
                                                                  inSection:0]];
            }
            [collectioView insertItemsAtIndexPaths:arrayWithIndexPaths];
        } completion:nil];

    }
    
}

-(void)createEventsWebservice{
    NSError * error=nil;
    NSURLResponse * urlReponse=nil;
    
  //  http://api.vconnect.globusapps.com/cindex.php?method=InsertEvents&createdby=me&name=ds.&location=bhilai&venuename=test&address1=a&address2=a&city=asd&state=123&country=213&address=qwe&description=wqer&lat=123&lng=213&startdate=213&enddate=123&starttime=123&endtime=12312&organisername=-test&organiseremail=test@test.com&organiserdescription=test&starttimestamp=21312&endtimestamp=213213

    
    NSString * urlStr=[NSString stringWithFormat:@"http://api.vconnect.globusapps.com/cindex.php?method=InsertEvents&createdby=me&name=ds.&location=bhilai&venuename=test&address1=a&address2=a&city=asd&state=123&country=213&address=qwe&description=wqer&lat=123&lng=213&startdate=213&enddate=123&starttime=123&endtime=12312&organisername=-test&organiseremail=test@test.com&organiserdescription=test&starttimestamp=21312&endtimestamp=213213"];
    
    urlStr=[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:50];
    
    
    NSData * data=[ NSURLConnection sendSynchronousRequest:request returningResponse:&urlReponse error:&error];
    
    
    if (data==nil) {
        NSLog(@" no data");
        return;
    }
    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"response %@",response);
    
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
