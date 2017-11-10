//
//  SBTPersonProviderTests.m
//  SudyingGitTests
//
//  Created by Maria Semakova on 11/10/17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>

#import "SBTPersonProvider.h"
#import "SBTPerson.h"

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

- (void)testGetPersonListFromJSONNil {
    
    NSArray *personList = [self.personProvider getPersonListFromJSON:nil];
    expect(personList).to.beNil();
}

- (void)testGetPersonListFromJSONjsonDataEmpty {

    NSArray *personList = [self.personProvider getPersonListFromJSON:@[]];
    expect(personList).toNot.beNil();
    expect(personList).to.equal(@[]);
}

- (void)testGetPersonListFromJSONWrongKeys {
    
    NSArray *jsonData = @[@{@"firstName" : @"First",
                          @"second" : @"Second",
                          @"lastName" : @"Last" }];
    
    NSArray <SBTPerson *> *personList = [self.personProvider getPersonListFromJSON:jsonData];
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(1);
    expect(personList.firstObject.firstName).to.equal(@"First");
    expect(personList.firstObject.secondName).to.beNil();
    expect(personList.firstObject.lastName).to.equal(@"Last");
}

- (void)testGetPersonListFromJSONOnePerson {
    NSArray *jsonData = @[@{@"firstName" : @"First",
                            @"secondName" : @"Second",
                            @"lastName" : @"Last" }];
    
    NSArray <SBTPerson *> *personList = [self.personProvider getPersonListFromJSON:jsonData];
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(1);
    expect(personList.firstObject.firstName).to.equal(@"First");
    expect(personList.firstObject.secondName).to.equal(@"Second");
    expect(personList.firstObject.lastName).to.equal(@"Last");
}

- (void)testGetPersonListFromJSONTwoPersons {
    NSArray *jsonData = @[@{@"firstName" : @"First",
                            @"secondName" : @"Second",
                            @"lastName" : @"Last" },
                          @{@"firstName" : @"First",
                            @"secondName" : @"Second",
                            @"lastName" : @"Last" }];
    
    NSArray <SBTPerson *> *personList = [self.personProvider getPersonListFromJSON:jsonData];
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(2);
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

