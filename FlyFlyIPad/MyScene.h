//
//  MyScene.h
//  test
//

//  Copyright (c) 2014 edu.fontys.sm. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Combo.h"
#import <CoreMotion/CoreMotion.h>

@interface MyScene : SKScene <SKPhysicsContactDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) GameViewController* parentController;
@property (nonatomic) BOOL gameIsActive;
@property (nonatomic) AVAudioPlayer* cuteAudioPlayer;
@property (nonatomic) AVAudioPlayer* hardcoreAudioPlayer;
@property (nonatomic) AVAudioPlayer* notePickupAudioPlayer;
@property (nonatomic) Combo* combo;
@property (strong) CMMotionManager* manager;

- (void) movePlayer:(double)x accelerationY:(double)y accelerationZ:(double)z;
- (void) start;

@end
