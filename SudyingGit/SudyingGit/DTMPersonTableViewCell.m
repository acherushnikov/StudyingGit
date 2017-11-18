//
//  DTMPersonTableViewCell.m
//  SudyingGit
//
//  Created by user on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "DTMPersonTableViewCell.h"

static const CGSize DTMPersonSize = {50.f, 50.f};
static const CGFloat DTMElementOfOffset = 10.f;

@implementation DTMPersonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        _firstNameLabel = [UILabel new];
        _firstNameLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_firstNameLabel];
        
        _lastNameLabel = [UILabel new];
        _lastNameLabel.textColor = [UIColor greenColor];
        _lastNameLabel.font = [UIFont systemFontOfSize:20.f];
        [self.contentView addSubview:_lastNameLabel];
        
        _descriptionLabel = [UILabel new];
        _descriptionLabel.textColor = [UIColor redColor];
        _descriptionLabel.numberOfLines = 0;
        [self.contentView addSubview:_descriptionLabel];
        
        _personPhotoImageView = [UIImageView new];
        _personPhotoImageView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_personPhotoImageView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.personPhotoImageView.frame = CGRectMake(10, (CGRectGetHeight(self.frame)/2 - 50)/2, 50, 50);
    
    self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + DTMElementOfOffset, DTMElementOfOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame) - DTMElementOfOffset *3, 20);
    
    self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + DTMElementOfOffset, CGRectGetMaxY(self.firstNameLabel.frame) + DTMElementOfOffset, CGRectGetWidth(self.firstNameLabel.frame), 20);
    
}


@end
