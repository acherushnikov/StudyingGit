//
//  SBTServiceTests.m
//  SudyingGitTests
//
//  Created by Deniz Kaplan on 09.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTService.h"
#import "SBTPersonProvider.h"

@interface SBTService(Tests)

-(NSArray *)fakeData;


@end

@interface SBTServiceTests : XCTestCase

@property (strong, nonatomic) SBTService *service;


@end

@implementation SBTServiceTests

- (void)setUp {
    [super setUp];
    self.service = OCMPartialMock([SBTService new]);
   
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    self.service = nil;
  
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
 - (void)testGetPersonalListFromProviderNil
{
    
    NSArray *personList =    [self.service getPersonListFromProvider:nil];
    expect (personList).to.beNil();
}

-(void) testGetProviderListFromProviderFakeDataNil
{
    id personProvider = OCMClassMock([SBTPersonProvider class]);
    OCMStub([self.service fakeData]).andReturn(Nil);
    NSArray *personList =    [self.service getPersonListFromProvider:personProvider];
    expect (personList).to.beNil();
}
-(void) testGetPersonListFromProvider
{
    id personProvider = OCMClassMock([SBTPersonProvider class]);
    OCMStub([personProvider getPersonListFromJSON:@[]]).andReturn(@[@"123"]);
    OCMStub([self.service fakeData]).andReturn(@[]);
    NSArray *personList =   [self.service getPersonListFromProvider:personProvider];
   
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(1);
    expect(personList.firstObject).to.equal(@"123");
}



@end
