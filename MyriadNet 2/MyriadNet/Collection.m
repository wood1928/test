//
//  Collection.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Collection.h"

@implementation Collection
@synthesize domainname;
//@synthesize ID;

- (id)initWithDomainame:(NSString *)newDomainname
{
    if(self = [super init]){
        self.domainname = newDomainname;
    }
    return self;
}

@end
