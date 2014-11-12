//
//  Theater.m
//  WhereTheFIAm
//
//  Created by Marc Boquet Bertran on 12/11/14.
//  Copyright (c) 2014 Marc Boquet Bertran. All rights reserved.
//

#import "Theater.h"

@implementation Theater

- (CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake(41.95 + (arc4random() % 1000) / 10000.0, 1.95 + (arc4random() % 1000) / 10000.0 );
}

- (NSString *) title {
    return @"Over here";
}

- (NSString *) subtitle {
    return @"Not really";
}

@end
