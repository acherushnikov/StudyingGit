//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by Никита on 10.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>

#import "SBTPersonProvider.h"
#import "SBTPerson.h"


@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider* provider;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.provider = OCMPartialMock([SBTPersonProvider new]);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.provider = nil;
    
    [super tearDown];
}

-(void)testGetPersonListFromJSONGetNilArrayReturnNil{
    
    NSArray* personList = [self.provider getPersonListFromJSON:nil];
    
    expect(personList).to.beNil();
}

-(void)testGetPersonListFromJSONInEmptyArrayReturnEmptyArray{
    
    NSArray* personList = [self.provider getPersonListFromJSON:@[]];
    
    expect(personList).to.beEmpty();
}

-(void)testGetPersonListFromJSONInOneArrayReturnArray{
    
    NSDictionary* fakeDictonary = @{
                                    @"firstName"   : @"name1",
                                     @"lastName"   : @"name2",
                                     @"secondName" : @"name3"
                                    };
    
    //id onePerson = OCMClassMock([SBTPerson class]);
    NSArray* personList = [self.provider getPersonListFromJSON:@[fakeDictonary]];
    
    expect(personList.count).to.equal(1);
    expect(personList[0]).to.beInstanceOf([SBTPerson class]);
}


@end
