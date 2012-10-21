//
//  DBOperation.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#define FIRSTINIT 1
#import "DBOperation.h"

@implementation DBOperation
@synthesize history;
@synthesize collection;

- (id)init
{
    if(self = [super init]){
        
//#if FIRSTINIT 
        [self DBOpen];
//        [self creatHistotyTable];
//        [self creatCollectionTable];
//#endif
    }
    return self;
}

-(sqlite3 *)DBOpen
{
    if(db){
        return db;
    }
    
    //bundle路径。
    NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"MyDataBase" ofType:@"sqlite"];
    
    NSString *documentPath = [NSHomeDirectory()stringByAppendingPathComponent:@"Documents"];
    //目标路径。
    NSString *targetPath = [documentPath stringByAppendingPathComponent:@"MyDataBase.sqlite"];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    BOOL success = NO;
    if([fm fileExistsAtPath:targetPath]==NO){
        [fm copyItemAtPath:bundlePath
                    toPath:targetPath
                     error:nil];
        success = YES;
        if(success == YES){
            sqlite3_open([targetPath UTF8String], &db);
        }
    }
    sqlite3_open([targetPath UTF8String], &db);
    NSLog(@"dbdbdbdbdb111111%@",db);
    return db;
}

- (BOOL)creatDB
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    filePath = [docPath stringByAppendingPathComponent:@"MyDataBase.sqlite"];
    
    int result = sqlite3_open([filePath UTF8String], &db);
    NSLog(@"result = %d",result);
    if(SQLITE_OK == result){
        sqlite3_close(db);
        NSLog(@"create database ");
        return YES; //创建成功
    }else{
        return NO;  //创建失败
    }
}

- (BOOL)creatHistotyTable
{
    char *error;
    NSString *create = @"create table if not exists history(ID integer primary key autoincrement,Domainame text,type text,time text,result integer)";
    if(create == NULL){
        return NO;
    }
    
    if(sqlite3_open([filePath UTF8String], &db) != SQLITE_OK){
        return NO;
    }
        
    if(SQLITE_OK == sqlite3_exec(db, [filePath UTF8String], NULL, NULL, &error)){
        sqlite3_close(db);
        NSLog(@"create historytable %s",error);
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)creatCollectionTable
{
    char *error;
    //创建表语句
    NSString *collect = @"create table if not exists collection(Domainame text)";
    if(collect == NULL){
        return NO;
    }
    
    if(sqlite3_open([filePath UTF8String], &db) != SQLITE_OK){
        return NO;
    }
    
    if(SQLITE_OK == sqlite3_exec(db, [filePath UTF8String], NULL, NULL, &error)){
        sqlite3_close(db);
        NSLog(@"create collectiontable %s",error);
        return YES; //创建成功22222
    }else{
        NSLog(@"collection table %s",error);
        return NO;  //创建失败 22222
    }
}

- (NSArray *)findHistory
{
    sqlite3_stmt *stmt = nil;
    int theResult = sqlite3_prepare(db, "select * from history", -1, &stmt, NULL);
    if(theResult == SQLITE_OK){
        NSMutableArray *historyArray = [NSMutableArray array];
        while(sqlite3_step(stmt) == SQLITE_ROW){
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *domainame = sqlite3_column_text(stmt, 1);
            const unsigned char *type = sqlite3_column_text(stmt, 2);
            const unsigned char *time = sqlite3_column_text(stmt, 3);
            int result = sqlite3_column_int(stmt, 4);
            
            NSString *theDomainame = [NSString stringWithCString:(const char*)domainame encoding:NSUTF8StringEncoding];
            NSString *theType = [NSString stringWithCString:(const char*)type encoding:NSUTF8StringEncoding];
            NSString *theTime = [NSString stringWithCString:(const char*)time encoding:NSUTF8StringEncoding];
            self.history = [[HistoryRecord alloc]initWithID:ID andDomainName:theDomainame andType:theType andTime:theTime andResult:result];
            [historyArray addObject:self.history];
            [self.history release];
        }
        sqlite3_finalize(stmt);
        return historyArray;
    }
    
    sqlite3_finalize(stmt);
    return nil;
}

- (NSArray *)findCollection
{
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, "select * from collection", -1, &stmt, NULL);
    
    if(result == SQLITE_OK){
        NSMutableArray *collectArray = [NSMutableArray array];
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            const unsigned char *domainname = sqlite3_column_text(stmt, 0);
            NSString *theDomainame = [NSString stringWithCString:(const char *)domainname encoding:NSUTF8StringEncoding];
           self.collection  = [[Collection alloc]initWithDomainame:theDomainame];
            [collectArray addObject:self.collection];
            [self.collection release];
        }
        
        sqlite3_finalize(stmt);
        return collectArray;
    }
    sqlite3_finalize(stmt);
    return nil;
}

