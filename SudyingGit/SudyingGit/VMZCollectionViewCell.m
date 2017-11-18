//
//  VMZCollectionViewCell.m
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 16.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import "VMZCollectionViewCell.h"

@interface VMZCollectionViewCell ()

@end

@implementation VMZCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //[self setFrame:frame];
        self.label = [UILabel new];
        [self.label setFrame:CGRectMake(5, 5, 100, 25)];
        self.label.backgroundColor = [UIColor lightGrayColor];
        self.label.text = @"text";
        [self.contentView addSubview:self.label];
    }
    return self;
}

@end
