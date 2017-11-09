//
//  SBTServiceTests.m
//  SudyingGitTests
//
//  Created by Alexander Cherushnikov on 09.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTService.h"
#import "SBTPersonProvider.h"

@interface SBTService(Tests)

- (NSArray *)fakeData;

@end

@interface SBTServiceTests : XCTestCase

@property (nonatomic, strong) SBTService *service;

@end

@implementation SBTServiceTests

- (void)setUp {
    [super setUp];
	
	self.service = OCMPartialMock([SBTService new]);
}

- (void)tearDown {
	self.service = nil;
	
    [super tearDown];
}

- (void)testGetPersonListFromProviderNil
{
	NSArray *personList = [self.service getPersonListFromProvider:nil];
	
	expect(personList).to.beNil();
}

- (void)testGetPersonListFromProviderFakeDataNil
{
	id personProvider = OCMClassMock([SBTPersonProvider class]);
	OCMStub([self.service fakeData]).andReturn(nil);
	
	NSArray *personList = [self.service getPersonListFromProvider:personProvider];
	
	expect(personList).to.beNil();
}

- (void)testGetPersonListFromProvider
{
	id personProvider = OCMClassMock([SBTPersonProvider class]);
	OCMStub([personProvider getPersonListFromJSON:@[]]).andReturn(@[@"123"]);
	
	OCMStub([self.service fakeData]).andReturn(@[]);
	
	NSArray *personList = [self.service getPersonListFromProvider:personProvider];
	
	expect(personList).toNot.beNil();
	expect(personList.count).to.equal(1);
	expect(personList.firstObject).to.equal(@"123");
}

- (void)testCallFakeDataNO
{
	OCMStub([self.service isCallFakeData]).andReturn(NO);
	
	OCMReject([self.service fakeData]);
	
	[self.service callFakeData];
}

- (void)testCallFakeDataYES
{
	OCMStub([self.service isCallFakeData]).andReturn(YES);
	
	[self.service callFakeData];
	
	OCMVerify([self.service fakeData]);
}

- (void)testfakeData
{
	NSArray *fakeData = [self.service fakeData];
}
//- (void)callFakeData
//{
//	if (!self.isCallFakeData)
//	{
//		return;
//	}
//	[self fakeData];
//}

@end

//- (NSArray *)getPersonListFromProvider:(SBTPersonProvider *)provider
//{
//
//if (!provider)
//{
//	return nil;
//}
//	NSArray *data = [self fakeData];
//	if (!data)
//	{
//		return nil;
//	}
//
//	return [provider getPersonListFromJSON:data];
//}

