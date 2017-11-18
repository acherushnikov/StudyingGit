//
//  TableViewCell.m
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 14.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import "TableViewCell.h"
#import "FrameExtension.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        //[self setFrame:CGRectMake(0, 0, self.frame.size.width, 120)];
        //[self.contentView setFrame:self.frame];
        //[self.contentView setFrame:CGRectMake(5, 0, self.frame.size.width, self.frame.size.height)];
        self.backgroundColor = [UIColor blackColor];
        
        _firstNameLabel = [UILabel new];
        [_firstNameLabel setNumberOfLines:1];
        _firstNameLabel.backgroundColor = [UIColor whiteColor];
        _firstNameLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_firstNameLabel];
        
        _lastNameLabel = [UILabel new];
        _firstNameLabel.backgroundColor = [UIColor whiteColor];
        _lastNameLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_lastNameLabel];
        
        _image = [UIImageView new];
        _image.backgroundColor = [UIColor grayColor];
        [_image setFrame:CGRectMake(5, 5, 30, 30)];
        _image.layer.anchorPoint = CGPointMake(0.5, 0.5);
        [self.contentView addSubview:_image];
    }
    return self;
}

- (void)fillDataWithName:(NSString*)name lastName:(NSString*)lastName {
    _firstNameLabel.text = name;
    [_firstNameLabel sizeToFit];
    [_firstNameLabel setOrigin:CGPointMake(CGRectGetMaxX(_image.frame) + 10, 5)];
    
    _lastNameLabel.text = lastName;
    [_lastNameLabel sizeToFit];
    [_lastNameLabel setOrigin:CGPointMake(CGRectGetMaxX(_firstNameLabel.frame) + 10, 5)];
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
