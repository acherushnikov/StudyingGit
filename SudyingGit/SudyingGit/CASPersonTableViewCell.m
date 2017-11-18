//
//  CASPersonTableViewCell.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASPersonTableViewCell.h"
#import <Masonry/Masonry.h>

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
        
        [self.personPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.superview.mas_centerY);
            make.left.equalTo(self.superview.mas_left).with.offset(CASElementsOffset);
            make.size.height.equalTo(@50);
            make.size.width.equalTo(@50);
        }];
        
        [self.firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.top.equalTo(self.superview.mas_top).with.offset(CASElementsOffset);
            //make.height.mas_equalTo(CASLabelHeight);
            make.right.equalTo(self.superview.mas_right).with.offset(CASElementsOffset);
        }];
        
        [self.lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.top.equalTo(self.firstNameLabel.mas_bottom).with.offset(CASElementsOffset);
            //make.height.mas_equalTo(CASLabelHeight);
            make.right.equalTo(self.superview.mas_right).with.offset(CASElementsOffset);
        }];
        
        [self.descriptionPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.top.equalTo(self.lastNameLabel.mas_bottom).with.offset(CASElementsOffset);
            //make.height.mas_equalTo(CASLabelHeight);
            make.right.equalTo(self.superview.mas_right).with.offset(CASElementsOffset);
            make.bottom.equalTo(self.superview.mas_bottom).with.offset(-CASElementsOffset);
        }];
        
	}
	return self;
}

- (CGFloat)cellHeight
{
	CGFloat height = CGRectGetMaxY(self.descriptionPersonLabel.frame) + CASElementsOffset;
	return height;
}

@end
