//
//  DTMPersonTableViewCell.h
//  SudyingGit
//
//  Created by user on 14.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTMPersonTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *firstNameLabel;
@property (nonatomic, strong) UILabel *lastNameLabel;
@property (nonatomic, strong) UILabel *descriptionLabel; //will be dynamic
@property (nonatomic, strong) UIImageView *personPhotoImageView;

@property (nonatomic, assign) CGFloat elementsOffset;
@property (nonatomic, assign) CGFloat widthOfDescriptionLabel; //чтобы работал костыль с адаптивной ячейкой

- (CGFloat)cellHeight;

@end
