//
//  DKNHeaderCollectionReusableView.m
//  SudyingGit
//
//  Created by Deniz Kaplan on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "DKNHeaderCollectionReusableView.h"

@implementation DKNHeaderCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self  =  [super initWithFrame:frame];
    if (self)
    {
        _textLabel = [UILabel new];
      
        self.textLabel.textColor = UIColor.redColor;
        self.textLabel.frame = CGRectMake(200, 20, 150, 50);
        self.textLabel.text = @"HEADER";
        self.textLabel.textAlignment = NSTextAlignmentRight;
        
        
        self.backgroundColor = UIColor.greenColor;
        [self addSubview:self.textLabel];
        
        
    }
    return self;
    
}



@end
