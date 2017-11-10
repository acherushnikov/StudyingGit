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
#import "SBTPersonProvider.h"
#import "SBTPerson.h"

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider *service;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    self.service = OCMPartialMock([SBTPersonProvider new]);
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.service = nil;
    [super tearDown];
}

- (void) testGetPersonListFromJSONNil {
    NSArray *personList = [self.service getPersonListFromJSON:nil];
    
    expect(personList).to.beNil();
}

- (void) testGetPersonListFromJSON {
    NSArray *fakeData = @[
                          @{
                              @"firstName" : @"Иван",
                              @"secondName" : @"Иванович",
                              @"lastName" : @"Иванов",
                              }
                          ];
    
    NSArray *personList = [self.service getPersonListFromJSON:fakeData];
    
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(1);
    
    expect([[personList objectAtIndex:0] firstName]).to.equal(@"Иван");
    expect([[personList objectAtIndex:0] secondName]).to.equal(@"Иванович");
    expect([[personList objectAtIndex:0] lastName]).to.equal(@"Иванов");
}


@end

//- (NSArray *)getPersonListFromJSON:(NSArray *)jsonData
//{
//    if (!jsonData)
//    {
//        return nil;
//    }
//
//    NSMutableArray *personList = [NSMutableArray arrayWithCapacity:jsonData.count];
//    for (NSDictionary *personDictionary in jsonData)
//    {
//        SBTPerson *person = [SBTPerson new];
//        person.firstName = personDictionary[@"firstName"];
//        person.lastName = personDictionary[@"lastName"];
//        person.secondName = personDictionary[@"secondName"];
//        [personList addObject:person];
//    }
//    return [personList copy];
//}


