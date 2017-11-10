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
    expect(personList.count).equal(1);
}

@end
