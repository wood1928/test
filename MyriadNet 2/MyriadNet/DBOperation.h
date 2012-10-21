//
//  DBOperation.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HistoryRecord.h"
#import "Collection.h"
#include <sqlite3.h>

@interface DBOperation : NSObject
{
    sqlite3 *db;
    NSString *filePath;
}

@property (nonatomic, retain) HistoryRecord *history;
@property (nonatomic, retain) Collection *collection;


- (NSArray *)findHistory;
- (NSArray *)findCollection;
- (BOOL)insertHistoryRecord:(HistoryRecord *)historyRecord;
- (BOOL)insertCollection:(Collection *)collectin;
- (BOOL)deleteHistoryRecord:(HistoryRecord *)historyRecord;
- (BOOL)deleteCollection:(Collection *)collection;
@end
