//
//  LocationHelper.m
//  Tinder
//
//  Created by Elluminati - macbook on 11/04/14.
//  Copyright (c) 2014 AppDupe. All rights reserved.
//

#import "LocationHelper.h"
#import "UtilityClass.h"
#import <UIKit/UIKit.h>
#import "UserDefaultHelper.h"

@implementation LocationHelper

#pragma mark -
#pragma mark - Init

-(id)init
{
    if((self = [super init]))
    {
        //get current location
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
         geocoder = [[CLGeocoder alloc] init];
        
    }
    return self;
}

+(LocationHelper *)sharedObject
{
    static LocationHelper *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[LocationHelper alloc] init];
    });
    return obj;
}

#pragma mark -
#pragma mark - Methods

-(void)locationPermissionAlert
{
    BOOL locationAllowed = [CLLocationManager locationServicesEnabled];
    if (locationAllowed==NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled"
                                                        message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)startLocationUpdating
{
    if (![CLLocationManager locationServicesEnabled])
    {
        [[UtilityClass sharedObject]showAlertWithTitle:@"Location Services disabled" andMessage:@"App requires location services to find your current city weather.Please enable location services in Settings."];
    }
    else{
        [self stopLocationUpdating];
        if (locationManager==nil) {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
         // [locationManager requestAlwaysAuthorization];
//            [self.locationManager startUpdatingLocation];
        }
        [locationManager startUpdatingLocation];
    }
}

-(void)stopLocationUpdating
{
    [locationManager stopUpdatingLocation];
    locationManager.delegate=nil;
    if (locationManager) {
        locationManager=nil;
    }
}

-(void)startLocationUpdatingWithBlock:(DidUpdateLocation)block
{
    blockDidUpdate=[block copy];
    [self startLocationUpdating];
}

#pragma mark -
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    switch([error code])
    {
        case kCLErrorLocationUnknown: // location is currently unknown, but CL will keep trying
            break;
            
        case kCLErrorDenied: // CL access has been denied (eg, user declined location use)
            //message = @"Sorry, flook has to know your location in order to work. You'll be able to see some cards but not find them nearby";
            break;
            
        case kCLErrorNetwork: // general, network-related error
            //message = @"Flook can't find you - please check your network connection or that you are not in airplane mode";
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
//    DLog(@"didUpdateToLocation: %@", currentLocation);
    if (currentLocation != nil) {
        NSString  *strForCurrentLongitude= [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        NSString  *strForCurrentLatitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        [[NSUserDefaults standardUserDefaults]setObject:strForCurrentLatitude forKey:@"latitude"];
        [[NSUserDefaults standardUserDefaults]setObject:strForCurrentLongitude forKey:@"longitude"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        if (blockDidUpdate) {
            blockDidUpdate(currentLocation,oldLocation,nil);
        }
    }else{
        if (blockDidUpdate) {
            blockDidUpdate(currentLocation,oldLocation,[NSError errorWithDomain:@"Location" code:90000 userInfo:[NSDictionary dictionary]]);
        }
    }
    
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
          CLPlacemark    * placemark = [placemarks lastObject];
            NSString *string = [NSString stringWithFormat:@"%@\n%@\n",
                                placemark.locality,
                                placemark.country];
            
            [[NSUserDefaults standardUserDefaults]setObject:placemark.locality forKey:@"locality"];
            [[NSUserDefaults standardUserDefaults]setObject:placemark.country forKey:@"country"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            NSLog(@"string is %@",string);
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
    
    
}

- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
{
//    DLog(@"Paused Updatting");
}

- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
{
//    DLog(@"Resumed Updatting");
}

@end
