//
//  MEKCollectionViewCell.m
//  SudyingGit
//
//  Created by Matvey Kravtsov on 16/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "MEKCollectionViewCell.h"

static const CGFloat MEKLabelHeight = 25.f;

@interface MEKCollectionViewCell ()

@end

@implementation MEKCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"I am label";
        [self.contentView addSubview:_titleLabel];
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(0, 0, 100, MEKLabelHeight);
}

@end
