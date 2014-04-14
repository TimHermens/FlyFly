//
//  InstructionsViewController.m
//  FlyFly
//
//  Created by Tim on 26/02/2014.
//  Copyright (c) 2014 edu.fontys.sm. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@end

@implementation InstructionsViewController

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
    
    self.manager = [[CMMotionManager alloc]init];
    //manager.accelerometerUpdateInterval = .1;
    
    if ([self.manager isAccelerometerAvailable]) {
        NSOperationQueue* queue = [[NSOperationQueue alloc]init];
        [self.manager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                double x = accelerometerData.acceleration.x;
                double y = accelerometerData.acceleration.y;
                double z = accelerometerData.acceleration.z;
                self.labelX.text = [NSString stringWithFormat:@"x: %f", x];
                self.labelY.text = [NSString stringWithFormat:@"y: %f", y];
                self.labelZ.text = [NSString stringWithFormat:@"z: %f", z];
                NSLog(@"test");
                //[self movePlayer:x accelerationX:y accelerationY:z];
            });
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
