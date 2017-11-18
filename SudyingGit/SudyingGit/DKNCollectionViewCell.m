//
//  DKNCollectionViewCell.m
//  SudyingGit
//
//  Created by Deniz Kaplan on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "DKNCollectionViewCell.h"

@implementation DKNCollectionViewCell




-(instancetype)initWithFrame:(CGRect)frame
{
  self  =  [super initWithFrame:frame];
    if (self)
    {
        _textLabel = [UILabel new];
        self.frame = CGRectMake(0, 0, 150, 150);
        self.textLabel.textColor = UIColor.redColor;
        self.textLabel.frame = self.frame;
         self.textLabel.text = @"HELLO";
        
    
        self.backgroundColor = UIColor.greenColor;
            [self.contentView addSubview:self.textLabel];
       
    
    }
    return self;
    
}
@end
