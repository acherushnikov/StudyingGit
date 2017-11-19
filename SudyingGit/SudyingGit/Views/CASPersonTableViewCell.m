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
static const CGFloat KSElementOffset = 8.f;
//static const CGFloat CASLabelHeight = 20.f;

@implementation CASPersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        [self addSubview:self.backgroundCardView];
        [self.backgroundCardView addSubview:self.nameBoxerLabel];
        [self.backgroundCardView addSubview:self.boxerPhotoImageView];
        [self.backgroundCardView addSubview:self.descriptionBoxerLabel];
        
        //Anchors backgroundCardView
        [[self.backgroundCardView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:true];
        [[self.backgroundCardView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:true];
        [[self.backgroundCardView.widthAnchor constraintEqualToAnchor:self.widthAnchor] setActive:true];
        [[self.backgroundCardView.heightAnchor constraintEqualToAnchor:self.heightAnchor] setActive:true];
        
        //Anchors nameBoxerLabel
        [[self.nameBoxerLabel.topAnchor constraintEqualToAnchor:self.boxerPhotoImageView.topAnchor] setActive:true];
        [[self.nameBoxerLabel.leftAnchor constraintEqualToAnchor:self.boxerPhotoImageView.rightAnchor constant:KSElementOffset] setActive:true];
        [[self.nameBoxerLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-KSElementOffset] setActive:true];
        [[self.nameBoxerLabel.heightAnchor constraintEqualToConstant:30.f] setActive:true];
        
        //Anchors descriptionLabel
        [[self.descriptionBoxerLabel.leftAnchor constraintEqualToAnchor:self.boxerPhotoImageView.rightAnchor constant:KSElementOffset] setActive:true];
        [[self.descriptionBoxerLabel.topAnchor constraintEqualToAnchor:self.nameBoxerLabel.bottomAnchor constant:KSElementOffset] setActive:true];
        [[self.descriptionBoxerLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-KSElementOffset] setActive:true];
        [[self.descriptionBoxerLabel.bottomAnchor constraintEqualToAnchor:self.boxerPhotoImageView.bottomAnchor] setActive:true];
        
        //Anchors boxerPhotoImageView
        [[self.boxerPhotoImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:KSElementOffset] setActive:true];
        [[self.boxerPhotoImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:KSElementOffset] setActive:true];
        [[self.boxerPhotoImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-KSElementOffset] setActive:true];
        [[self.boxerPhotoImageView.widthAnchor constraintEqualToConstant:110.f] setActive:true];
        [[self.boxerPhotoImageView.heightAnchor constraintEqualToConstant:120.f] setActive:true];

    }
    return self;
}

#pragma mark - Getters UI

- (UIView *)backgroundCardView
{
    
    if (!_backgroundCardView) {
        
        UIView* view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:240.f/255.f green:240.f/255 blue:240.f/255.f alpha:1.f];
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.clipsToBounds = true;
        view.layer.cornerRadius = 3.f;
        view.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 0);
        view.layer.shadowOpacity = 0.8f;
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
        label.backgroundColor = [UIColor clearColor];
        
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
        label.backgroundColor = [UIColor clearColor];
        
        _descriptionBoxerLabel = label;
    }
    
    return _descriptionBoxerLabel;
}

- (UIImageView *)boxerPhotoImageView
{
    
    if (!_boxerPhotoImageView) {
        
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        //imageView.layer.cornerRadius = 20.f;
        imageView.layer.masksToBounds = true;
        
        _boxerPhotoImageView = imageView;
    }
    
    return _boxerPhotoImageView;
}

@end
