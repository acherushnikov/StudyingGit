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
static const CGFloat CASElementsOffset = 15.f;
static const CGFloat CASLabelHeight = 20.f;

@implementation CASPersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _firstNameLabel = [UILabel new];
        _firstNameLabel.textColor = [UIColor redColor];
        
        
        _lastNameLabel = [UILabel new];
        _lastNameLabel.textColor = [UIColor greenColor];
        _lastNameLabel.font = [UIFont systemFontOfSize:20.f];
        
        
        _descriptionPersonLabel = [UILabel new];
        _descriptionPersonLabel.textColor = [UIColor yellowColor];
        _descriptionPersonLabel.numberOfLines = 0;
        
        
        _personPhotoImageView = [UIImageView new];
        _personPhotoImageView.backgroundColor = [UIColor orangeColor];
        
        [self.contentView addSubview:_firstNameLabel];
        [self.contentView addSubview:_lastNameLabel];
        [self.contentView addSubview:_descriptionPersonLabel];
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


//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//
//    self.personPhotoImageView.frame = CGRectMake(CGRectGetMinX(self.contentView.frame) + 2*CASElementsOffset, (CGRectGetHeight(self.contentView.frame) - CASPersonPhotoSize.height)/2, CASPersonPhotoSize.width, CASPersonPhotoSize.height);
//
//    self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CASElementsOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame) - CASElementsOffset * 3, CASLabelHeight);
//
//    self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CGRectGetMaxY(self.firstNameLabel.frame) + CASElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), CASLabelHeight);
//
//    CGSize detailTextLabelSize = [self.descriptionPersonLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
//
//    self.descriptionPersonLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + CASElementsOffset, CGRectGetMaxY(self.lastNameLabel.frame) + CASElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), detailTextLabelSize.height);
//
//}

+ (CGFloat)cellHeight:(NSString*)text
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17.f]};
    
    CGRect rect = [text
                   boundingRectWithSize: CGSizeMake(CGRectGetWidth(UIScreen.mainScreen.bounds) - 3*CASElementsOffset - CASPersonPhotoSize.width,CGFLOAT_MAX)
                   options:NSStringDrawingUsesLineFragmentOrigin
                   attributes:attributes
                   context:nil];
    
    CGFloat height = 4*CASElementsOffset + 2*CASLabelHeight + (int)(rect.size.height + 0.5);
    return height;
}

@end

