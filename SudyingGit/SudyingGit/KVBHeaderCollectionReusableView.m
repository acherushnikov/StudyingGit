//
//  KVBHeaderCollectionReusableView.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "KVBHeaderCollectionReusableView.h"

@implementation KVBHeaderCollectionReusableView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentRight;
        _label.frame = CGRectMake(self.frame.size.width - 200, 0, 200, 25);
        [self addSubview:_label];
    }
    return self;
}

@end
