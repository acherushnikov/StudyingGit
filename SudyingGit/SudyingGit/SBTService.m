//
//  SBTService.m
//  UnitTests
//
//  Created by Alexander Cherushnikov on 27.07.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "SBTService.h"
#import "SBTPersonProvider.h"

@implementation SBTService

-(instancetype)init
{
	self = [super init];
	if (self)
	{
		_isCallFakeData = YES;
	}
	return self;
}

- (NSArray *)fakeData
{
	return @[
			 @{
				@"firstName" : @"Иван",
				@"secondName" : @"Иванович",
				@"lastName" : @"Иванов",
				}
			 ];
}

- (NSArray *)getPersonListFromProvider:(SBTPersonProvider *)provider
{
	if (!provider)
	{
		return nil;
	}
	
	NSArray *data = [self fakeData];
	if (!data)
	{
		return nil;
	}
	
	return [provider getPersonListFromJSON:data];
}

- (void)callFakeData
{
	if (!self.isCallFakeData) 
	{
		return;
	}
	[self fakeData];
}

@end
