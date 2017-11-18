//
//  MVMCollectionReusableView.m
//  SudyingGit
//
//  Created by Вероника on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "MVMCollectionReusableView.h"

@implementation MVMCollectionReusableView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if(self)
    {
        _label = [UILabel new];
        _label.frame = CGRectMake(CGRectGetMaxX(frame) - CGRectGetWidth(frame) + 100, 0, CGRectGetWidth(frame) - 100, CGRectGetHeight(frame) - 5);
        _label.textAlignment = NSTextAlignmentRight;
        _label.backgroundColor = [UIColor yellowColor];
        _label.textColor = [UIColor blueColor];
        _label.text = @"123";
        [self addSubview:_label];
    }
    
    return self;
    
}
@end
