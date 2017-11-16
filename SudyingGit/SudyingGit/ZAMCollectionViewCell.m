//
//  ZAMCollectionViewCell.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "ZAMCollectionViewCell.h"

@implementation ZAMCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _someLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 130, 25)];
        [self.contentView addSubview:_someLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

}
@end
