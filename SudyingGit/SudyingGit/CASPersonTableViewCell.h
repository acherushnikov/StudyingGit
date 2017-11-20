//
//  CASPersonTableViewCell.h
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CASPersonTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *firstNameLabel;
@property (nonatomic, strong) UILabel *lastNameLabel;
@property (nonatomic, strong) UILabel *descriptionPersonLabel;
@property (nonatomic, strong) UIImageView *personPhotoImageView;

+ (CGFloat)cellHeight:(NSString*)text;

@end
