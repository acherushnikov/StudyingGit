//
//  CASCollectionReusableView.m
//  SudyingGit
//
//  Created by Ilya Lunkin on 16/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASCollectionReusableView.h"

@implementation CASCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _lolLabel = [UILabel new];
        _lolLabel.textAlignment = NSTextAlignmentRight;
        _lolLabel.textColor = UIColor.whiteColor;
        _lolLabel.frame = CGRectMake(CGRectGetWidth(frame) - 200, 0, 200, 25);
        [self addSubview:_lolLabel];
    }
    return self;
}

@end
