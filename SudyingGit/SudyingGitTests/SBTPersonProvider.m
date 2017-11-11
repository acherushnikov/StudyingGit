//
//  SBTPersonProvider.m
//  SudyingGitTests
//
//  Created by Вероника on 11.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "SBTPersonProvider.h"
#import "SBTPerson.h"

@interface SBTPersonProviderTests : XCTestCase
@property(nonatomic,strong) SBTPersonProvider *personProvider;
@end

@implementation SBTPersonProviderTests

- (void)setUp
{
    [super setUp];
    
    self.personProvider = [SBTPersonProvider new];
}

- (void)tearDown
{
    self.personProvider = nil;
    
    [super tearDown];
}
-(void)testGetPersonalListFromJSONNil
{
    NSArray *personList = [self.personProvider getPersonListFromJSON:nil];
    
    expect(personList).to.beNil();
}


-(void)testGetPersonalListFromJSON
{
    NSArray* personList = [self.personProvider getPersonListFromJSON:@[@{@"firstName" : @"M", @"secondName" : @"V", @"lastName" : @"M",}]];
    
    expect(personList.count).to.equal(1);
    expect([personList[0] firstName]).to.equal(@"M");
    expect([personList[0] secondName]).to.equal(@"V");
    expect([personList[0] lastName]).to.equal(@"M");
    
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

