//
//  MapViewController.m
//  TagSpot
//
//  Created by Mat Ryer on 12/06/2013.
//  Copyright (c) 2013 Stretchr LLC. All rights reserved.
//

#import "MapViewController.h"
#import "TagSpot.h"

@interface MapViewController ()

- (void) addTag;

@end

@implementation MapViewController

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
  // Do any additional setup after loading the view from its nib.
    
  [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading];
  
  NSLog(@"TODO: load tags");
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
  
  if (annotation == mapView.userLocation) {
    return nil;
  }
  
  MKPinAnnotationView *view = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
  if (view == nil) {
  
    view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    view.pinColor = MKPinAnnotationColorPurple;
    view.canShowCallout = YES;
    view.animatesDrop = YES;
    
  }

  return view;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  [self addTag];
  return YES;
}

- (void) addTag {
  
  if ([self.tagTextBox.text isEqualToString:@""]) {
    return;
  }
  
  // make a tag
  TagSpot *tagSpot = [[TagSpot alloc] init];
  tagSpot.tagText = self.tagTextBox.text;
  tagSpot.location = self.mapView.userLocation.location;
  
  // add it to the map
  [self.mapView addAnnotation:tagSpot];
  
  // save this somewhere
  NSLog(@"TODO: Save this new tag");
  
  // clear the text box
  [self.tagTextBox setText:@""];

}

#pragma mark - Tag data



@end
