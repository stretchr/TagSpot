//
//  MapViewController.h
//  TagSpot
//
//  Created by Mat Ryer on 12/06/2013.
//  Copyright (c) 2013 Stretchr LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, UITextFieldDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (weak, nonatomic) IBOutlet UITextField *tagTextBox;

@end
