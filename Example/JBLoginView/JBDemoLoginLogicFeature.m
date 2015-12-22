//
//  JBDemoLoginLogicFeature.m
//  JBLoginView
//
//  Created by Bartel on 24.08.15.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import "JBDemoLoginLogicFeature.h"

@implementation JBDemoLoginLogicFeature


-(instancetype)init{
    self = [super init];
    if(self){
        [self addRoutePattern:@"/login-success"];
        [self addRoutePattern:@"/forgetPassword"];
    }
    return self;
}

-(UIViewController*)controllerForRoute:(NSString *)routePattern
                        routingOptions:(NSObject<IVISPERRoutingOption> *)options
                        withParameters:(NSDictionary *)parameters{
    if([routePattern isEqualToString:@"/login-success"]){
        return [[SuccessViewController alloc] initWithNibName:@"SuccessViewController"
                                                       bundle:nil];
    }else if([routePattern isEqualToString:@"/forgetPassword"]){
        return [[ForgotPasswordViewController alloc] initWithNibName:@"ForgotPasswordViewController" bundle:nil];
    }
    
    return nil;
}

-(void)bootstrapWireframe:(NSObject<IVISPERWireframe> *)wireframe
               commandBus:(NSObject<IVISPERCommandBus> *)commandBus{
    [super bootstrapWireframe:wireframe
                   commandBus:commandBus];
    
    JBDummyLoginRepository *loginRepository = [[JBDummyLoginRepository alloc] initWithIdentifier:@"dummyLogin"];
    [commandBus addHandler:loginRepository];
    JBDummyGetTitleRepository *titleRepository = [[JBDummyGetTitleRepository alloc] initWithIdentifier:@"dummyLoginTitle"];
    [commandBus addHandler:titleRepository];
    
}

-(NSObject<IVISPERRoutingOption>*)optionForRoutePattern:(NSString *)routePattern
                                             parameters:(NSDictionary *)dictionary
                                         currentOptions:(NSObject<IVISPERRoutingOption> *)currentOptions{
    
   
    
    if([routePattern isEqualToString:@"/login-success"] || [routePattern isEqualToString:@"/forgetPassword"]){
        return [VISPER routingOptionPush:YES];
    }else{
        return currentOptions;
    }
    
}

@end
