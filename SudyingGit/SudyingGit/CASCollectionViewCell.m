//
//  CASCollectionViewCell.m
//  SudyingGit
//
//  Created by Ilya Lunkin on 16/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASCollectionViewCell.h"
#import <Masonry/Masonry.h>


@implementation CASCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _textLabel = [UILabel new];
        _textLabel.backgroundColor = UIColor.whiteColor;
        
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top); //with is an optional semantic filler
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(25);
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.width.equalTo(self.contentView.mas_width);
        }];
        
        [self.contentView addSubview:_textLabel];
    }
    return self;
}

- (void)prepareForReuse
{
    self.textLabel = nil;
}

@end
