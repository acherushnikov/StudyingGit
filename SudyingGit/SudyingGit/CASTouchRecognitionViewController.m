//
//  CASTouchRecognitionViewController.m
//  SudyingGit
//
//  Created by Anton on 20/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASTouchRecognitionViewController.h"
#import "TouchView.h"

@interface CASTouchRecognitionViewController ()

@end

@implementation CASTouchRecognitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TouchView *touchView = [[TouchView alloc]initWithFrame:self.view.frame];
    touchView.center = self.view.center;
    touchView.backgroundColor = [UIColor redColor];
    

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [pan setMinimumNumberOfTouches:1];
    [pan setMaximumNumberOfTouches:1];
    [touchView addGestureRecognizer:pan];
    
    [self.view addSubview:touchView];
    
    
}

-(void)panGesture:(UIPanGestureRecognizer*)sender
{
    [self.view bringSubviewToFront:sender.view];
    
    CGPoint translatedPoint = [sender translationInView:sender.view.superview];
    
    NSLog(@"Translated x:%f y:%f",translatedPoint.x,translatedPoint.y);
    
    CGFloat brightnessAdding = translatedPoint.y/self.view.frame.size.height;
    
    NSLog(@"Brightness adding is %f",brightnessAdding);
    NSLog(@"Height of view is %f",self.view.frame.size.height);
    sender.view.alpha=brightnessAdding;
    
    if(sender.view.alpha<=0)
        sender.view.alpha=0.1;
    if(sender.view.alpha>1)
        sender.view.alpha=1;
    
    NSLog(@"Alpha of view is %f",sender.view.alpha);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
