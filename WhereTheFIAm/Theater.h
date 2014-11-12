//
//  Theater.h
//  WhereTheFIAm
//
//  Created by Marc Boquet Bertran on 12/11/14.
//  Copyright (c) 2014 Marc Boquet Bertran. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Theater : NSObject <MKAnnotation>

@property BOOL hasSubtitles;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@end
