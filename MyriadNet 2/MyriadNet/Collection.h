//
//  Collection.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject
{
//    NSString *domainname;
}

//@property (nonatomic, assign)int ID;
@property (nonatomic, retain)NSString *domainname;

- (id)initWithDomainame:(NSString *)newDomainname;

@end
