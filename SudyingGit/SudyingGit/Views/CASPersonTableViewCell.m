//
//  CASPersonTableViewCell.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASPersonTableViewCell.h"
#define MAS_SHORTHAND
#import <Masonry/Masonry.h>


//static const CGSize CASPersonPhotoSize = {50.f, 50.f};
//static const CGFloat KSElementOffset = 8.f;
//static const CGFloat CASLabelHeight = 20.f;

@interface CASPersonTableViewCell ()
@property (strong, nonatomic) UIView* containerImageView;
@property (assign, nonatomic) BOOL bol;
@end

@implementation CASPersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.bol = false;
        [self addSubview:self.backgroundCardView];
        
        [self.backgroundCardView addSubview:self.nameBoxerLabel];
        [self.backgroundCardView addSubview:self.descriptionBoxerLabel];
        [self.backgroundCardView addSubview:self.boxerPhotoImageView];
//
        self.nameBoxerLabel.backgroundColor = [UIColor redColor];
        self.descriptionBoxerLabel.backgroundColor = [UIColor yellowColor];
        
        
        //Constraints backgroundCardView
        [self.backgroundCardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.centerX.equalTo(self.mas_centerX);
            make.width.equalTo(self.mas_width).with.valueOffset(@(-16));
            make.height.equalTo(self.mas_height);
        }];
        
//        //Constraints boxerPhotoImageView
        [self.boxerPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backgroundCardView.mas_top).with.offset(10.f);
            make.leading.equalTo(self.backgroundCardView.mas_leading).offset(10.f);
            make.bottom.lessThanOrEqualTo(self.descriptionBoxerLabel.mas_bottom);
            make.width.equalTo(self.backgroundCardView.mas_width).with.multipliedBy(1.f/4.f);
            make.height.equalTo(self.backgroundCardView.mas_width).with.multipliedBy(1.f/4.f);
        }];
        
        //Constraints nameBoxerLabel
        [self.nameBoxerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.boxerPhotoImageView.mas_top);
            make.leading.equalTo(self.boxerPhotoImageView.mas_trailing).with.offset(10.f);
            make.trailing.equalTo(self.backgroundCardView.mas_trailing).with.offset(-10.f);
            make.bottom.equalTo(self.descriptionBoxerLabel.mas_top).with.offset(-10.f);
        }];
        
        //Constraints descriptionBoxerLabel
        [self.descriptionBoxerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameBoxerLabel.mas_bottom).with.offset(-10.f);
            make.leading.equalTo(self.nameBoxerLabel.mas_leading);
            make.trailing.equalTo(self.nameBoxerLabel.mas_trailing);
            make.bottom.equalTo(self.backgroundCardView.mas_bottom).with.offset(-10.f);
        }];
    }
    return self;
}

#pragma mark - Getters UI

- (UIView *)containerImageView
{
    
    if (!_containerImageView) {
        
        UIView* view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        _containerImageView = view;
    }
    
    return _containerImageView;
}

- (UIView *)backgroundCardView
{
    
    if (!_backgroundCardView) {
        
        UIView* view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:240.f/255.f green:240.f/255 blue:240.f/255.f alpha:1.f];
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.clipsToBounds = true;
        view.layer.cornerRadius = 10.f;
        view.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 0);
        view.layer.shadowOpacity = 1.f;
        view.layer.masksToBounds = false;
        
        _backgroundCardView = view;
    }
    
    return _backgroundCardView;
}

- (UIView *)nameBoxerLabel
{
    
    if (!_nameBoxerLabel) {
        
        UILabel* label = [[UILabel alloc] init];
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.numberOfLines = 0;
        
        _nameBoxerLabel = label;
    }
    
    return _nameBoxerLabel;   
}

- (UILabel *)descriptionBoxerLabel
{
    
    if (!_descriptionBoxerLabel) {
        
        UILabel* label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textAlignment = NSTextAlignmentJustified;
        
        _descriptionBoxerLabel = label;
    }
    
    return _descriptionBoxerLabel;
}

- (UIImageView *)boxerPhotoImageView
{
    
    if (!_boxerPhotoImageView) {
        
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor grayColor];
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.layer.cornerRadius = 5.f;
        imageView.layer.masksToBounds = true;
        
        _boxerPhotoImageView = imageView;
    }
    
    return _boxerPhotoImageView;
}

@end
