//
//  KVBCollectionViewCell.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "KVBCollectionViewCell.h"
@interface KVBCollectionViewCell()

@end

@implementation KVBCollectionViewCell


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    if(self){

        _label = [UILabel new];
        _label = [[UILabel alloc]initWithFrame: CGRectMake(0, 0, 100, 25) ];
        [self.contentView addSubview:_label];
        
    }
    return self;
}

@end
