//
//  TouchView.m
//  SudyingGit
//
//  Created by Anton on 20/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self];
    NSLog(@"Touch has been started in x:%f y:%f",location.x, location.y);
    
}


@end
