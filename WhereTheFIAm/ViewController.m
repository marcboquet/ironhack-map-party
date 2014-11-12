//
//  ViewController.m
//  WhereTheFIAm
//
//  Created by Marc Boquet Bertran on 12/11/14.
//  Copyright (c) 2014 Marc Boquet Bertran. All rights reserved.
//

#import "ViewController.h"
#import "Theater.h"

@import MapKit;

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.locationManager requestWhenInUseAuthorization];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 20;
    // For GPS and similar
    [self.locationManager startUpdatingLocation];
    //[self.locationManager startMonitoringSignificantLocationChanges];
    
    for (int i = 0; i<100; ++i) {
        Theater *annotation = [[Theater alloc] init];
        [self.mapView addAnnotation:annotation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    
    self.mapView.showsUserLocation = YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", locations);
    
    CLLocation *location = locations.firstObject;
    CLLocationCoordinate2D coord = location.coordinate;
    
    
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 50, 50);
    [self.mapView setRegion:region animated:YES];
}



@end
