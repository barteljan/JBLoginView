////
//  JBAppDelegate.m
//  JBLogin
//
//  Created by Jan Bartel on 07/30/2015.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import "JBAppDelegate.h"
#import "JBDemoLoginLogicFeature.h"
#import <JBLoginView/JBLoginViewFeature.h>
#import <UIColor_HTMLColors/UIColor+HTMLColors.h>
#import <JBLoginView/JBLoginView.h>
#import <VISPER/VISPER.h>


@implementation JBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self initializeUIAppeareance];
    
    self.visperApplication = [[VISPERApplication alloc] init];
    
    self.window.rootViewController = self.visperApplication.rootViewController;
    
    JBLoginViewFeature *loginViewFeature = [[JBLoginViewFeature alloc] initWithStartingRoute:@"/login"
                                                                                successRoute:[NSURL URLWithString:@"/login-success"]
                                                                          successRouteParams:@{}
                                                                         forgotPasswordRoute:[NSURL URLWithString:@"/forgetPassword"]
                                                                   forgotPasswordRouteParams:@{}];
    [self.visperApplication addFeature:loginViewFeature];
    
    
    JBDemoLoginLogicFeature *loginLogicFeature = [[JBDemoLoginLogicFeature alloc] init];
    [self.visperApplication addFeature:loginLogicFeature];
    
       
    [self.visperApplication routeURL:[NSURL URLWithString:loginViewFeature.startingRoute]
                      withParameters:nil
                             options:[VISPER routingOptionPresentRootVC:NO]];
    
    return YES;

    
    /*
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

    
    VISPERComposedInteractor *interactor = [[VISPERComposedInteractor alloc] init];
    
    //add two dummy repositories for mocking the environments responses
   
    
    
    //add two routes to navigate when login has been done
        
    //generate JBLoginScreenApplication
    self.composedApplication = [[JBLoginViewFeature alloc]
            initWithStartingRoute:@"/login"
                 successRoute:[NSURL URLWithString:@"/login-success"]
           successRouteParams:@{}
          forgotPasswordRoute:[NSURL URLWithString:@"/forgetPassword"]
    forgotPasswordRouteParams:@{}];
    
    
    //let JBLoginScreenApplication initialize visper application
    [self.composedApplication bootstrapWireframe:self.wireframe
                                      interactor:interactor];
    
    //route to the login view
    [self.wireframe routeURL:[NSURL URLWithString:self.composedApplication.startingRoute]];
    */
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


@end
