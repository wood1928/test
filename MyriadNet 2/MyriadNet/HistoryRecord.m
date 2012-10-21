//
//  HistoryRecord.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "HistoryRecord.h"

@implementation HistoryRecord
@synthesize ID;
@synthesize result;
@synthesize domainname;
@synthesize time;
@synthesize type;

- (id)initWithID:(int)newID andDomainName:(NSString *)newDomainname andType:(NSString *)newType andTime:(NSString *)newTime andResult:(int)newResult
{
    if(self = [super init]){
        self.ID = newID;
        self.domainname = newDomainname;
        self.type = newType;
        self.time = newTime;
        self.result = newResult;
    }
    return  self;
}

@end
