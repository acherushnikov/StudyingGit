//
//  TableViewCell.h
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 14.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *firstNameLabel;
@property (nonatomic, strong) UILabel *lastNameLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIImageView *image;

- (void)fillDataWithName:(NSString*)name lastName:(NSString*)lastName;

@end
