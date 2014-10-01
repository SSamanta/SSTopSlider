//
//  TopSliderVC.h
//  SSTopSlider
//
//  Created by Susim on 10/1/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TopSliderEventHandler) (NSUInteger eventType, id object);
@interface TopSliderVC : UIViewController {
    TopSliderEventHandler topSliderEventHandler;
}
- (void)complationOnEvent:(TopSliderEventHandler)handler;
@end
