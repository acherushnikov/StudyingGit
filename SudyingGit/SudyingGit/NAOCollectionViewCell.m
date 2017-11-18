//
//  NAOCollectionViewCell.m
//  SudyingGit
//
//  Created by Андрей on 16.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "NAOCollectionViewCell.h"

@implementation NAOCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
        _label = [UILabel new];
        [self.contentView addSubview:_label];
    }
    return self;
}

-(void)layoutSubviews{
    self.label.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    self.label.textAlignment = NSTextAlignmentCenter;
}

@end
