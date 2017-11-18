//
//  MVMCollectionViewCell.m
//  SudyingGit
//
//  Created by Вероника on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "MVMCollectionViewCell.h"

@implementation MVMCollectionViewCell


-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if(self)
    {
        _label = [UILabel new];
        _label.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 50);
        _label.backgroundColor = [UIColor yellowColor];
        _label.textColor = [UIColor blueColor];
        [self.contentView addSubview:_label];
    }
    
    return self;
    
}
@end
