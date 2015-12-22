//
//  JBDummyLoginRepository.m
//  JBLoginView
//
//  Created by bartel on 10.08.15.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import "JBDummyLoginRepository.h"
#import <JBLoginDataCommands/IJBLoginLoginAsUserCommand.h>
#import <JBLoginDataCommands/JBLoginLoginAsUserResponse.h>

#import <BlocksKit/BlocksKit.h>

@implementation JBDummyLoginRepository

-(BOOL)isResponsibleForCommand:(NSObject *)command
                         error:(NSError *__autoreleasing *)error{
    
    if([command conformsToProtocol:@protocol(IJBLoginLoginAsUserCommand)]){
        return TRUE;
    }
    
    return FALSE;
}


-(void)processCommand:(NSObject *)command
              completion:(BOOL (^)(NSString *identifier, NSObject *response, NSError *__autoreleasing *error))completion{

    NSObject<IJBLoginLoginAsUserCommand> *loginCommand = (NSObject<IJBLoginLoginAsUserCommand> *)command;
    if(loginCommand.username == nil ||
       loginCommand.password == nil ||
       [loginCommand.username isEqualToString:@""] ||
       [loginCommand.password isEqualToString:@""] ){
        
        NSError *error = [NSError errorWithDomain:@"UserInputError" code:25646 userInfo:@{
                                                                                          NSLocalizedDescriptionKey:NSLocalizedString(@"Please enter username and password", @"username or password is empty message")
                                                                                          }];
        
        completion(self.identifier,nil,&error);
        return;
    }
    
    JBLoginLoginAsUserResponse* response = [[JBLoginLoginAsUserResponse alloc] initWithToken:@"550e8400-e29b-11d4-a716-446655440000"];
    
    [NSTimer bk_scheduledTimerWithTimeInterval:2.5 block:^(NSTimer *timer) {
        completion(self.identifier,response,nil);
    } repeats:NO];
    
}

@end
