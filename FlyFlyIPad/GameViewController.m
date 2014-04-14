//
//  GameViewController.m
//  FlyFly
//
//  Created by Tim on 26/02/2014.
//  Copyright (c) 2014 edu.fontys.sm. All rights reserved.
//

#import "GameViewController.h"
#import "MyScene.h"
#import "ScoreViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnGameOver;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;

@end

@implementation GameViewController

/*- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    SKView * skView = (SKView *)self.view;
    
    if (!skView.scene) {        
        // Create and configure the scene.
        MyScene * scene = [MyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        scene.parentController = self;
        
        // Present the scene.
        [skView presentScene:scene];
    }
}*/
- (IBAction)btnStartClicked:(id)sender {
    [self.btnStart setHidden:YES];
    MyScene* scene = (MyScene*) self.skView.scene;
    [scene start];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LaunchImage"]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    self.skView = (SKView *)self.view;

    //if (!self.skView.scene) {
        // Create and configure the scene.
        MyScene * scene = [MyScene sceneWithSize:self.skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        scene.parentController = self;
        
        // Present the scene.
        [self.skView presentScene:scene];
    //}
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)showButton
{
    [self.btnGameOver setHidden:NO];
    //[self.skView removeFromSuperview];
    //self.skView = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"navigateToScore"]) {
        ScoreViewController* cont = [segue destinationViewController];
        cont.score = self.score;
        
        [self.skView.scene removeAllActions];
        [self.skView.scene removeAllChildren];
    }
    //[self.view removeFromSuperview];
    //self.view = nil;
    //[self dismissViewControllerAnimated:NO completion:nil];
}

@end
