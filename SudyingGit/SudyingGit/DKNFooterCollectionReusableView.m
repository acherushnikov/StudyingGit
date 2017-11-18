//
//  DKNFooterCollectionReusableView.m
//  SudyingGit
//
//  Created by Deniz Kaplan on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "DKNFooterCollectionReusableView.h"

@implementation DKNFooterCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self  =  [super initWithFrame:frame];
    if (self)
    {
        _textLabel = [UILabel new];
        
        self.textLabel.textColor = UIColor.redColor;
        self.textLabel.frame = CGRectMake(0, 0, 100, 25);
        self.textLabel.textAlignment = NSTextAlignmentRight;
        self.textLabel.text = @"FOOTER";
        
        
        self.backgroundColor = UIColor.blueColor;
        [self addSubview:self.textLabel];
        
        
    }
    return self;
    
}
@end
