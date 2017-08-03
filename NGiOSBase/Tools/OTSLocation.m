//
//  OTSLocation.m
//  OneStoreFramework
//

#import "OTSLocation.h"
#import <CoreLocation/CoreLocation.h>

#import "OTSFuncDefine.h"


@interface OTSLocation ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *clManager;
@property (nonatomic, copy) OTSCLManagerCompleteBlock block;

@end

@implementation OTSLocation

- (id)init
{
    if (self = [super init]) {
        [self setupCL];
    }
    
    return self;
}

- (void)dealloc
{
    _clManager.delegate = nil;
}

- (void)setupCL
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.clManager = [[CLLocationManager alloc] init];
    }
    
    self.clManager.delegate = self;
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0) {
        [self.clManager requestWhenInUseAuthorization];
    }
    
    self.clManager.distanceFilter = 1000.f;
    self.clManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)start
{
    if (self.clManager) {
        [self.clManager startUpdatingLocation];
    }
    else {
        [self locationWithIp];
    }
}

- (void)locationWithIp
{
    [self locationWithCLLocation:nil];
}

- (void)locationWithCLLocation:(CLLocation *)aLocation
{
    [self locationWithCLLocation:aLocation andCLPlacemark:nil];
}

- (void)locationWithCLLocation:(CLLocation *)aLocation andCLPlacemark:(CLPlacemark *)aMark
{
//#warning test
//    if (self.block) {
//        self.block(aMark, @{@"Country":@"中国",@"State":@"上海市",@"City":@"上海市市辖区"}, aLocation);
////        self.block(aMark, @{@"Country":@"中国",@"State":@"河南省",@"City":@"安阳市"}, aLocation);
//        self.block = nil;
//    }
//    //end
    
    if (self.block) {
        self.block(aMark, aMark.addressDictionary, aLocation);
        self.block = nil;
    }
}

- (void)startWithCompleteBlock:(OTSCLManagerCompleteBlock)block
{
    self.block = block;
    [self start];
}

- (void)stop
{
    self.block = nil;
    [self.clManager stopUpdatingLocation];
}

//通过定位信息获取城市信息
- (void)locationToCityName:(CLLocation *)aLocation
{
    WEAK_SELF;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:aLocation completionHandler:^(NSArray *placemark, NSError *error) {
        STRONG_SELF;
        CLPlacemark *mark = nil;
        if (error) {
            NSLog(@"error = %@",error);
            [self locationWithCLLocation:aLocation];
        }
        else {
            mark = [placemark objectAtIndex:0];
            NSLog(@"placemark %@", placemark);
            NSLog(@"mark %@", mark);
            NSLog(@"dict %@", mark.addressDictionary);
            NSLog(@"Country %@", mark.addressDictionary[@"Country"]);
            NSLog(@"State %@", mark.addressDictionary[@"State"]);
            NSLog(@"City %@", mark.addressDictionary[@"City"]);
            
            // 大量定位信息的tracker埋点
            if (mark.addressDictionary[@"State"]&&mark.addressDictionary[@"City"]&&mark.addressDictionary[@"SubLocality"]&&mark.addressDictionary[@"Thoroughfare"]&&mark.addressDictionary[@"SubThoroughfare"]){
                
            }

            [self locationWithCLLocation:aLocation andCLPlacemark:mark];
        }
    }];
}

# pragma mark - CLLocationManagerDelegate

//ios5
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"newLocation = %@",newLocation);
    [self locationToCityName:newLocation];
}

//ios 6 up
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"locations = %@",locations);
    CLLocation *newLocation = locations[0];
    [self locationToCityName:locations[0]];
}

//当位置获取或更新失败会调用的方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self locationWithIp];
}

@end
