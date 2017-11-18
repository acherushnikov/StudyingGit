//
//  MVMPersonTableViewCell.m
//  SudyingGit
//
//  Created by Вероника on 14.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "MVMPersonTableViewCell.h"

static const CGSize MVMPersonPhotoSize = {50.f, 50.f};
static const CGFloat MVMElementsOffset = 10.f;
static const CGFloat MVMLabelHeight = 20.f;

@implementation MVMPersonTableViewCell

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
        
        _descriptionPersonLabel = [UILabel new];
        _descriptionPersonLabel.textColor = [UIColor yellowColor];
        _descriptionPersonLabel.font = [UIFont systemFontOfSize:17.f];
        _descriptionPersonLabel.numberOfLines = 0;// чтобы удалить возможность расширения
        _descriptionPersonLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_descriptionPersonLabel];
        
        _personPhotoImageView = [UIImageView new];
        _personPhotoImageView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_personPhotoImageView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.personPhotoImageView.frame = CGRectMake(MVMElementsOffset, (CGRectGetHeight(self.contentView.frame) - MVMPersonPhotoSize.height)/2, MVMPersonPhotoSize.width, MVMPersonPhotoSize.height);
    
    self.firstNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + MVMElementsOffset, MVMElementsOffset, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.personPhotoImageView.frame)-MVMElementsOffset*3, MVMLabelHeight);
    
    self.lastNameLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + MVMElementsOffset, CGRectGetMaxY(self.firstNameLabel.frame) + MVMElementsOffset, CGRectGetWidth(self.firstNameLabel.frame), MVMLabelHeight);
    
    
    CGSize detailTextLabelSize = [self.descriptionPersonLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
    
    self.descriptionPersonLabel.frame = CGRectMake(CGRectGetMaxX(self.personPhotoImageView.frame) + MVMElementsOffset, CGRectGetMaxY(self.lastNameLabel.frame) + MVMElementsOffset, detailTextLabelSize.width, detailTextLabelSize.height);
    
    
}

-(CGFloat)cellHeight
{
    UIFont* font = self.descriptionPersonLabel.font;
    
    NSMutableParagraphStyle* paragraph = [[NSMutableParagraphStyle alloc] init];
    [paragraph setLineBreakMode:NSLineBreakByWordWrapping];
    
    NSDictionary* attributes =
    [NSDictionary dictionaryWithObjectsAndKeys:
     font , NSFontAttributeName,
     paragraph, NSParagraphStyleAttributeName, nil];
    
    CGRect rect = [self.descriptionPersonLabel.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.contentView.frame) - MVMPersonPhotoSize.width -MVMElementsOffset * 3, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    
    CGFloat height = CGRectGetHeight(rect) +
    + MVMLabelHeight * 2 + MVMElementsOffset * 4;
    //CGFloat height = CGRectGetMaxY(self.descriptionPersonLabel.frame) + MVMElementsOffset;
    return height;
}

@end
