//
//  TableViewCell.m
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 14.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import "TableViewCell.h"
#import "FrameExtension.h"
#import <Masonry/Masonry.h>

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        //[self setFrame:CGRectMake(0, 0, self.frame.size.width, 120)];
        //[self.contentView setFrame:self.frame];
        //[self.contentView setFrame:CGRectMake(5, 0, self.frame.size.width, self.frame.size.height)];
        self.backgroundColor = [UIColor blackColor];
        
        _firstNameLabel = [UILabel new];
        _firstNameLabel.backgroundColor = [UIColor whiteColor];
        _firstNameLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_firstNameLabel];
        
        _lastNameLabel = [UILabel new];
        _firstNameLabel.backgroundColor = [UIColor whiteColor];
        _lastNameLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_lastNameLabel];
        
        _image = [UIImageView new];
        _image.backgroundColor = [UIColor grayColor];
        //_image.layer.anchorPoint = CGPointMake(0.5, 0.5);
        [self.contentView addSubview:_image];
        
        _descriptionLabel = [UILabel new];
        _descriptionLabel.text = @"Over fact all son tell this any his. No insisted confined of weddings to returned to debating rendered. Keeps order fully so do party means young. Table nay him jokes quick.";
        _descriptionLabel.textColor = [UIColor grayColor];
        _descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _descriptionLabel.numberOfLines = 5;
        [self.contentView addSubview:_descriptionLabel];
        
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
        NSInteger offsetBetweenImgAndText = 10,
        offsetBetweenLabels = 10;
        UIView* superview = self.contentView;
        
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).with.offset(padding.top);
            make.left.equalTo(superview.mas_left).with.offset(padding.left);
            make.width.equalTo(@60);
            make.height.equalTo(@60);
            make.bottom.lessThanOrEqualTo(superview.mas_bottom).with.offset(-padding.bottom);
        }];
        [_firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.mas_top);
            make.leading.equalTo(_image.mas_trailing).with.offset(offsetBetweenImgAndText);
            //make.trailing.equalTo(superview.mas_trailing).with.offset(padding.right);
            //make.height.equalTo(@20);
        }];
        [_lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_firstNameLabel);
            make.leading.equalTo(_firstNameLabel.mas_trailing).with.offset(offsetBetweenLabels);
        }];
        [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_firstNameLabel.mas_bottom).with.offset(10);
            make.leading.equalTo(_firstNameLabel).with.offset(5);
            make.trailing.equalTo(superview.mas_trailing).with.offset(-padding.right);
            make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
        }];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)fillDataWithName:(NSString*)name lastName:(NSString*)lastName {
    _firstNameLabel.text = name;
    //[_firstNameLabel sizeToFit];
    //[_firstNameLabel setOrigin:CGPointMake(CGRectGetMaxX(_image.frame) + 10, 5)];
    
    _lastNameLabel.text = lastName;
    //[_lastNameLabel sizeToFit];
    //[_lastNameLabel setOrigin:CGPointMake(CGRectGetMaxX(_firstNameLabel.frame) + 10, 5)];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
