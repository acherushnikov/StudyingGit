//
//  SKBoxer.m
//  SudyingGit
//
//  Created by Said Kagirov on 19/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "SKBoxer.h"

@implementation SKBoxer

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        self.boxerName = dictionary[@"name"];
        self.boxerDescription = dictionary[@"description"];
        self.boxerImageName = dictionary[@"imageName"];
    }
    return self;
}


@end
