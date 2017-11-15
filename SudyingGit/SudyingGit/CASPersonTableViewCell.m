//
//  CASPersonTableViewCell.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASPersonTableViewCell.h"

static const CGSize CASPersonPhotoSize = {50.f, 50.f};
static const CGFloat CASElementsOffset = 10.f;
static const CGFloat CASLabelHeight = 20.f;

@implementation CASPersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		_firstNameLabel = [UILabel new];
		_firstNameLabel.textColor = [UIColor redColor];
		[self.contentView addSubview:_firstNameLabel];
		
		_lastNameLabel = [UILabel new];
		_lastNameLabel.textColor = [UIColor greenColor];
		_lastNameLabel.font = [UIFont systemFontOfSize:20.f];
		[self.contentView addSubview:_lastNameLabel];
		
		_descriptionPersonLabel = [UILabel new];
		_descriptionPersonLabel.textColor = [UIColor yellowColor];
		_descriptionPersonLabel.numberOfLines = 0;
		[self.contentView addSubview:_descriptionPersonLabel];
		
		_personPhotoImageView = [UIImageView new];
		_personPhotoImageView.backgroundColor = [UIColor orangeColor];
		[self.contentView addSubview:_personPhotoImageView];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	self.personPhotoImageView.frame = CGRectMake(CASElementsOffset, (CGRectGetHeight(self.contentView.frame) - CASPersonPhotoSize.height)/2, CASPersonPhotoSize.width, CASPersonPhotoSize.height);
	
	self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CASElementsOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame) - CASElementsOffset * 3, CASLabelHeight);
	
	self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CGRectGetMaxY(self.firstNameLabel.frame) + CASElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), CASLabelHeight);
	
	CGSize detailTextLabelSize = [self.descriptionPersonLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
	
	self.descriptionPersonLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CGRectGetMaxY(self.lastNameLabel.frame) + CASElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), detailTextLabelSize.height);
}

- (CGFloat)cellHeight
{
	CGFloat height = CGRectGetMaxY(self.descriptionPersonLabel.frame) + CASElementsOffset; // .frame!
	return height;
}

- (CGFloat)cellOffset
{
    return CASElementsOffset;
}

@end
