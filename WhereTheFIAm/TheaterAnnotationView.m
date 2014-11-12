//
//  TheaterAnnotationView.m
//  WhereTheFIAm
//
//  Created by Marc Boquet Bertran on 12/11/14.
//  Copyright (c) 2014 Marc Boquet Bertran. All rights reserved.
//

#import "TheaterAnnotationView.h"
#import "Theater.h"

@interface TheaterAnnotationView ()
@property UIButton *rightButton;
@property UIView *leftView;
@end

@implementation TheaterAnnotationView


- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.image = [[UIImage imageNamed:@"myPin"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        Theater *theater = self.annotation;
        self.leftView.backgroundColor = [theater color];
    }
    return self;
}

- (UIView *)leftCalloutAccessoryView {
    
    return self.leftView;
}

- (UIView *)rightCalloutAccessoryView {
    return self.rightButton;
}




@end
