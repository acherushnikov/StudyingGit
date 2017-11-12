//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by user on 12.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPerson.h"
#import "SBTPersonProvider.h"

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider* provider;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    self.provider = OCMPartialMock([SBTPersonProvider new]);
}

- (void)tearDown {
    self.provider = nil;
    [super tearDown];
}

-(void)testGetPersonListFromJSONNil
{
    NSArray* personList = [self.provider getPersonListFromJSON:nil];
    expect(personList).to.beNil();
}

-(void)testGetPersonListFromJSONEmpty
{
    NSArray* personList = [self.provider getPersonListFromJSON:@[]];
    
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(0);
    expect(personList).to.equal(@[]);
}

-(void)testGetPersonListFromJSON
{
    NSArray* personList = [self.provider getPersonListFromJSON:@[@{
                                                                     @"firstName" : @"Иван",
                                                                     @"secondName" : @"Иванович",
                                                                     @"lastName" : @"Иванов",
                                                                     }]];
    
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(1);
    expect(personList.firstObject).to.beInstanceOf([SBTPerson class]);
}


@end



//- (NSArray *)getPersonListFromJSON:(NSArray *)jsonData
//{

//    if (!jsonData)
//    {
//          return nil;
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

