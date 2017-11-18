//
//  NAOFooterCollectionReusableView.m
//  SudyingGit
//
//  Created by Андрей on 16.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "NAOFooterCollectionReusableView.h"

@implementation NAOFooterCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
        _label = [UILabel new];
        [self addSubview:_label];
    }
    return self;
}

-(void)layoutSubviews{
    self.label.frame = CGRectMake(self.frame.size.width - 200, self.frame.size.height/2, 200, 20);
    self.label.textAlignment = NSTextAlignmentRight;
}

@end
