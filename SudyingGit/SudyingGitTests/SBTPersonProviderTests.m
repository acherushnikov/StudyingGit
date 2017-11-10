//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by Андрей on 10.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPersonProvider.h"

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider *personProvider;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    self.personProvider = OCMPartialMock([SBTPersonProvider new]);
}

- (void)tearDown {
    self.personProvider = nil;
    [super tearDown];
}

- (void)testGetPersonListFromJSONNil
{
    NSArray *personList = [self.personProvider getPersonListFromJSON:nil];
    
    expect(personList).to.beNil();
}

- (void)testGetPersonListFromJSONNotEmpty
{
    NSArray *personList = [self.personProvider getPersonListFromJSON:@[
                                                                           @{
                                                                               @"lastName"   : @"Фамилия",
                                                                               @"firstName"  : @"Имя",
                                                                               @"secondName" : @"Отчество",
                                                                            }
                                                                      ]];
    expect(personList.count).equal(1);
}

- (void)testGetPersonListFromJSONEmpty
{
    NSArray *personList = [self.personProvider getPersonListFromJSON:@[]];
    
    expect(personList.count).equal(0);
}

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

@end
