//
//  ZAMCollectionReusableViewHeader.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "ZAMCollectionReusableViewHeader.h"

@implementation ZAMCollectionReusableViewHeader
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-120, 0, 120, 25)];
        [self addSubview:_headerLabel];
    }
    return self;
}
@end
