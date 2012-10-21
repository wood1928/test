//
//  HistoryRecord.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryRecord : NSObject
{
//    int ID;
//    NSString *domainname;
//    NSString *type;
//    NSString *time;
//    int result;
}

@property (nonatomic, retain) NSString *domainname;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, assign) int ID;
@property (nonatomic, assign) int result;

- (id)initWithID:(int)newID andDomainName:(NSString *)newDomainname andType:(NSString *)newType andTime:(NSString *)newTime andResult:(int)newResult;

@end
