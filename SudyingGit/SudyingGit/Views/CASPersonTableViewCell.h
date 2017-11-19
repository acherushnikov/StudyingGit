//
//  CASPersonTableViewCell.h
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CASPersonTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView* backgroundCardView;
@property (nonatomic, strong) UILabel* nameBoxerLabel;
@property (nonatomic, strong) UILabel* descriptionBoxerLabel;
@property (nonatomic, strong) UIImageView* boxerPhotoImageView;

//- (CGFloat)cellHeight;

@end
