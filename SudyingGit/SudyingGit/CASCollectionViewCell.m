//
//  CASCollectionViewCell.m
//  SudyingGit
//
//  Created by Ilya Lunkin on 16/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASCollectionViewCell.h"


@implementation CASCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _textLabel = [UILabel new];
        _textLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 25);
        _textLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_textLabel];
    }
    return self;
}

@end
