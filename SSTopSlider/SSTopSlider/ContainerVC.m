//
//  ContainerVC.m
//  SSTopSlider
//
//  Created by Susim on 10/1/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

#import "ContainerVC.h"

@interface ContainerVC ()

@end

@implementation ContainerVC

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)refreshWithDataSource:(id)object {
    NSLog(@"Container");
}

@end
