//
//  JBAppDelegate.m
//  JBLogin
//
//  Created by Jan Bartel on 07/30/2015.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import <VISPER/VISPERWireframe.h>
#import <VISPERComposedApplication/VISPERComposedRepository.h>
#import <VISPERComposedApplication/VISPERComposedPersistenceStore.h>
#import <JBLoginView/JBLoginScreenComposedApplication.h>
#import <VISPER/VISPERModalRoutingPresenter.h>
#import <VISPER/VISPERPushRoutingPresenter.h>
#import <VISPER/VISPERRootVCRoutingPresenter.h>
#import "SuccessViewController.h"
#import "ForgotPasswordViewController.h"
#import "JBAppDelegate.h"
#import <UIColor_HTMLColors/UIColor+HTMLColors.h>

@implementation JBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UINavigationBar appearance].tintColor = [UIColor colorWithCSS:@"#705853"];
    
    self.wireframe = [[VISPERWireframe alloc] init];
    
    [self.wireframe addControllerServiceProvider:self withPriority:0];
    [self.wireframe addRoutingOptionsServiceProvider:self withPriority:0];
    
    [self.wireframe addRoutingPresenter:[[VISPERPushRoutingPresenter alloc]
                                         initWithNavigationController:self.navigationController]
                           withPriority:0];
    
    [self.wireframe addRoutingPresenter:[[VISPERRootVCRoutingPresenter alloc]
                                         initWithNavigationController:self.navigationController]
                           withPriority:0];

    
    VISPERComposedRepository *repository = [[VISPERComposedRepository alloc] init];
    
    VISPERComposedPersistenceStore *store = [[VISPERComposedPersistenceStore alloc] init];
    
    self.composedApplication = [[JBLoginScreenComposedApplication alloc]
                                initWithWireframe:self.wireframe
                                globalRepository:repository
                                globalPersistenceStore:store
                                successRoute:[NSURL URLWithString:@"/login-success"]
                                successRouteParams:@{}
                                failureRoute:[NSURL URLWithString:@"/login-failure"]
                                failureRouteParams:@{}
                                forgotPasswordRoute:[NSURL URLWithString:@"/forgetPassword"]
                                forgotPasswordRouteParams:@{}];
    
    [self.wireframe addRoute:@"/login-success"];
    [self.wireframe addRoute:@"/login-failure"];
    [self.wireframe addRoute:@"/forgetPassword"];
    
    [self.composedApplication bootstrapWireframe:self.wireframe
                                      repository:repository
                                persistenceStore:store];
    
    [self.wireframe routeURL:[NSURL URLWithString:self.composedApplication.startingRoute]];
    
    return YES;
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

-(NSObject<IVISPERRoutingOption>*)optionForRoutePattern:(NSString *)routePattern
                                             parameters:(NSDictionary *)dictionary
                                         currentOptions:(NSObject<IVISPERRoutingOption> *)currentOptions{
    if([routePattern isEqualToString:@"/login-success"]){
        return [self.wireframe pushRoutingOption:YES];
    }
    
    return nil;
}
@end
