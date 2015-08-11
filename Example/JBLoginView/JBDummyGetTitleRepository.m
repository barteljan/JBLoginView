//
//  JBDummyGetTitleRepository.m
//  JBLoginView
//
//  Created by bartel on 11.08.15.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import "JBDummyGetTitleRepository.h"
#import <JBLoginDataCommands/JBLoginGetTitleResponse.h>

@implementation JBDummyGetTitleRepository

-(BOOL)isResponsibleForCommand:(NSObject *)command
                         error:(NSError *__autoreleasing *)error{
    
    if([command conformsToProtocol:@protocol(IJBLoginGetTitleCommand)]){
        return TRUE;
    }
    
    return FALSE;
}


-(void)getDataForCommand:(NSObject *)command
              completion:(BOOL (^)(NSString *identifier, NSObject *response, NSError *__autoreleasing *error))completion{
    
    
    JBLoginGetTitleResponse* response = [[JBLoginGetTitleResponse alloc] initWithTitle:@"A short greeting to our users!"
                                                                              subTitle:@"Some funny words ..."];
    
    if(completion){
        completion(self.identifier,response,nil);
    }
    
}


@end
