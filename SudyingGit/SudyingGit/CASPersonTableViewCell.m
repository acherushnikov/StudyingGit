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
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

        
        [_personPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.center.y);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(_firstNameLabel.mas_left).with.offset(-15);
            make.height.mas_equalTo(CASPersonPhotoSize.height);
            make.width.mas_equalTo(CASPersonPhotoSize.width);
        }];
        
        [_firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(15);
            make.bottom.equalTo(_lastNameLabel.mas_top).with.offset(-15);
            make.height.mas_equalTo(CASLabelHeight);
        }];
        
        [_lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(15);
            make.left.equalTo(_personPhotoImageView.mas_right).with.offset(15);
            make.bottom.equalTo(_descriptionPersonLabel.mas_top).with.offset(-15);
            make.height.mas_equalTo(CASLabelHeight);
        }];
        
        [_descriptionPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.left.equalTo(_personPhotoImageView.mas_right).with.offset(15);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-15);
            make.width.mas_lessThanOrEqualTo([UIScreen mainScreen].bounds.size.width - CASPersonPhotoSize.width - 3*CASElementsOffset);
        }];
        
        
        
        [super updateConstraints];
	}
	return self;
}


- (CGFloat)cellHeight
{
	CGFloat height = CGRectGetMaxY(self.descriptionPersonLabel.frame) + CASElementsOffset;
	return height;
}

@end
