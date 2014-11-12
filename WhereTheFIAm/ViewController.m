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

@property (strong, nonatomic) NSMutableArray *theaters;

@end

@implementation ViewController

- (void)reloadTheaters {

    [self.mapView removeAnnotations:self.theaters];
    
    self.theaters = [NSMutableArray array];
    
    for (int i = 0; i<100; ++i) {
        Theater *theater = [[Theater alloc] init];
        [self.theaters addObject:theater];
    }
    [self.mapView addAnnotations:self.theaters];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    
    [self.locationManager requestWhenInUseAuthorization];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 20;
    // For GPS and similar
    [self.locationManager startUpdatingLocation];
    [self reloadTheaters];
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
    
    
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
}


- (IBAction)partyButtonPressed {
    [self reloadTheaters];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    } else if ([annotation isKindOfClass:[Theater class]]) {
        Theater *theater = annotation;
        
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"NormalPin"];
        
        annotationView.canShowCallout = YES;
        //[annotationView setAnimatesDrop:YES];
        [annotationView setPinColor:theater.color];
        
        return annotationView;
    } else {
        return nil;
    }
}

@end
