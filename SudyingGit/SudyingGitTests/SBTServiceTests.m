//
//  SBTServiceTests.m
//  SudyingGitTests
//
//  Created by admin on 09.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "SBTPersonProvider.h"
#import "SBTService.h"

@interface SBTService(Tests)

- (NSArray *)fakeData;

@end

@interface SBTServiceTests : XCTestCase

@property (nonatomic,strong) SBTService *servises;

@end

@implementation SBTServiceTests

- (void)setUp {
    [super setUp];
    self.servises = OCMPartialMock([SBTService new]);
}

- (void)tearDown {
    self.servises = nil;
    [super tearDown];
}

-(void)testGetPersonListFromProviderNil
{
    //id personProvider = OCMClassMock([SBTPersonProvider class]);
    
    NSArray *personList = [self.servises getPersonListFromProvider:nil];
    
    expect(personList).to.beNil();
}
-(void)testGetPesonListFromProviderFakeDateNil
{
    id personProvider = OCMClassMock([SBTPersonProvider class]);
    OCMStub([self.servises fakeData]).andReturn(nil);
    NSArray *personList = [self.servises getPersonListFromProvider:personProvider];
    expect(personList).to.beNil();
}

-(void)testGetPersonListFromProvider
{
    id personProvider = OCMClassMock([SBTPersonProvider class]);
    
    OCMStub([personProvider getPersonListFromJSON:@[]]).andReturn(@[@"123"]);
    OCMStub([self.servises fakeData]).andReturn(@[]);
    
    NSArray *personList = [self.servises getPersonListFromProvider:personProvider];
    expect(personList).toNot.beNil();
    expect(personList.count).to.equal(1);
    expect(personList.firstObject).to.equal(@"123");

}

//- (NSArray *)getPersonListFromProvider:(SBTPersonProvider *)provider
//{
//    if (!provider)
//    {
//        return nil;
//    }
//
//    NSArray *data = [self fakeData];
//    if (!data)
//    {
//        return nil;
//    }
//
//    return [provider getPersonListFromJSON:data];
//}
@end
