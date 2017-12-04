//
//  DTMPersonTableViewCell.m
//  SudyingGit
//
//  Created by user on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "DTMPersonTableViewCell.h"

static const CGSize DTMPersonPhotoSize = {50.f, 50.f};
static const CGFloat DTMElementOffset = 10.f;
static const CGFloat DTMLabelHeight = 20.f;

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
        
        _elementsOffset = DTMElementOffset;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.personPhotoImageView.frame = CGRectMake(DTMElementOffset, (CGRectGetHeight(self.frame) - DTMPersonPhotoSize.height)/2, DTMPersonPhotoSize.width, DTMPersonPhotoSize.height);
    
    self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + DTMElementOffset, DTMElementOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame) - DTMElementOffset *3, DTMLabelHeight);
    
    self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + DTMElementOffset, CGRectGetMaxY(self.firstNameLabel.frame) + DTMElementOffset, CGRectGetWidth(self.firstNameLabel.frame), DTMLabelHeight);
    
    CGSize detailTextLabelSize = [self.descriptionLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
    
    self.descriptionLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + DTMElementOffset, CGRectGetMaxY(self.lastNameLabel.frame) + DTMElementOffset, CGRectGetWidth(self.firstNameLabel.frame), detailTextLabelSize.height);
    self.widthOfDescriptionLabel = self.descriptionLabel.frame.size.width;
}

- (CGFloat)cellHeight
{
    CGFloat height = CGRectGetMaxY(self.descriptionLabel.frame) + DTMElementOffset;
    return height;
}

#pragma mark - animation



@end
