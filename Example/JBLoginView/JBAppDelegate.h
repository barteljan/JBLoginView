//
//  JBAppDelegate.h
//  JBLogin
//
//  Created by Jan Bartel on 07/30/2015.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

@import UIKit;
#import <VISPER/IVISPERWireframe.h>
#import <JBLoginView/JBLoginScreenComposedApplication.h>
#import <VISPER/IVISPERWireframeViewControllerServiceProvider.h>
#import <VISPER/IVISPERWireframeRoutingOptionsServiceProvider.h>

@interface JBAppDelegate : UIResponder <UIApplicationDelegate,IVISPERWireframeViewControllerServiceProvider,IVISPERWireframeRoutingOptionsServiceProvider>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UINavigationController *navigationController;
@property (strong, nonatomic) NSObject<IVISPERWireframe>*wireframe;
@property (strong, nonatomic) JBLoginScreenComposedApplication *composedApplication;

@end
