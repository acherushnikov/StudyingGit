//
//  ZAMCollectionReusableViewFooter.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "ZAMCollectionReusableViewFooter.h"

@implementation ZAMCollectionReusableViewFooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-120, 0, 120, 25)];
        [self addSubview:_footerLabel];
    }
    return self;
}
@end
