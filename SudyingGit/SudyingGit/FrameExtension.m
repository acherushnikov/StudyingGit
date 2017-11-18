//
//  NSObject+FrameExtension.m
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 14.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import "FrameExtension.h"

@implementation UIView (FrameExtension)

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    [self setFrame:frame];
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    [self setFrame:frame];
}

@end
