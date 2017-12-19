//
//  CASPersonTableViewCell.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASPersonTableViewCell.h"
#import <Masonry/Masonry.h>
#import "SBTPerson.h"

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
        _firstNameLabel.numberOfLines = 0;
        
        
        [self.contentView addSubview:_firstNameLabel];
        
        _lastNameLabel = [UILabel new];
        _lastNameLabel.textColor = [UIColor greenColor];
        _lastNameLabel.font = [UIFont systemFontOfSize:20.f];
        [self.contentView addSubview:_lastNameLabel];
        
        _descriptionPersonLabel = [UILabel new];
        _descriptionPersonLabel.textColor = [UIColor yellowColor];
        _descriptionPersonLabel.numberOfLines = 0;
        
        
        [self.contentView addSubview:_descriptionPersonLabel];
        
        _personPhotoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _personPhotoImageView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_personPhotoImageView];
        
        
        [_personPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(CASElementsOffset);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
            
        }];
        
        [_firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(CASElementsOffset);
            make.left.equalTo(_personPhotoImageView.mas_right).offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).offset(-CASElementsOffset);
        }];
        
        [_lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstNameLabel.mas_bottom).offset(CASElementsOffset);
            make.left.equalTo(_personPhotoImageView.mas_right).offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).offset(-CASElementsOffset);
            
        }];
        
        [_descriptionPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lastNameLabel.mas_bottom).offset(CASElementsOffset);
            make.left.equalTo(_personPhotoImageView.mas_right).offset(CASElementsOffset);
            make.right.equalTo(self.contentView.mas_right).offset(-CASElementsOffset);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-CASElementsOffset);
        }];
        
        [super updateConstraints];
        
        
        
        
    }
    return self;
}


-(void) prepareForReuse
{
    [super prepareForReuse];
    
    _firstNameLabel.text = nil;
    _lastNameLabel.text  = nil;
    _descriptionPersonLabel.text = nil;
    _personPhotoImageView = nil;
    
}
- (CGFloat)cellHeight
{
    CGFloat height = CGRectGetMaxY(self.descriptionPersonLabel.frame) + CASElementsOffset;
    return height;
    
}

+(CGFloat) heightForCellWithPerson:(SBTPerson *)person
{
    NSString * description = person.personDescription;
    CGFloat height = [CASPersonTableViewCell heightOfAttributedText:description];
    
    height +=(4*CASElementsOffset + 2*CASLabelHeight);
    NSLog(@"My height %f", height);
    return height;
    
}


+ (CGFloat) heightOfAttributedText: (NSString*) text
{
    
    UIFont *font = [UIFont systemFontOfSize:20.f];
    
    CGRect rect1 = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - CASPersonPhotoSize.width - 3*CASElementsOffset, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName: font}
                                      context:nil];
    
    CGFloat height = rect1.size.height;
    
    
    return height;
}
//+ (BOOL)requiresConstraintBasedLayout
//{
//    return YES;
//}

@end
