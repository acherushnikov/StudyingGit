//
//  SBTPerson.h
//  UnitTests
//
//  Created by Alexander Cherushnikov on 27.07.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MVMPersonCellType){
    MVMPersonCellTypeDefault,
    MVMPersonCellTypeCustom
};

@interface SBTPerson : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *secondName;
@property (nonatomic, copy) NSString *lastName;
@property(nonatomic, copy) NSString *personDescription;
@property (nonatomic, assign) MVMPersonCellType personCellType;
@end
