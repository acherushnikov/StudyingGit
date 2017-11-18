//
//  MEKPersonTableViewCell.m
//  SudyingGit
//
//  Created by Matvey Kravtsov on 14/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "MEKPersonTableViewCell.h"

static const CGSize MEKPersonPhotoSize = {50.f, 50.f};
static const CGFloat MEKElementsOffset = 10.f;
static const CGFloat MEKLabelHeight = 20.f;

@implementation MEKPersonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _firstNameLabel = [UILabel new];
        _firstNameLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_firstNameLabel];
        
        _lastNameLabel = [UILabel new];
        _lastNameLabel.textColor = [UIColor blueColor];
        _lastNameLabel.font = [UIFont systemFontOfSize:20.0f];
        [self.contentView addSubview:_lastNameLabel];
        
        _personPhotoImageView = [UIImageView new];
        _personPhotoImageView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_personPhotoImageView];
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.personPhotoImageView.frame = CGRectMake(10, (CGRectGetHeight(self.contentView.frame) - MEKPersonPhotoSize.height)/2, MEKPersonPhotoSize.width, MEKPersonPhotoSize.height);
    
    self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + MEKElementsOffset, MEKElementsOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame) - MEKElementsOffset * 3, 20);
    
    self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + MEKElementsOffset, CGRectGetMaxY(self.firstNameLabel.frame) + MEKElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), MEKLabelHeight);
    
    //CGSize detailTextLabelSize = [self.detailTextLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
    
    self.descriptionPersonLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + MEKElementsOffset, CGRectGetMaxY(self.lastNameLabel.frame) + MEKElementsOffset, CGRectGetWidth(self.lastNameLabel.frame), MEKLabelHeight * 2);
}

@end
