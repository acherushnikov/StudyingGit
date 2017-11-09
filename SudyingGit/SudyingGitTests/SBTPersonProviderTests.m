//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by Mikhail Shamhalov on 09/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPersonProvider.h"
#import "SBTPerson.h"

@interface SBTPersonProvider (Tests)

- (NSArray <SBTPerson *> *)getPersonListFromJSON:(NSArray *)jsonData;

@end

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider *personProvider;

@end

@implementation SBTPersonProviderTests

- (void)setUp
{
	self.personProvider = OCMPartialMock([SBTPersonProvider new]);
    [super setUp];
}

- (void)tearDown
{
	
    [super tearDown];
}

- (void)testPersonProviderIsNil
{
	NSArray *persons = [self.personProvider getPersonListFromJSON:nil];
	expect(persons).to.beNil();
}

- (void)testPersonProvider
{
	NSArray *json= @[
	  @{
		  @"firstName" : @"Иван",
		  @"secondName" : @"Иванович",
		  @"lastName" : @"Иванов",
		  },
	  @{
		  @"firstName" : @"Владимир",
		  @"secondName" : @"Анатольевич",
		  @"lastName" : @"Калашников",
		  }
	  ];
	
	NSArray <SBTPerson *> *persons = [self.personProvider getPersonListFromJSON:json];
	OCMVerify([SBTPerson new]);
	
	expect(persons).toNot.beNil();
	expect(persons.count).to.equal(2);
	expect(persons.firstObject.firstName).to.equal(@"Иван");
	expect(persons.firstObject.secondName).to.equal(@"Иванович");
	expect(persons.firstObject.lastName).to.equal(@"Иванов");
	
	expect(persons.lastObject.firstName).to.equal(@"Владимир");
	expect(persons.lastObject.secondName).to.equal(@"Анатольевич");
	expect(persons.lastObject.lastName).to.equal(@"Калашников");
}

@end