- (BOOL)insertHistoryRecord:(HistoryRecord *)historyRecord
{
     NSLog(@"dbdbdbdbdb222222%@",db);
//    char *error;
    sqlite3_stmt *stmt = nil;
    int theResult = sqlite3_step(stmt);
    if(SQLITE_OK != sqlite3_open([filePath UTF8String], &db)){ 
        return NO;
    }
    NSString  *insert = @"insert into history(ID,Domainname,type,time,result) values(?,?,?,?,?);";
    int aaa = sqlite3_prepare(db, [insert UTF8String], -1, &stmt, nil);
    NSLog(@"insert 111212 %d",aaa);
    if(sqlite3_prepare(db, [insert UTF8String], -1, &stmt, nil) == SQLITE_OK){
        
        sqlite3_bind_int(stmt, 1, historyRecord.ID);
        sqlite3_bind_text(stmt, 2, [historyRecord.domainname UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 3, [historyRecord.type UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 4, [historyRecord.time UTF8String], -1, NULL);
        sqlite3_bind_int(stmt, 5, historyRecord.result);
    }else{
        return NO;
    }
    if(SQLITE_DONE == theResult){
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)insertCollection:(Collection *)collectin
{
    sqlite3_stmt *stmt = nil;
    int theResult = sqlite3_step(stmt);
    if(SQLITE_OK != sqlite3_open([filePath UTF8String], &db)){
        return NO;
    }
    char *insert = "insert into collection(Domainname) values(?);";
    
    if(sqlite3_prepare(db, insert, -1, &stmt, nil) == SQLITE_OK){
        sqlite3_bind_text(stmt, 0, [collectin.domainname UTF8String], -1, NULL);
    }else{
        return NO;
    }
    if(SQLITE_DONE == theResult){
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)deleteHistoryRecord:(HistoryRecord *)historyRecord
{
    sqlite3_stmt *stmt = nil;
    int theResult = 0;
    if(SQLITE_OK != sqlite3_open([filePath UTF8String], &db)){
        return NO;
    }
    char *delete = "delete from history where ID = ?";
    
    if(sqlite3_prepare_v2(db, delete, -1, &stmt, NULL) == SQLITE_OK){
        sqlite3_bind_int(stmt, 0, historyRecord.ID);
    }else{
        return NO;
    }
    theResult = sqlite3_step(stmt);
    if(SQLITE_DONE == theResult){
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)deleteCollection:(Collection *)collection
{
    sqlite3_stmt *stmt = nil;
    int theResult = 0;
    if(SQLITE_OK != sqlite3_open([filePath UTF8String], &db)){
        return NO;
    }
    char *delete = "delete * from collection";
    
    if(sqlite3_prepare_v2(db, delete, -1, &stmt, NULL) == SQLITE_OK){
        sqlite3_bind_text(stmt, 0, delete, -1, NULL);
    }else{
        return NO;
    }
    theResult = sqlite3_step(stmt);
    if(SQLITE_DONE == theResult){
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        return YES;
    }else{
        return NO;
    }

}

@end









