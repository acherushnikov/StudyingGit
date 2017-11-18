//
//  DTMCollectionViewCell.m
//  SudyingGit
//
//  Created by user on 16.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "DTMCollectionViewCell.h"

static const CGSize DTMCollectionCellSize = {150.f, 150.f};

@implementation DTMCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self.aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 25)];
    [self.contentView addSubview:self.aLabel];
    self.aLabel.textColor = [UIColor blackColor];
    self.aLabel.backgroundColor = [UIColor whiteColor];
    
    
    return self;
}

@end
