//
//  MVMPersonTableViewCell.h
//  SudyingGit
//
//  Created by Вероника on 14.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVMPersonTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *firstNameLabel;
@property (nonatomic, strong) UILabel *lastNameLabel;
@property (nonatomic, strong) UILabel *descriptionPersonLabel;
@property (nonatomic, strong) UIImageView *personPhotoImageView;

-(CGFloat)cellHeight;
@end
