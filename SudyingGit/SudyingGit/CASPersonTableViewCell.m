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
		[self.contentView addSubview:_firstNameLabel];
		
		_lastNameLabel = [UILabel new];
		_lastNameLabel.font = [UIFont systemFontOfSize:20.f];
        _lastNameLabel.numberOfLines = 0;
		[self.contentView addSubview:_lastNameLabel];
		
		_descriptionPersonLabel = [UILabel new];
		_descriptionPersonLabel.numberOfLines = 0;
		[self.contentView addSubview:_descriptionPersonLabel];
		
		_personPhotoImageView = [UIImageView new];
		_personPhotoImageView.backgroundColor = [UIColor orangeColor];
		[self.contentView addSubview:_personPhotoImageView];
        
        [_personPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(CASElementsOffset);
            make.left.equalTo(self.contentView.mas_left).with.offset(CASElementsOffset);
            make.height.mas_equalTo(CASPersonPhotoSize.height);
            make.width.mas_equalTo(CASPersonPhotoSize.width);
        }];
        
        [_firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView.mas_top).with.offset(CASElementsOffset);
            make.left.equalTo(_personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).with.offset(-CASElementsOffset);
            make.height.mas_equalTo(CASLabelHeight);
        }];
        
        [_lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_firstNameLabel.mas_bottom).with.offset(CASElementsOffset);
            make.left.equalTo(_personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).with.offset(-CASElementsOffset);
        }];
        
        [_descriptionPersonLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_lastNameLabel.mas_bottom).with.offset(CASElementsOffset);
            make.left.equalTo(_personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).with.offset(-CASElementsOffset);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-CASElementsOffset);
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
