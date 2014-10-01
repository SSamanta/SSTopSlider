//
//  TopSliderVC.m
//  SSTopSlider
//
//  Created by Susim on 10/1/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

#import "TopSliderVC.h"

@interface TopSliderVC ()
- (IBAction)tabOneTapped:(id)sender;
- (IBAction)tabTwoTapped:(id)sender;
@end

@implementation TopSliderVC

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)complationOnEvent:(TopSliderEventHandler)handler {
    topSliderEventHandler =  handler;
}
- (IBAction)tabOneTapped:(id)sender {
    topSliderEventHandler(1,nil);
}
- (IBAction)tabTwoTapped:(id)sender {
    topSliderEventHandler(2,nil);
}
@end
