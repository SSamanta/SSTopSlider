//
//  MainVC.m
//  SSTopSlider
//
//  Created by Susim on 10/1/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

#import "MainVC.h"
#import "TopSliderVC.h"
#import "ContainerVC.h"

@interface MainVC ()
@property (nonatomic) TopSliderVC *topSliderVC;
@property (nonatomic) ContainerVC *containerVC;
@end

@implementation MainVC

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
    [self setTopSliderAndContainerLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark View Layout Methods

- (void)setTopSliderAndContainerLayout {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self.topSliderVC = [storyBoard instantiateViewControllerWithIdentifier:@"TopSliderVC"];
    self.containerVC = [storyBoard instantiateViewControllerWithIdentifier:@"ContainerVC"];
    self.topSliderVC.view.frame = CGRectMake(0, 0, 1024, 200);
    self.containerVC.view.frame = CGRectMake(0, 200, 1024, 768);
    [self addPanGesture];
    [self.topSliderVC complationOnEvent:^(NSUInteger eventType, id object) {
        [self.containerVC refreshWithDataSource:object];
    }];
    [self.view addSubview:self.topSliderVC.view];
    [self.view addSubview:self.containerVC.view];
}
- (void)addPanGesture {
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGestureRecognizer.minimumNumberOfTouches = 1.0;
    self.view.userInteractionEnabled = YES;
    [self.containerVC.view addGestureRecognizer:panGestureRecognizer];
}
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x, recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
    CGRect frame = self.containerVC.view.frame;
    if (frame.origin.y < 0 ) {
        frame.origin.y = 0;
        self.containerVC.view.frame = frame;
    }else if (frame.origin.y >self.topSliderVC.view.frame.size.height) {
        frame.origin.y = self.topSliderVC.view.frame.size.height;
        self.containerVC.view.frame = frame;
    }
    if (recognizer.state == UIGestureRecognizerStateEnded ) {
        CGRect rect = self.topSliderVC.view.frame;
        if (frame.origin.y < rect.size.height /2) {
            frame.origin.y = 0.0;
        }else {
            frame.origin.y = self.topSliderVC.view.frame.size.height;
        }
        [UIView animateWithDuration:0.3 animations:^(void){
        	self.containerVC.view.frame = frame;
        }];
    }
}


@end
