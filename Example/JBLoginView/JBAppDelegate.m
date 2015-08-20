////
//  JBAppDelegate.m
//  JBLogin
//
//  Created by Jan Bartel on 07/30/2015.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import <VISPER/VISPERWireframe.h>
#import <VISPER/VISPERComposedRepository.h>
#import <VISPER/VISPERComposedPersistenceStore.h>
#import <JBLoginView/JBLoginScreenComposedApplication.h>
#import <VISPER/VISPERModalRoutingPresenter.h>
#import <VISPER/VISPERPushRoutingPresenter.h>
#import <VISPER/VISPERRootVCRoutingPresenter.h>
#import "SuccessViewController.h"
#import "ForgotPasswordViewController.h"
#import "JBAppDelegate.h"
#import <UIColor_HTMLColors/UIColor+HTMLColors.h>
#import "JBDummyLoginRepository.h"
#import "JBDummyGetTitleRepository.h"
#import <JBLoginView/JBLoginView.h>

@implementation JBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self initializeUIAppeareance];
    
    //setup visper application
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
    
    //add two dummy repositories for mocking the environments responses
    JBDummyLoginRepository *loginRepository = [[JBDummyLoginRepository alloc] initWithIdentifier:@"dummyLogin"];
    [repository addRepository:loginRepository];
    JBDummyGetTitleRepository *titleRepository = [[JBDummyGetTitleRepository alloc] initWithIdentifier:@"dummyLoginTitle"];
    [repository addRepository:titleRepository];
    
    
    //add two routes to navigate when login has been done
    [self.wireframe addRoute:@"/login-success"];
    [self.wireframe addRoute:@"/forgetPassword"];
    
    
    //generate JBLoginScreenApplication
    self.composedApplication = [[JBLoginScreenComposedApplication alloc]
            initWithWireframe:self.wireframe
                   repository:repository
             persistenceStore:store
                 successRoute:[NSURL URLWithString:@"/login-success"]
           successRouteParams:@{}
          forgotPasswordRoute:[NSURL URLWithString:@"/forgetPassword"]
    forgotPasswordRouteParams:@{}];
    
    
    //let JBLoginScreenApplication initialize visper application
    [self.composedApplication bootstrapWireframe:self.wireframe
                                      repository:repository
                                persistenceStore:store];
    
    //route to the login view
    [self.wireframe routeURL:[NSURL URLWithString:self.composedApplication.startingRoute]];
    
    return YES;
}


-(void)initializeUIAppeareance{
    
    
    [UINavigationBar appearance].tintColor = [UIColor colorWithCSS:@"#705853"];
    
    [JBLoginView appearance].mainColor = [UIColor colorWithCSS:@"#F18975"];
    [JBLoginView appearance].darkColor = [UIColor colorWithCSS:@"#705853"];
    [JBLoginView appearance].mainFontColor = [UIColor whiteColor];
    [JBLoginView appearance].darkFontColor = [UIColor whiteColor];
    
    [JBLoginView appearance].titleFont = [UIFont fontWithName:@"Optima-ExtraBlack" size:24.0f];
    [JBLoginView appearance].loginButtonFont = [UIFont fontWithName:@"Optima-ExtraBlack" size:20.0f];
    [JBLoginView appearance].subTitleFont = [UIFont fontWithName:@"Optima-Italic" size:14.0f];
    [JBLoginView appearance].usernameFont = [UIFont fontWithName:@"Optima-Italic" size:16.0f];
    [JBLoginView appearance].passwordFont = [UIFont fontWithName:@"Optima-Italic" size:16.0f];
    [JBLoginView appearance].forgetButtonFont = [UIFont fontWithName:@"Optima-Italic" size:12.0f];
    
    
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
