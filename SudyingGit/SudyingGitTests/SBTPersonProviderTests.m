//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by Deniz Kaplan on 10.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPersonProviderProtocol.h"
#import "SBTPersonProvider.h"
#import "SBTPerson.h"

@interface SBTPersonProvider (Tests)


@end

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic,strong) SBTPersonProvider *pList;

@end


@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    self.pList = OCMPartialMock([SBTPersonProvider new]);
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    self.pList = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testGetPersonListFromJsonNil
{
  //id personProtocol = OCMProtocolMock(@protocol(SBTPersonProviderProtocol));
    NSArray *jsonData = [self.pList getPersonListFromJSON:nil];
    expect(jsonData).to.beNil();
    
}

- (void) testGetPersonListFromJson
{
    NSArray *jsonData = @[@{
        @"firstName" : @"Иван",
        @"secondName" : @"Иванович",
        @"lastName" : @"Иванов",
    }];
    NSArray <SBTPerson*> *person = [self.pList getPersonListFromJSON:jsonData];
    
    expect(self.pList).notTo.beNil();
    expect(person.count).equal(1);
    expect(person.firstObject.firstName).equal(@"Иван");
    expect(person.firstObject.secondName).equal(@"Иванович");
    expect(person.firstObject.lastName).equal(@"Иванов");
    expect(self.pList).to.conformTo(@protocol(SBTPersonProviderProtocol));
}


@end
