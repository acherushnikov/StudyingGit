//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by Андрей on 10.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTService.h"
#import "SBTPersonProvider.h"
#import "SBTPerson.h"

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider *provider;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    
    self.provider = [SBTPersonProvider new];
}

- (void)tearDown {
    self.provider = nil;
    
    [super tearDown];
}

- (void)testGetPersonListFromNilJSON{
    NSArray* personList = [self.provider getPersonListFromJSON:nil];
    expect(personList).to.beNil();
}

- (void)testGetPersonListFromEmptyJSON{
    NSArray* personList = [self.provider getPersonListFromJSON:@[]];
    expect(personList).equal(@[]);
}

- (void)testGetPersonListFromJSON{
    NSArray* personList = [self.provider getPersonListFromJSON:@[
                                                                 @{
                                                                     @"firstName" : @"Иван",
                                                                     @"secondName" : @"Иванович",
                                                                     @"lastName" : @"Иванов",
                                                                     }
                                                                 ]];
    expect(personList).toNot.beNil();
    expect(personList.count).equal(1);
    expect(personList.firstObject).to.beKindOf([SBTPerson class]);
    expect(((SBTPerson *)(personList.firstObject)).firstName).equal(@"Иван");
    expect(((SBTPerson *)(personList.firstObject)).secondName).equal(@"Иванович");
    expect(((SBTPerson *)(personList.firstObject)).lastName).equal(@"Иванов");
}

@end
