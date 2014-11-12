//
//  Theater.m
//  WhereTheFIAm
//
//  Created by Marc Boquet Bertran on 12/11/14.
//  Copyright (c) 2014 Marc Boquet Bertran. All rights reserved.
//

#import "Theater.h"

@interface Theater ()

@property CLLocationCoordinate2D realCoordinate;


@end

@implementation Theater

- (instancetype)init {
    self = [super init];
    if (self) {
        self.realCoordinate = CLLocationCoordinate2DMake(41.95 + (arc4random() % 1000) / 10000.0, 1.95 + (arc4random() % 1000) / 10000.0 );
        
        self.color = arc4random() % 3;
    }
    return self;
}

- (CLLocationCoordinate2D) coordinate {
    return self.realCoordinate;
}

- (NSString *) title {
    return @"Over here";
}

- (NSString *) subtitle {
    return @"Not really";
}

@end
