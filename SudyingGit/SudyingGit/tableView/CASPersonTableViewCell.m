//
//  CASPersonTableViewCell.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASPersonTableViewCell.h"
#import <Masonry/Masonry.h>

//static const CGSize CASPersonPhotoSize = {50.f, 50.f};
//static const CGFloat CASElementsOffset = 10.f;
//static const CGFloat CASLabelHeight = 20.f;

static const double CASPersonPhotoSize = 50.0f;
static const double CASElementsOffset = 10.f;
static const double CASLabelHeight = 20.f;

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
        
        [_personPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(CASElementsOffset);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.width.equalTo(@50);
            make.height.equalTo(@50);

        }];
        
        [_firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(CASElementsOffset);
            make.left.equalTo(self.personPhotoImageView.mas_right).with.offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).with.offset(-CASElementsOffset);
            //make.bottom.equalTo(self.contentView.mas_top).with.offset(CASElementsOffset + CASLabelHeight);
        }];

        [_lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstNameLabel.mas_bottom).with.offset(CASElementsOffset);
            make.left.mas_equalTo(self.firstNameLabel.mas_left);
            make.right.mas_equalTo(self.firstNameLabel.mas_right);
            //make.bottom.equalTo(self.firstNameLabel.mas_bottom).with.offset(CASElementsOffset + CASLabelHeight);
        }];

        [_descriptionPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lastNameLabel.mas_bottom).offset(CASElementsOffset);
            make.left.mas_equalTo(self.firstNameLabel.mas_left);
            make.right.mas_equalTo(self.firstNameLabel.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-CASElementsOffset);;
            
        }];
        
	}
	return self;
}

-(void)prepareForReuse
{
    [super prepareForReuse];
    self.firstNameLabel.text = nil;
    self.lastNameLabel.text = nil;
    self.descriptionPersonLabel.text = nil;
    self.personPhotoImageView.image = nil;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//
//    self.personPhotoImageView.frame = CGRectMake(CASElementsOffset, (CGRectGetHeight(self.contentView.frame) - CASPersonPhotoSize.height)/2, CASPersonPhotoSize.width, CASPersonPhotoSize.height);
//
//    self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CASElementsOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame) - CASElementsOffset * 3, CASLabelHeight);
//
//    self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CGRectGetMaxY(self.firstNameLabel.frame) + CASElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), CASLabelHeight);
//
//    CGSize detailTextLabelSize = [self.descriptionPersonLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
//
//    self.descriptionPersonLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CGRectGetMaxY(self.lastNameLabel.frame) + CASElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), detailTextLabelSize.height);
//}

-(CGFloat)cellHeight
{
    UIFont* font = self.descriptionPersonLabel.font;

    NSMutableParagraphStyle* paragraph = [[NSMutableParagraphStyle alloc] init];
    [paragraph setLineBreakMode:NSLineBreakByWordWrapping];

    NSDictionary* attributes =
    [NSDictionary dictionaryWithObjectsAndKeys:
     font , NSFontAttributeName,
     paragraph, NSParagraphStyleAttributeName, nil];

    CGRect rect = [self.descriptionPersonLabel.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.contentView.frame) - CASPersonPhotoSize - CASElementsOffset * 3, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];

    CGFloat height = CGRectGetHeight(rect) +
    + CASLabelHeight * 2 + CASElementsOffset * 4;
    //CGFloat height = CGRectGetMaxY(self.descriptionPersonLabel.frame) + MVMElementsOffset;
    return height;
}


@end
