//
//  SBTPersonProviderTests.m
//  SudyingGit
//
//  Created by Константин on 10.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPerson.h"
#import "SBTService.h"
#import "SBTPersonProvider.h"




@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider* personProvider;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    
    self.personProvider = OCMPartialMock([SBTPersonProvider new]);
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.personProvider = nil;
    [super tearDown];
}



- (void)testGetPersonListFromJSONisNil
{
    NSArray* personListFromJson = [self.personProvider getPersonListFromJSON:nil];
    
    expect(personListFromJson).to.beNil();
    
}

- (void)testGetPersonListFromJSONNotToBeNil
{
    
    id person = OCMClassMock([SBTPerson class]);
    
        NSDictionary *personDictionary =@{
                                          @"firstName" : @"Andrey",
                                          @"secondName" : @"Borisovich",
                                          @"lastName" : @"Jobs",
                                          };
    
    NSArray* personArray = [NSArray arrayWithObjects:personDictionary, nil];
    
    NSArray* personListFromJson = [self.personProvider getPersonListFromJSON:personArray];
    
    person = [personListFromJson firstObject];
    
    expect([person firstName]).to.equal(@"Andrey");
    expect([person secondName]).to.equal(@"Borisovich");
    expect([person lastName]).to.equal(@"Jobs");

}

@end

//@interface SBTPerson : NSObject
//
//@property (nonatomic, copy) NSString *firstName;
//@property (nonatomic, copy) NSString *secondName;
//@property (nonatomic, copy) NSString *lastName;
//
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
