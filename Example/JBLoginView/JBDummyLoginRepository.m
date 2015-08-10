//
//  JBDummyLoginRepository.m
//  JBLoginView
//
//  Created by bartel on 10.08.15.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import "JBDummyLoginRepository.h"
#import <JBLoginDataCommands/IJBLoginLoginAsUserCommand.h>
#import <JBLoginDataCommands/IJBLogin.h>
#import <BlocksKit/BlocksKit.h>

@implementation JBDummyLoginRepository

-(BOOL)isResponsibleForCommand:(NSObject *)command
                         error:(NSError *__autoreleasing *)error{
    
    if([command conformsToProtocol:@protocol(IJBLoginLoginAsUserCommand)]){
        return TRUE;
    }
    
    return FALSE;
}


-(void)getDataForCommand:(NSObject *)command
              completion:(BOOL (^)(NSString *identifier, NSObject *response, NSError *__autoreleasing *error))completion{

    NSObject<>
    
    [NSTimer bk_scheduledTimerWithTimeInterval:2.5 block:^(NSTimer *timer) {
        completion()
    } repeats:NO];
    
}

@end
