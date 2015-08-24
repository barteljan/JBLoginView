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
               interactor:(NSObject<IVISPERComposedInteractor> *)interactor{
    [super bootstrapWireframe:wireframe
                   interactor:interactor];
    
    JBDummyLoginRepository *loginRepository = [[JBDummyLoginRepository alloc] initWithIdentifier:@"dummyLogin"];
    [interactor addInteractor:loginRepository];
    JBDummyGetTitleRepository *titleRepository = [[JBDummyGetTitleRepository alloc] initWithIdentifier:@"dummyLoginTitle"];
    [interactor addInteractor:titleRepository];
    
}

-(NSObject<IVISPERRoutingOption>*)optionForRoutePattern:(NSString *)routePattern
                                             parameters:(NSDictionary *)dictionary
                                         currentOptions:(NSObject<IVISPERRoutingOption> *)currentOptions{
    
    if(currentOptions){
        return currentOptions;
    }
    
    if([routePattern isEqualToString:@"/login-success"] || [routePattern isEqualToString:@"/forgetPassword"]){
        return [VISPER routingOptionPush:YES];
    }
    
    return nil;
}

@end
