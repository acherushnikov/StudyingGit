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
//static const CGFloat KSElementOffset = 8.f;
//static const CGFloat CASLabelHeight = 20.f;

@interface CASPersonTableViewCell ()
@property (strong, nonatomic) UIView* containerImageView;
@end

@implementation CASPersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        [self addSubview:self.backgroundCardView];
        
        [self.backgroundCardView addSubview:self.nameBoxerLabel];
        [self.backgroundCardView addSubview:self.descriptionBoxerLabel];
        [self.backgroundCardView addSubview:self.boxerPhotoImageView];
        
        
        //Anchors backgroundCardView
        [[self.backgroundCardView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:true];
        [[self.backgroundCardView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:true];
        [[self.backgroundCardView.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:-16.f] setActive:true];
        [[self.backgroundCardView.heightAnchor constraintEqualToAnchor:self.heightAnchor] setActive:true];
        
        //Anchors boxerPhotoImageView
        [[self.boxerPhotoImageView.topAnchor constraintEqualToAnchor:self.backgroundCardView.topAnchor constant:10.f] setActive:true];
        [[self.boxerPhotoImageView.leadingAnchor constraintEqualToAnchor:self.backgroundCardView.leadingAnchor constant:10.f] setActive:true];
        [[self.boxerPhotoImageView.widthAnchor constraintEqualToAnchor:self.backgroundCardView.widthAnchor multiplier:1.f/4.f] setActive:true];
        [[self.boxerPhotoImageView.heightAnchor constraintEqualToAnchor:self.backgroundCardView.widthAnchor multiplier:1.f/4.f] setActive:true];
        //[[self.boxerPhotoImageView.bottomAnchor constraintEqualToAnchor:self.descriptionBoxerLabel.bottomAnchor] setActive:true];
        
        //Anchors nameBoxerLabel
        [[self.nameBoxerLabel.topAnchor constraintEqualToAnchor:self.boxerPhotoImageView.topAnchor] setActive:true];
        [[self.nameBoxerLabel.leadingAnchor constraintEqualToAnchor:self.boxerPhotoImageView.trailingAnchor constant:10.f] setActive:true];
        [[self.nameBoxerLabel.trailingAnchor constraintEqualToAnchor:self.backgroundCardView.trailingAnchor constant:-10.f] setActive:true];
        [[self.nameBoxerLabel.bottomAnchor constraintEqualToAnchor:self.descriptionBoxerLabel.topAnchor constant:-10.f] setActive:true];
        
        //Anchors descriptionLabel
        [[self.descriptionBoxerLabel.topAnchor constraintEqualToAnchor:self.nameBoxerLabel.bottomAnchor constant:8.f] setActive:true];
        [[self.descriptionBoxerLabel.leadingAnchor constraintEqualToAnchor:self.nameBoxerLabel.leadingAnchor] setActive:true];
        [[self.descriptionBoxerLabel.trailingAnchor constraintEqualToAnchor:self.nameBoxerLabel.trailingAnchor] setActive:true];
        [[self.descriptionBoxerLabel.bottomAnchor constraintEqualToAnchor:self.backgroundCardView.bottomAnchor constant:-20.f] setActive:true];
        
        //[self.boxerPhotoImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:<#(CGFloat)#>]

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
